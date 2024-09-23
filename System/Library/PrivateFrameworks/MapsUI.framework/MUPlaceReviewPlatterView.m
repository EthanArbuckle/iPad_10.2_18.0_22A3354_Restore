@implementation MUPlaceReviewPlatterView

- (MUPlaceReviewPlatterView)initWithFrame:(CGRect)a3
{
  MUPlaceReviewPlatterView *v3;
  MUPlaceReviewPlatterView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUPlaceReviewPlatterView;
  v3 = -[MUPlaceReviewPlatterView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MUPlaceReviewPlatterView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("PlaceReviewPlatter"));
    -[MUPlaceReviewPlatterView _setupSubviews](v4, "_setupSubviews");
    -[MUPlaceReviewPlatterView _setupConstraints](v4, "_setupConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)_setupSubviews
{
  MULabelViewProtocol *v3;
  MULabelViewProtocol *reviewTextView;
  void *v5;
  UILabel *v6;
  UILabel *starLabel;
  MULabelViewProtocol *v8;
  MULabelViewProtocol *userLabel;
  id v10;
  UIImageView *v11;
  UIImageView *userAvatarImageView;
  UILayoutGuide *v13;
  UILayoutGuide *userLabelLayoutGuide;
  UITapGestureRecognizer *v15;
  UITapGestureRecognizer *tapGestureRecognizer;

  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  reviewTextView = self->_reviewTextView;
  self->_reviewTextView = v3;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_reviewTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setNumberOfLines:](self->_reviewTextView, "setNumberOfLines:", 4);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_reviewTextView, "setFont:", v5);

  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_reviewTextView, "setAccessibilityIdentifier:", CFSTR("PlaceReviewPlatterReviewText"));
  -[MUPlaceReviewPlatterView addSubview:](self, "addSubview:", self->_reviewTextView);
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v6 = (UILabel *)objc_claimAutoreleasedReturnValue();
  starLabel = self->_starLabel;
  self->_starLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_starLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel set_mapsui_numberOfLines:](self->_starLabel, "set_mapsui_numberOfLines:", 1);
  -[UILabel setAccessibilityIdentifier:](self->_starLabel, "setAccessibilityIdentifier:", CFSTR("PlaceReviewPlatterStarLabel"));
  -[MUPlaceReviewPlatterView addSubview:](self, "addSubview:", self->_starLabel);
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v8 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  userLabel = self->_userLabel;
  self->_userLabel = v8;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_userLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setNumberOfLines:](self->_userLabel, "setNumberOfLines:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_userLabel, "setAccessibilityIdentifier:", CFSTR("PlaceReviewPlatterUserLabel"));
  -[MUPlaceReviewPlatterView addSubview:](self, "addSubview:", self->_userLabel);
  v10 = objc_alloc(MEMORY[0x1E0DC3890]);
  v11 = (UIImageView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  userAvatarImageView = self->_userAvatarImageView;
  self->_userAvatarImageView = v11;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_userAvatarImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIgnoresInvertColors:](self->_userAvatarImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIImageView setContentMode:](self->_userAvatarImageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](self->_userAvatarImageView, "setClipsToBounds:", 1);
  -[UIImageView _setCornerRadius:](self->_userAvatarImageView, "_setCornerRadius:", 18.0);
  -[UIImageView setAccessibilityIdentifier:](self->_userAvatarImageView, "setAccessibilityIdentifier:", CFSTR("PlaceReviewPlatterUserAvatar"));
  -[MUPlaceReviewPlatterView addSubview:](self, "addSubview:", self->_userAvatarImageView);
  v13 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  userLabelLayoutGuide = self->_userLabelLayoutGuide;
  self->_userLabelLayoutGuide = v13;

  -[MUPlaceReviewPlatterView addLayoutGuide:](self, "addLayoutGuide:", self->_userLabelLayoutGuide);
  v15 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v15;

  -[MUPlaceReviewPlatterView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[UITapGestureRecognizer addTarget:action:](self->_tapGestureRecognizer, "addTarget:action:", self, sel__platterTapped);
  -[UIView _mapsui_addSelectGestureRecognizerWithTarget:action:](self, "_mapsui_addSelectGestureRecognizerWithTarget:action:", self, sel__platterTapped);
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[22];

  v63[20] = *MEMORY[0x1E0C80C00];
  v41 = (void *)MEMORY[0x1E0CB3718];
  -[MULabelViewProtocol topAnchor](self->_reviewTextView, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView topAnchor](self, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 14.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v60;
  -[MULabelViewProtocol leadingAnchor](self->_reviewTextView, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView leadingAnchor](self, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 16.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v57;
  -[MULabelViewProtocol trailingAnchor](self->_reviewTextView, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView trailingAnchor](self, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -16.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v54;
  -[MULabelViewProtocol bottomAnchor](self->_reviewTextView, "bottomAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_userLabelLayoutGuide, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:constant:", v52, -12.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v51;
  -[UIImageView leadingAnchor](self->_userAvatarImageView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView leadingAnchor](self, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 16.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v48;
  -[UIImageView topAnchor](self->_userAvatarImageView, "topAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol bottomAnchor](self->_reviewTextView, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintGreaterThanOrEqualToAnchor:constant:", v46, 16.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v45;
  -[UIImageView centerYAnchor](self->_userAvatarImageView, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide centerYAnchor](self->_userLabelLayoutGuide, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v63[6] = v42;
  -[UIImageView bottomAnchor](self->_userAvatarImageView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView bottomAnchor](self, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:constant:", v39, -14.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v63[7] = v38;
  -[UIImageView widthAnchor](self->_userAvatarImageView, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToConstant:", 36.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v63[8] = v36;
  -[UIImageView heightAnchor](self->_userAvatarImageView, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToConstant:", 36.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[9] = v34;
  -[UIImageView trailingAnchor](self->_userAvatarImageView, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_userLabelLayoutGuide, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, -8.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v63[10] = v31;
  -[UILabel leadingAnchor](self->_starLabel, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_userLabelLayoutGuide, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v63[11] = v28;
  -[UILabel trailingAnchor](self->_starLabel, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_userLabelLayoutGuide, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63[12] = v25;
  -[UILabel topAnchor](self->_starLabel, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide topAnchor](self->_userLabelLayoutGuide, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v63[13] = v22;
  -[MULabelViewProtocol leadingAnchor](self->_userLabel, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide leadingAnchor](self->_userLabelLayoutGuide, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v63[14] = v19;
  -[MULabelViewProtocol trailingAnchor](self->_userLabel, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide trailingAnchor](self->_userLabelLayoutGuide, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v63[15] = v16;
  -[MULabelViewProtocol topAnchor](self->_userLabel, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_starLabel, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v63[16] = v13;
  -[MULabelViewProtocol bottomAnchor](self->_userLabel, "bottomAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILayoutGuide bottomAnchor](self->_userLabelLayoutGuide, "bottomAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63[17] = v5;
  -[UILayoutGuide trailingAnchor](self->_userLabelLayoutGuide, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[18] = v8;
  -[UILayoutGuide bottomAnchor](self->_userLabelLayoutGuide, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63[19] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activateConstraints:", v12);

}

- (void)_platterTapped
{
  void *v3;
  void (**v4)(void);

  -[MUPlaceReviewPlatterView actionHandler](self, "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPlaceReviewPlatterView actionHandler](self, "actionHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlaceReviewViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceReviewPlatterView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_updateAppearance
{
  void *v3;
  void *v4;
  void *v5;
  MUPlaceReviewViewModel *viewModel;
  _QWORD v7[4];
  id v8;
  id location;

  -[MUPlaceReviewViewModel reviewText](self->_viewModel, "reviewText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setText:](self->_reviewTextView, "setText:", v3);

  -[MUPlaceReviewPlatterView userLabelString](self, "userLabelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_userLabel, "setAttributedText:", v4);

  -[MUPlaceReviewPlatterView starString](self, "starString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_starLabel, "setAttributedText:", v5);

  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke;
  v7[3] = &unk_1E2E02410;
  objc_copyWeak(&v8, &location);
  -[MUPlaceReviewViewModel loadUserIconWithPointSize:completion:](viewModel, "loadUserIconWithPointSize:completion:", v7, 36.0, 36.0);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 55);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke_2;
    v7[3] = &unk_1E2E01730;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "_mapsui_performImageLoadingTransitionWithAnimations:completion:", v7, 0);

  }
}

uint64_t __45__MUPlaceReviewPlatterView__updateAppearance__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setImage:", *(_QWORD *)(a1 + 40));
}

- (NSAttributedString)userLabelString
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[MUPlaceReviewViewModel authorText](self->_viewModel, "authorText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v7 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle textColor](MUInfoCardStyle, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView _attributesWithFont:color:](self, "_attributesWithFont:color:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewViewModel authorText](self->_viewModel, "authorText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttributes:range:", v10, 0, objc_msgSend(v11, "length"));

  if (objc_msgSend(v6, "length"))
  {
    v12 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "addObject:", v12);

  }
  if (qword_1ED01B708 != -1)
    dispatch_once(&qword_1ED01B708, &__block_literal_global_12);
  v13 = (void *)_MergedGlobals_9;
  -[MUPlaceReviewViewModel reviewDate](self->_viewModel, "reviewDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_mapkit_roundedPastUnitsStringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v15);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.470588237, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView _attributesWithFont:color:](self, "_attributesWithFont:color:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttributes:range:", v19, 0, objc_msgSend(v15, "length"));

  if (objc_msgSend(v3, "count") && objc_msgSend(v15, "length"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" · "));
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.470588237, 1.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceReviewPlatterView _attributesWithFont:color:](self, "_attributesWithFont:color:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttributes:range:", v23, 0, objc_msgSend(v20, "length"));

    objc_msgSend(v3, "addObject:", v20);
  }
  if (objc_msgSend(v15, "length"))
  {
    v24 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "addObject:", v24);

  }
  v25 = (void *)objc_msgSend(v3, "copy");
  +[MapsUILayout buildAttributedDisplayStringForComponents:forContainingView:](MapsUILayout, "buildAttributedDisplayStringForComponents:forContainingView:", v25, self->_userLabel);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v26;
}

void __43__MUPlaceReviewPlatterView_userLabelString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_9, "setTimeStyle:", 0);
  objc_msgSend((id)_MergedGlobals_9, "setDateStyle:", 1);
  objc_msgSend((id)_MergedGlobals_9, "setDoesRelativeDateFormatting:", 1);
  v2 = (void *)_MergedGlobals_9;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

- (NSAttributedString)starString
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CC1968];
  -[MUPlaceReviewViewModel normalizedScore](self->_viewModel, "normalizedScore");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterView mk_theme](self, "mk_theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ratingAsAttributedString:baseFont:style:theme:", v6, 2, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v8;
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

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setFont:](self->_reviewTextView, "setFont:", v3);

  -[MUPlaceReviewPlatterView userLabelString](self, "userLabelString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol setAttributedText:](self->_userLabel, "setAttributedText:", v4);

  -[MUPlaceReviewPlatterView starString](self, "starString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_starLabel, "setAttributedText:", v5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 307.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (MUPlaceReviewViewModel)viewModel
{
  return self->_viewModel;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userLabelLayoutGuide, 0);
  objc_storeStrong((id *)&self->_userAvatarImageView, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_starLabel, 0);
  objc_storeStrong((id *)&self->_reviewTextView, 0);
}

@end
