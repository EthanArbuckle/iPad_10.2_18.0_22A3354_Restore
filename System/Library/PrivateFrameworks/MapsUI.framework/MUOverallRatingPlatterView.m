@implementation MUOverallRatingPlatterView

- (MUOverallRatingPlatterView)initWithFrame:(CGRect)a3
{
  MUOverallRatingPlatterView *v3;
  MUOverallRatingPlatterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUOverallRatingPlatterView;
  v3 = -[MUOverallRatingPlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUOverallRatingPlatterView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("OverallRatingPlatter"));
    -[MUOverallRatingPlatterView _setupSubviews](v4, "_setupSubviews");
    -[MUOverallRatingPlatterView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupSubviews
{
  UILabel *v3;
  UILabel *attributionLabel;
  UILabel *v5;
  UILabel *starLabel;
  UILabel *v7;
  UILabel *ratingLabel;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v3 = (UILabel *)objc_claimAutoreleasedReturnValue();
  attributionLabel = self->_attributionLabel;
  self->_attributionLabel = v3;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel set_mapsui_numberOfLines:](self->_attributionLabel, "set_mapsui_numberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_attributionLabel, "setAccessibilityIdentifier:", CFSTR("OverallRatingPlatterAttribution"));
  -[MUOverallRatingPlatterView addSubview:](self, "addSubview:", self->_attributionLabel);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v5 = (UILabel *)objc_claimAutoreleasedReturnValue();
  starLabel = self->_starLabel;
  self->_starLabel = v5;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_starLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel set_mapsui_numberOfLines:](self->_starLabel, "set_mapsui_numberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_starLabel, "setAccessibilityIdentifier:", CFSTR("OverallRatingPlatterStarLabel"));
  -[MUOverallRatingPlatterView addSubview:](self, "addSubview:", self->_starLabel);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v7 = (UILabel *)objc_claimAutoreleasedReturnValue();
  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_ratingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel set_mapsui_numberOfLines:](self->_ratingLabel, "set_mapsui_numberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_ratingLabel, "setAccessibilityIdentifier:", CFSTR("OverallRatingPlatterRatingLabel"));
  -[MUOverallRatingPlatterView addSubview:](self, "addSubview:", self->_ratingLabel);
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)-[MUOverallRatingPlatterView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v10, sel__contentSizeDidChange);

  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)-[MUOverallRatingPlatterView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v13, sel__updateAttribution);

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
  _QWORD v35[12];

  v35[10] = *MEMORY[0x1E0C80C00];
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel topAnchor](self->_attributionLabel, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView topAnchor](self, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  -[UILabel leadingAnchor](self->_attributionLabel, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView leadingAnchor](self, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 16.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v29;
  -[UILabel trailingAnchor](self->_attributionLabel, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView trailingAnchor](self, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, -16.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v26;
  -[UILabel bottomAnchor](self->_attributionLabel, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_starLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:constant:", v24, -8.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v22;
  -[UILabel leadingAnchor](self->_starLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView leadingAnchor](self, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v19;
  -[UILabel trailingAnchor](self->_starLabel, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView trailingAnchor](self, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v16;
  -[UILabel bottomAnchor](self->_starLabel, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel topAnchor](self->_ratingLabel, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v13;
  -[UILabel leadingAnchor](self->_ratingLabel, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v5;
  -[UILabel trailingAnchor](self->_ratingLabel, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v8;
  -[UILabel bottomAnchor](self->_ratingLabel, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -16.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v12);

}

- (void)addSelectionGestureWithTarget:(id)a3 action:(SEL)a4
{
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *tapGestureRecognizer;
  id v8;

  v8 = a3;
  if (self->_tapGestureRecognizer)
    -[MUOverallRatingPlatterView removeGestureRecognizer:](self, "removeGestureRecognizer:");
  v6 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v8, a4);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v6;

  -[MUOverallRatingPlatterView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUOverallRatingPlatterViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUOverallRatingPlatterView _updateAppearance](self, "_updateAppearance");
  }

}

- (NSAttributedString)ratingString
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MUOverallRatingPlatterViewModel rating](self->_viewModel, "rating");
  objc_msgSend(v4, "localizedStringWithFormat:", CFSTR("%.1f"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:", v6);

  v8 = *MEMORY[0x1E0DC4B58];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1420];
  objc_msgSend(v9, "_mapkit_fontWithWeight:", *MEMORY[0x1E0DC1420]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView _attributesWithFont:color:](self, "_attributesWithFont:color:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v7;
  objc_msgSend(v7, "addAttributes:range:", v13, 0, objc_msgSend(v7, "length"));

  v35 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MUOverallRatingPlatterViewModel numberOfVotes](self->_viewModel, "numberOfVotes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringFromNumber:", v14);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3940];
  _MULocalizedStringFromThisBundle(CFSTR("(%@) [Number of Votes]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v16, v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v33);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView _attributesWithFont:color:](self, "_attributesWithFont:color:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAttributes:range:", v20, 0, objc_msgSend(v17, "length"));

  v21 = (void *)objc_msgSend(v7, "copy");
  v36[0] = v21;
  v22 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_mapkit_fontWithWeight:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView _attributesWithFont:color:](self, "_attributesWithFont:color:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v22, "initWithString:attributes:", CFSTR(" "), v26);
  v36[1] = v27;
  v28 = (void *)objc_msgSend(v17, "copy");
  v36[2] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MapsUILayout buildAttributedDisplayStringForComponents:](MapsUILayout, "buildAttributedDisplayStringForComponents:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v30;
}

- (NSAttributedString)starString
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CC1968];
  -[MUOverallRatingPlatterViewModel rating](self->_viewModel, "rating");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0CC17C0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "largeTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUOverallRatingPlatterView mk_theme](self, "mk_theme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ratingAsAttributedString:baseFont:style:theme:", v7, 2, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v9;
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

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  id v5;

  -[MUOverallRatingPlatterViewModel attributionText](self->_viewModel, "attributionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_attributionLabel, "setAttributedText:", v3);

  -[MUOverallRatingPlatterView starString](self, "starString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_starLabel, "setAttributedText:", v4);

  -[MUOverallRatingPlatterView ratingString](self, "ratingString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_ratingLabel, "setAttributedText:", v5);

}

- (void)_contentSizeDidChange
{
  void *v3;
  id v4;

  -[MUOverallRatingPlatterViewModel attributionText](self->_viewModel, "attributionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_attributionLabel, "setAttributedText:", v3);

  -[MUOverallRatingPlatterView starString](self, "starString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_starLabel, "setAttributedText:", v4);

}

- (void)_updateAttribution
{
  id v3;

  -[MUOverallRatingPlatterViewModel attributionText](self->_viewModel, "attributionText");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_attributionLabel, "setAttributedText:", v3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 150.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MUOverallRatingPlatterViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_starLabel, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);
}

@end
