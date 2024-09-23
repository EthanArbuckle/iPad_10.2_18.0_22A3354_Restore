@implementation MKExploreGuidesView

- (MKExploreGuidesView)initWithExploreGuides:(id)a3 tapHandler:(id)a4
{
  id v7;
  id v8;
  MKExploreGuidesView *v9;
  MKExploreGuidesView *v10;
  uint64_t v11;
  id tapHandler;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MKExploreGuidesView;
  v9 = -[MKExploreGuidesView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exploreGuide, a3);
    v11 = MEMORY[0x18D778DB8](v8);
    tapHandler = v10->_tapHandler;
    v10->_tapHandler = (id)v11;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesView setBackgroundColor:](v10, "setBackgroundColor:", v13);

    -[MKExploreGuidesView setClipsToBounds:](v10, "setClipsToBounds:", 1);
    v14 = *MEMORY[0x1E0CEB538];
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", *MEMORY[0x1E0CEB538], *MEMORY[0x1E0CEB5F8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesView setDefaultTitleFont:](v10, "setDefaultTitleFont:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA5F8]), "initForTextStyle:", v14);
    -[MKExploreGuidesView defaultTitleFont](v10, "defaultTitleFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scaledFontForFont:maximumPointSize:", v17, 36.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesView setMaxSupportedTitleFont:](v10, "setMaxSupportedTitleFont:", v18);

    -[MKExploreGuidesView setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", CFSTR("ExploreGuidesView"));
    -[MKExploreGuidesView setupSubviews](v10, "setupSubviews");
    -[MKExploreGuidesView setupConstraints](v10, "setupConstraints");
    -[MKExploreGuidesView updateUI](v10, "updateUI");
    v23[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)-[MKExploreGuidesView registerForTraitChanges:withAction:](v10, "registerForTraitChanges:withAction:", v19, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v10;
}

+ (double)defaultHeight
{
  return 85.0;
}

- (void)updateUI
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSComparisonResult v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[MKExploreGuidesView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  -[MKExploreGuidesView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == 2)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  -[MKExploreGuidesView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIContentSizeCategoryCompareToCategory(v8, (UIContentSizeCategory)*MEMORY[0x1E0CEB3F8]);

  -[MKExploreGuidesView subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 == NSOrderedAscending)
  {
    objc_msgSend(v10, "setHidden:", 0);

    -[MKExploreGuidesView defaultTitleFont](self, "defaultTitleFont");
  }
  else
  {
    objc_msgSend(v10, "setHidden:", 1);

    -[MKExploreGuidesView maxSupportedTitleFont](self, "maxSupportedTitleFont");
  }
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a4;
  -[MKExploreGuidesView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceStyle");
  v8 = objc_msgSend(v5, "userInterfaceStyle");

  if (v7 != v8)
    -[MKExploreGuidesView updateUI](self, "updateUI");
}

- (void)setupSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView setButton:](self, "setButton:", v3);

  -[MKExploreGuidesView button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKExploreGuidesView button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", 10.0);

  -[MKExploreGuidesView button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel_didSelectExploreGuides_, 0x2000);

  -[MKExploreGuidesView button](self, "button");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView addSubview:](self, "addSubview:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CEA9E0]);
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKExploreGuidesView setLabelsStack:](self, "setLabelsStack:", v9);

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxis:", 1);

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDistribution:", 0);

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlignment:", 0);

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("ExploreGuidesLabelStack"));

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView addSubview:](self, "addSubview:", v16);

  v29 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v29, "setNumberOfLines:", 1);
  -[MKExploreGuidesView defaultTitleFont](self, "defaultTitleFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFont:", v17);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextColor:", v18);

  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _MKLocalizedStringFromThisBundle(CFSTR("[Curated Collections] Explore Guides Title"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v19);

  objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("ExploreGuidesTitle"));
  -[MKExploreGuidesView setTitleLabel:](self, "setTitleLabel:", v29);
  objc_msgSend(v29, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityLabel:", v20);

  -[MKExploreGuidesView button](self, "button");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("ExploreGuidesButton"));

  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addArrangedSubview:", v29);

  v24 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v24, "setNumberOfLines:", 1);
  objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB590]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v25);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTextColor:", v26);

  _MKLocalizedStringFromThisBundle(CFSTR("[Curated Collections] Explore Guide Subtitle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v27);

  objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("ExploreGuidesSubtitle"));
  -[MKExploreGuidesView setSubtitleLabel:](self, "setSubtitleLabel:", v24);
  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addArrangedSubview:", v24);

  -[MKExploreGuidesView setupImage](self, "setupImage");
}

