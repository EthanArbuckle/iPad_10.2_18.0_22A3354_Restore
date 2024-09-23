@implementation MUCuratedCollectionSummaryView

- (MUCuratedCollectionSummaryView)initWithFrame:(CGRect)a3
{
  MUCuratedCollectionSummaryView *v3;
  MUCuratedCollectionSummaryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUCuratedCollectionSummaryView;
  v3 = -[MUCuratedCollectionSummaryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUCuratedCollectionSummaryView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionSummary"));
    -[MUCuratedCollectionSummaryView _setupSubviews](v4, "_setupSubviews");
    -[MUCuratedCollectionSummaryView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUCuratedCollectionSummary isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUCuratedCollectionSummaryView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_setupSubviews
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  UILabel *v7;
  UILabel *descriptionLabel;
  void *v9;
  id v10;
  UIImageView *v11;
  UIImageView *imageView;
  UILayoutGuide *v13;
  UILayoutGuide *layoutGuide;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1420]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionSummaryTitle"));
  -[MUCuratedCollectionSummaryView addSubview:](self, "addSubview:", self->_titleLabel);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v9);

  -[UILabel setAccessibilityIdentifier:](self->_descriptionLabel, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionSummaryDescription"));
  -[MUCuratedCollectionSummaryView addSubview:](self, "addSubview:", self->_descriptionLabel);
  v10 = objc_alloc(MEMORY[0x1E0DC3890]);
  v11 = (UIImageView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imageView = self->_imageView;
  self->_imageView = v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setClipsToBounds:](self->_imageView, "setClipsToBounds:", 1);
  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", 4.0);
  -[UIImageView setAccessibilityIdentifier:](self->_imageView, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionSummaryImage"));
  -[MUCuratedCollectionSummaryView addSubview:](self, "addSubview:", self->_imageView);
  v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v13;

  -[MUCuratedCollectionSummaryView addLayoutGuide:](self, "addLayoutGuide:", self->_layoutGuide);
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)-[MUCuratedCollectionSummaryView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v16, sel__updateImageViewForInterfaceStyle);

  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)-[MUCuratedCollectionSummaryView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v19, sel__contentSizeDidChange);

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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[20];

  v57[18] = *MEMORY[0x1E0C80C00];
  v36 = (void *)MEMORY[0x1E0CB3718];
  -[UIImageView leadingAnchor](self->_imageView, "leadingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView leadingAnchor](self, "leadingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v54;
  -[UIImageView topAnchor](self->_imageView, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView topAnchor](self, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintGreaterThanOrEqualToAnchor:", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v51;
  -[UIImageView centerYAnchor](self->_imageView, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView centerYAnchor](self, "centerYAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v48;
  -[UIImageView bottomAnchor](self->_imageView, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView bottomAnchor](self, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintLessThanOrEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[3] = v45;
  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToConstant:", 36.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v57[4] = v43;
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToConstant:", 36.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v57[5] = v41;
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView trailingAnchor](self->_imageView, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 8.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v57[6] = v38;
  -[UILayoutGuide topAnchor](self->_layoutGuide, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView topAnchor](self, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57[7] = v34;
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView bottomAnchor](self, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57[8] = v31;
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView trailingAnchor](self, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57[9] = v28;
  -[UILayoutGuide centerYAnchor](self->_layoutGuide, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView centerYAnchor](self, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v57[10] = v25;
  -[UILabel topAnchor](self->_titleLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_layoutGuide, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v57[11] = v22;
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v57[12] = v19;
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57[13] = v16;
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_descriptionLabel, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v57[14] = v13;
  -[UILabel leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_layoutGuide, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57[15] = v5;
  -[UILabel trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_layoutGuide, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v57[16] = v8;
  -[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_layoutGuide, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57[17] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v12);

}

- (void)_updateAppearance
{
  MUCuratedCollectionSummary *viewModel;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  viewModel = self->_viewModel;
  -[MUCuratedCollectionSummaryView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummary publisherIconForIsNightMode:](viewModel, "publisherIconForIsNightMode:", objc_msgSend(v4, "userInterfaceStyle") == 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v5);

  -[MUCuratedCollectionSummary collectionName](self->_viewModel, "collectionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_titleLabel, "setText:", v6);

  -[MUCuratedCollectionSummaryView publisherString](self, "publisherString");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v7);

}

- (id)_attributesWithFont:(id)a3 color:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DC1140];
  v11[0] = *MEMORY[0x1E0DC1138];
  v11[1] = v5;
  v12[0] = a3;
  v12[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1420]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  -[MUCuratedCollectionSummaryView publisherString](self, "publisherString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_descriptionLabel, "setAttributedText:", v5);

}

- (id)publisherString
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUCuratedCollectionSummary publisherName](self->_viewModel, "publisherName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  v6 = 0x1E0CB3000uLL;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3778]);
    -[MUCuratedCollectionSummary publisherName](self->_viewModel, "publisherName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

    v10 = *MEMORY[0x1E0DC4AB8];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCuratedCollectionSummaryView _attributesWithFont:color:](self, "_attributesWithFont:color:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCuratedCollectionSummary publisherName](self->_viewModel, "publisherName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAttributes:range:", v13, 0, objc_msgSend(v14, "length"));

    objc_msgSend(v3, "addObject:", v9);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" · "));
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUCuratedCollectionSummaryView _attributesWithFont:color:](self, "_attributesWithFont:color:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAttributes:range:", v18, 0, objc_msgSend(v15, "length"));

    v6 = 0x1E0CB3000;
    v19 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "addObject:", v19);

  }
  else
  {
    v10 = *MEMORY[0x1E0DC4AB8];
  }
  _MULocalizedStringFromThisBundle(CFSTR("Number of places [Placecard]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%lu"), 0, -[MUCuratedCollectionSummary numberOfPlaces](self->_viewModel, "numberOfPlaces"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 1912)), "initWithString:", v21);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle secondaryTextColor](MUInfoCardStyle, "secondaryTextColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummaryView _attributesWithFont:color:](self, "_attributesWithFont:color:", v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAttributes:range:", v25, 0, objc_msgSend(v22, "length"));

  v26 = (void *)objc_msgSend(v22, "copy");
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)objc_msgSend(v3, "copy");
  +[MapsUILayout buildAttributedDisplayStringForComponents:forContainingView:](MapsUILayout, "buildAttributedDisplayStringForComponents:forContainingView:", v27, self);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)_updateImageViewForInterfaceStyle
{
  MUCuratedCollectionSummary *viewModel;
  void *v4;
  id v5;

  viewModel = self->_viewModel;
  -[MUCuratedCollectionSummaryView traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MUCuratedCollectionSummary publisherIconForIsNightMode:](viewModel, "publisherIconForIsNightMode:", objc_msgSend(v5, "userInterfaceStyle") != 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_imageView, "setImage:", v4);

}

- (MUCuratedCollectionSummary)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