- (void)setupImage
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v3 = objc_alloc(MEMORY[0x1E0CEA658]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[MKExploreGuidesView setImageView:](self, "setImageView:", v4);

  -[MKExploreGuidesView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MKExploreGuidesView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ExploreGuidesImage"));

  -[MKExploreGuidesView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView addSubview:](self, "addSubview:", v7);

  if (MKApplicationLayoutDirectionIsRightToLeft())
    v8 = 5;
  else
    v8 = 10;
  -[MKExploreGuidesView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setContinuousCornerRadius:", 10.0);

  -[MKExploreGuidesView imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", v8);

  -[MKExploreGuidesView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClipsToBounds:", 1);

  +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "screenScale");
  v15 = v14;

  v16 = v15 * 92.0;
  +[MKExploreGuidesView defaultHeight](MKExploreGuidesView, "defaultHeight");
  v18 = v15 * v17;
  -[MKExploreGuidesView exploreGuide](self, "exploreGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageURLForSize:", v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __33__MKExploreGuidesView_setupImage__block_invoke;
  v22[3] = &unk_1E20D96B8;
  v22[4] = self;
  objc_msgSend(v21, "loadAppImageAtURL:completionHandler:", v20, v22);

}

uint64_t __33__MKExploreGuidesView_setupImage__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 448), "setImage:", a2);
  return result;
}

- (void)setupConstraints
{
  MKPlaceCollectionsSizeController *v3;
  double v4;
  double v5;
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
  MKPlaceCollectionsSizeController *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[14];

  v63[12] = *MEMORY[0x1E0C80C00];
  v3 = -[MKPlaceCollectionsSizeController initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:]([MKPlaceCollectionsSizeController alloc], "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 0, 1, 0, self, 7);
  v40 = (void *)MEMORY[0x1E0CB3718];
  -[MKExploreGuidesView button](self, "button");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView leadingAnchor](self, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v3;
  -[MKPlaceCollectionsSizeController sectionInsets](v3, "sectionInsets");
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60, v4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v59;
  -[MKExploreGuidesView button](self, "button");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "trailingAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView trailingAnchor](self, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionsSizeController sectionInsets](v3, "sectionInsets");
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v54;
  -[MKExploreGuidesView button](self, "button");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView topAnchor](self, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 5.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v50;
  -[MKExploreGuidesView button](self, "button");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView bottomAnchor](self, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, -5.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v46;
  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v41;
  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView imageView](self, "imageView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -16.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v35;
  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 16.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v63[6] = v30;
  -[MKExploreGuidesView labelsStack](self, "labelsStack");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v26, -16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v63[7] = v25;
  -[MKExploreGuidesView imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v63[8] = v20;
  -[MKExploreGuidesView imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63[9] = v6;
  -[MKExploreGuidesView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKExploreGuidesView button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63[10] = v11;
  -[MKExploreGuidesView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 92.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "activateConstraints:", v15);

}

- (void)didSelectExploreGuides:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  -[MKExploreGuidesView tapHandler](self, "tapHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MKExploreGuidesView tapHandler](self, "tapHandler");
    v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    -[MKExploreGuidesView exploreGuide](self, "exploreGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v5);

  }
}

- (GEOExploreGuides)exploreGuide
{
  return self->_exploreGuide;
}

- (void)setExploreGuide:(id)a3
{
  objc_storeStrong((id *)&self->_exploreGuide, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIStackView)labelsStack
{
  return self->_labelsStack;
}

- (void)setLabelsStack:(id)a3
{
  objc_storeStrong((id *)&self->_labelsStack, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (UIFont)defaultTitleFont
{
  return self->_defaultTitleFont;
}

- (void)setDefaultTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTitleFont, a3);
}

- (UIFont)maxSupportedTitleFont
{
  return self->_maxSupportedTitleFont;
}

- (void)setMaxSupportedTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_maxSupportedTitleFont, a3);
}

- (id)tapHandler
{
  return self->_tapHandler;
}

- (void)setTapHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tapHandler, 0);
  objc_storeStrong((id *)&self->_maxSupportedTitleFont, 0);
  objc_storeStrong((id *)&self->_defaultTitleFont, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelsStack, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_exploreGuide, 0);
}

@end
