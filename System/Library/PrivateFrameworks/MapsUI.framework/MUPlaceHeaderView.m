@implementation MUPlaceHeaderView

- (UILayoutGuide)titleLabelToTopLayoutGuide
{
  return self->_topToTitleLayoutGuide;
}

- (MUPlaceHeaderView)initWithViewModel:(id)a3 trailingConstraintProvider:(id)a4
{
  return -[MUPlaceHeaderView initWithViewModel:coverPhotoOptions:trailingConstraintProvider:](self, "initWithViewModel:coverPhotoOptions:trailingConstraintProvider:", a3, 0, a4);
}

- (MUPlaceHeaderView)initWithViewModel:(id)a3 coverPhotoOptions:(id)a4 trailingConstraintProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  MUPlaceHeaderView *v12;
  MUPlaceHeaderView *v13;
  uint64_t v14;
  id trailingConstraintProvider;
  void *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MUPlaceHeaderView;
  v12 = -[MUPlaceHeaderView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeStrong((id *)&v13->_coverPhotoOptions, a4);
    v14 = objc_msgSend(v11, "copy");
    trailingConstraintProvider = v13->_trailingConstraintProvider;
    v13->_trailingConstraintProvider = (id)v14;

    -[MUPlaceHeaderView setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderView"));
    -[MUPlaceHeaderView _setupSubviews](v13, "_setupSubviews");
    -[MUPlaceHeaderView _setupConstraints](v13, "_setupConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__contentSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[MUPlaceHeaderView _updateAppearance](v13, "_updateAppearance");
  }

  return v13;
}

- (void)_setupSubviews
{
  _BOOL4 v3;
  double *v4;
  _UNKNOWN **v5;
  MUImageView *v6;
  MUImageView *heroImageView;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  MUPlaceCoverPhotoTransitionController *v18;
  MUPlaceCoverPhotoTransitionController *v19;
  MUPlaceCoverPhotoTransitionController *coverPhotoTransitionController;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIView *v26;
  UIView *verifiedBusinessContainerView;
  MUImageView *v28;
  MUImageView *verifiedBusinessCoverPhotoImageView;
  void *v30;
  void *v31;
  MUVerifiedLogoImageView *v32;
  MUVerifiedLogoImageView *verifiedBusinessLogoImageView;
  void *v34;
  void *v35;
  MUCardButton *v36;
  MUCardButton *shareButton;
  _BOOL4 v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  MUCardButton *v43;
  UILabel *v44;
  UILabel *titleLabel;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  UILabel *v50;
  UILabel *secondaryTitleLabel;
  void *v52;
  void *v53;
  MULinkView *v54;
  MULinkView *containmentLabel;
  MULinkView *v56;
  void *v57;
  uint64_t v58;
  MKTransitInfoLabelView *v59;
  MKTransitInfoLabelView *transitInfoLabelView;
  void *v61;
  UILabel *v62;
  UILabel *verifiedLabel;
  void *v64;
  UILabel *v65;
  UILabel *contactAddressDescription;
  void *v67;
  UILayoutGuide *v68;
  UILayoutGuide *topToTitleLayoutGuide;
  _QWORD v70[4];
  id v71;
  id from[2];
  BOOL v73;
  _BYTE v74[7];
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  _QWORD v81[4];
  id v82;
  id location[2];

  v3 = -[MUPlaceHeaderViewModel hasHeroImage](self->_viewModel, "hasHeroImage");
  v4 = (double *)MEMORY[0x1E0C9D648];
  v5 = &off_1E2DFD000;
  if (v3)
  {
    v6 = -[MUImageView initWithFrame:]([MUImageView alloc], "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    heroImageView = self->_heroImageView;
    self->_heroImageView = v6;

    -[MUImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_heroImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[MUInfoCardStyle imageTileBackgroundColor](MUInfoCardStyle, "imageTileBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUImageView setBackgroundColor:](self->_heroImageView, "setBackgroundColor:", v8);

    -[UIView _mapsui_setCardCorner](self->_heroImageView, "_mapsui_setCardCorner");
    -[MUImageView setAccessibilityIdentifier:](self->_heroImageView, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderHeroImage"));
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_heroImageView);
  }
  if (-[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader"))
  {
    if (MUIdiomInTraitEnvironment(self) == 5)
      v9 = 8.0;
    else
      v9 = 10.0;
    if (MUIdiomInTraitEnvironment(self) == 5)
      v10 = 12.0;
    else
      v10 = 16.0;
    v11 = -[MUPlaceHeaderViewModel supportsLogo](self->_viewModel, "supportsLogo");
    if (MUIdiomInTraitEnvironment(self) == 5)
      v12 = 40.0;
    else
      v12 = 56.0;
    if (MUIdiomInTraitEnvironment(self) == 5)
      v13 = 40.0;
    else
      v13 = 56.0;
    GEOConfigGetDouble();
    v15 = v14;
    GEOConfigGetDouble();
    v17 = v16;
    *(_OWORD *)&self->_headerMetrics.topToTitleSpacing = xmmword_191F06620;
    self->_headerMetrics.coverPhotoMetrics.hasLogo = v11;
    *(_DWORD *)(&self->_headerMetrics.coverPhotoMetrics.hasLogo + 1) = 0;
    *((_DWORD *)&self->_headerMetrics.coverPhotoMetrics.hasLogo + 1) = 0;
    self->_headerMetrics.coverPhotoMetrics.logoSize.width = v12;
    self->_headerMetrics.coverPhotoMetrics.logoSize.height = v13;
    self->_headerMetrics.coverPhotoMetrics.coverPhotoBottomToLogoBottomSpacing = v10;
    self->_headerMetrics.coverPhotoMetrics.coverPhotoContainerToTitleSpacing = v9;
    self->_headerMetrics.coverPhotoMetrics.startingLogoAlphaTransitionValue = v15;
    self->_headerMetrics.coverPhotoMetrics.endingLogoAlphaTransitionValue = v16;
    objc_initWeak(location, self);
    v18 = [MUPlaceCoverPhotoTransitionController alloc];
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __35__MUPlaceHeaderView__setupSubviews__block_invoke;
    v81[3] = &unk_1E2E027A0;
    objc_copyWeak(&v82, location);
    *(_OWORD *)from = xmmword_191F06620;
    v73 = v11;
    memset(v74, 0, sizeof(v74));
    v75 = v12;
    v76 = v13;
    v77 = v10;
    v78 = v9;
    v79 = v15;
    v80 = v17;
    v19 = -[MUPlaceCoverPhotoTransitionController initWithMetrics:updateHandler:](v18, "initWithMetrics:updateHandler:", from, v81);
    coverPhotoTransitionController = self->_coverPhotoTransitionController;
    self->_coverPhotoTransitionController = v19;

    v21 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v22 = *v4;
    v23 = v4[1];
    v24 = v4[2];
    v25 = v4[3];
    v26 = (UIView *)objc_msgSend(v21, "initWithFrame:", *v4, v23, v24, v25);
    verifiedBusinessContainerView = self->_verifiedBusinessContainerView;
    self->_verifiedBusinessContainerView = v26;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedBusinessContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_verifiedBusinessContainerView);
    v28 = -[MUImageView initWithFrame:]([MUImageView alloc], "initWithFrame:", v22, v23, v24, v25);
    verifiedBusinessCoverPhotoImageView = self->_verifiedBusinessCoverPhotoImageView;
    self->_verifiedBusinessCoverPhotoImageView = v28;

    -[MUImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedBusinessCoverPhotoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUImageView setAccessibilityIdentifier:](self->_verifiedBusinessCoverPhotoImageView, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderCoverPhotoImage"));
    -[MUPlaceHeaderViewModel coverPhotoBackgroundColor](self->_viewModel, "coverPhotoBackgroundColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v30)
    {
      +[MUInfoCardStyle punchoutButtonPlatterColor](MUInfoCardStyle, "punchoutButtonPlatterColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MUImageView setBackgroundColor:](self->_verifiedBusinessCoverPhotoImageView, "setBackgroundColor:", v31, 0x4030000000000000, 0x3FD8F18F20000000);
    if (!v30)

    -[UIView addSubview:](self->_verifiedBusinessContainerView, "addSubview:", self->_verifiedBusinessCoverPhotoImageView);
    if (-[MUPlaceCoverPhotoOptions insetsCoverPhoto](self->_coverPhotoOptions, "insetsCoverPhoto"))
      -[UIView _mapsui_setCardCorner](self->_verifiedBusinessCoverPhotoImageView, "_mapsui_setCardCorner");
    if (-[MUPlaceHeaderViewModel supportsLogo](self->_viewModel, "supportsLogo"))
    {
      v32 = -[MUVerifiedLogoImageView initWithFrame:]([MUVerifiedLogoImageView alloc], "initWithFrame:", v22, v23, v24, v25);
      verifiedBusinessLogoImageView = self->_verifiedBusinessLogoImageView;
      self->_verifiedBusinessLogoImageView = v32;

      -[MUVerifiedLogoImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedBusinessLogoImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MUVerifiedLogoImageView setAccessibilityIdentifier:](self->_verifiedBusinessLogoImageView, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderLogoImage"));
      -[MUPlaceHeaderViewModel logoBackgroundColor](self->_viewModel, "logoBackgroundColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!v34)
      {
        +[MUInfoCardStyle verifiedLogoBackgroundColor](MUInfoCardStyle, "verifiedLogoBackgroundColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[MUVerifiedLogoImageView setBackgroundColor:](self->_verifiedBusinessLogoImageView, "setBackgroundColor:", v35);
      if (!v34)

      -[UIView addSubview:](self->_verifiedBusinessContainerView, "addSubview:", self->_verifiedBusinessLogoImageView);
    }
    -[MUPlaceHeaderView _updateWithTransitionController:](self, "_updateWithTransitionController:", self->_coverPhotoTransitionController);
    objc_destroyWeak(&v82);
    objc_destroyWeak(location);
    v5 = &off_1E2DFD000;
  }
  if (-[MUPlaceCoverPhotoOptions showShareButton](self->_coverPhotoOptions, "showShareButton"))
  {
    v36 = -[MUCardButton initWithFrame:]([MUCardButton alloc], "initWithFrame:", *v4, v4[1], v4[2], v4[3]);
    shareButton = self->_shareButton;
    self->_shareButton = v36;

    -[MUCardButton setAccessibilityIdentifier:](self->_shareButton, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderShareButton"));
    -[MUCardButton setSymbolName:](self->_shareButton, "setSymbolName:", CFSTR("square.and.arrow.up"));
    -[MUCardButton setTranslatesAutoresizingMaskIntoConstraints:](self->_shareButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUCardButton addTarget:action:forControlEvents:](self->_shareButton, "addTarget:action:forControlEvents:", self, sel__shareButtonPressed, 64);
    if (-[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader"))
    {
      -[MUCardButton setBlurBackground:](self->_shareButton, "setBlurBackground:", 1);
      v38 = -[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader");
      v39 = 16.0;
      if (v38)
        v39 = 8.0;
      -[MUCardButton setDirectionalLayoutMargins:](self->_shareButton, "setDirectionalLayoutMargins:", v39, 0.0, 0.0, v39);
    }
    else if (objc_msgSend(v5[86], "hasExternallyProvidedTintColor"))
    {
      v40 = (void *)objc_opt_new();
      -[MUCardButton setBackgroundView:](self->_shareButton, "setBackgroundView:", v40);

      objc_msgSend(v5[86], "tintColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUCardButton setForegroundColor:](self->_shareButton, "setForegroundColor:", v41);

    }
    if (-[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader"))
    {
      v42 = self->_verifiedBusinessCoverPhotoImageView;
      v43 = self->_shareButton;
    }
    else
    {
      v43 = self->_shareButton;
      v42 = self;
    }
    objc_msgSend(v42, "addSubview:", v43);
  }
  objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
  v44 = (UILabel *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v44;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_mapkit_fontWithSymbolicTraits:", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v47);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderTitle"));
  -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
  -[MUPlaceHeaderViewModel placeSecondaryName](self->_viewModel, "placeSecondaryName");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");

  if (v49)
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
    v50 = (UILabel *)objc_claimAutoreleasedReturnValue();
    secondaryTitleLabel = self->_secondaryTitleLabel;
    self->_secondaryTitleLabel = v50;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_secondaryTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5[86], "secondaryTextColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](self->_secondaryTitleLabel, "setTextColor:", v52);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_secondaryTitleLabel, "setFont:", v53);

    -[UILabel setAccessibilityIdentifier:](self->_secondaryTitleLabel, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderSecondaryTitle"));
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_secondaryTitleLabel);
  }
  if (-[MUPlaceHeaderViewModel hasInitialData](self->_viewModel, "hasInitialData"))
  {
    v54 = -[MULinkView initWithFrame:]([MULinkView alloc], "initWithFrame:", *v4, v4[1], v4[2], v4[3]);
    containmentLabel = self->_containmentLabel;
    self->_containmentLabel = v54;

    -[MULinkView setTranslatesAutoresizingMaskIntoConstraints:](self->_containmentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MULinkView setAccessibilityIdentifier:](self->_containmentLabel, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderContainmentButton"));
    -[MULinkView setNumberOfLines:](self->_containmentLabel, "setNumberOfLines:", 1);
    objc_initWeak(from, self);
    v56 = self->_containmentLabel;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __35__MUPlaceHeaderView__setupSubviews__block_invoke_2;
    v70[3] = &unk_1E2E027C8;
    objc_copyWeak(&v71, from);
    -[MULinkView setSelectionBlock:](v56, "setSelectionBlock:", v70);
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_containmentLabel);
    objc_destroyWeak(&v71);
    objc_destroyWeak(from);
  }
  -[MUPlaceHeaderViewModel transitLabelItems](self->_viewModel, "transitLabelItems");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");

  if (v58)
  {
    v59 = (MKTransitInfoLabelView *)objc_alloc_init(MEMORY[0x1E0CC19B0]);
    transitInfoLabelView = self->_transitInfoLabelView;
    self->_transitInfoLabelView = v59;

    -[MKTransitInfoLabelView setTranslatesAutoresizingMaskIntoConstraints:](self->_transitInfoLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUPlaceHeaderViewModel transitLabelItems](self->_viewModel, "transitLabelItems");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKTransitInfoLabelView setLabelItems:](self->_transitInfoLabelView, "setLabelItems:", v61);

    -[MKTransitInfoLabelView setAccessibilityIdentifier:](self->_transitInfoLabelView, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderTransitInfo"));
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_transitInfoLabelView);
  }
  if (-[MUPlaceHeaderViewModel isVerified](self->_viewModel, "isVerified"))
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
    v62 = (UILabel *)objc_claimAutoreleasedReturnValue();
    verifiedLabel = self->_verifiedLabel;
    self->_verifiedLabel = v62;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_verifiedLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_verifiedLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](self->_verifiedLabel, "setNumberOfLines:", 0);
    -[MUPlaceHeaderView _verifiedAttributedString](self, "_verifiedAttributedString");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_verifiedLabel, "setAttributedText:", v64);

    -[UILabel setAccessibilityIdentifier:](self->_verifiedLabel, "setAccessibilityIdentifier:", CFSTR("PlaceHeaderVerifiedLabel"));
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_verifiedLabel);
  }
  if (-[MUPlaceHeaderViewModel supportsContactAddressDescription](self->_viewModel, "supportsContactAddressDescription"))
  {
    objc_msgSend(MEMORY[0x1E0DC3990], "_mapsui_defaultLabel");
    v65 = (UILabel *)objc_claimAutoreleasedReturnValue();
    contactAddressDescription = self->_contactAddressDescription;
    self->_contactAddressDescription = v65;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_contactAddressDescription, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_contactAddressDescription, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](self->_contactAddressDescription, "setNumberOfLines:", 0);
    -[MUPlaceHeaderViewModel addressDescriptionForContact](self->_viewModel, "addressDescriptionForContact");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_contactAddressDescription, "setAttributedText:", v67);

    -[UILabel setAccessibilityIdentifier:](self->_contactAddressDescription, "setAccessibilityIdentifier:", CFSTR("ContactAddressDescriptionLabel"));
    -[MUPlaceHeaderView addSubview:](self, "addSubview:", self->_contactAddressDescription);
  }
  v68 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
  topToTitleLayoutGuide = self->_topToTitleLayoutGuide;
  self->_topToTitleLayoutGuide = v68;

  -[MUPlaceHeaderView addLayoutGuide:](self, "addLayoutGuide:", self->_topToTitleLayoutGuide);
}

void __35__MUPlaceHeaderView__setupSubviews__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateWithTransitionController:", v5);

}

void __35__MUPlaceHeaderView__setupSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_tappedEnclosingPlace");
    WeakRetained = v2;
  }

}

- (void)_updateWithTransitionController:(id)a3
{
  id v4;
  MUStackLayout *stackLayout;
  double v6;
  double v7;
  CGRect v8;

  v4 = a3;
  -[MUVerifiedLogoImageView setHidden:](self->_verifiedBusinessLogoImageView, "setHidden:", objc_msgSend(v4, "hideLogo"));
  objc_msgSend(v4, "logoImageAlpha");
  -[MUVerifiedLogoImageView setAlpha:](self->_verifiedBusinessLogoImageView, "setAlpha:");
  objc_msgSend(v4, "coverPhotoAlpha");
  -[MUImageView setAlpha:](self->_verifiedBusinessCoverPhotoImageView, "setAlpha:");
  -[MUPlaceHeaderView frame](self, "frame");
  objc_msgSend(v4, "coverPhotoHeightForProposedWidth:", CGRectGetWidth(v8));
  -[MUPlaceHeaderView setVerifiedBusinessHeaderHeight:](self, "setVerifiedBusinessHeaderHeight:");
  stackLayout = self->_stackLayout;
  objc_msgSend(v4, "interpolatedCoverPhotoToTitleSpacing");
  v7 = v6;

  -[MUStackLayout setPadding:forArrangedLayoutItem:](stackLayout, "setPadding:forArrangedLayoutItem:", self->_titleLabel, v7, 19.0, 0.0, 19.0);
}

- (id)_verifiedAttributedString
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3888];
  v6 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithSymbolConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v10);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  _MULocalizedStringFromThisBundle(CFSTR("Verified [Brand]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

  v25[0] = v11;
  v25[1] = v12;
  v25[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MapsUILayout buildAttributedDisplayStringForComponents:forContainingView:](MapsUILayout, "buildAttributedDisplayStringForComponents:forContainingView:", v16, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6, *MEMORY[0x1E0DC1138]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAttributes:range:", v20, 0, objc_msgSend(v18, "length"));

  v21 = (void *)objc_msgSend(v18, "copy");
  return v21;
}

- (void)_setupConstraints
{
  MUStackLayout *v3;
  id v4;
  id v5;
  MUSizeLayout *v6;
  MUSizeLayout *v7;
  MUVerifiedLogoImageView *verifiedBusinessLogoImageView;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  MUEdgeLayout *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  MUEdgeLayout *v30;
  double v31;
  MUPlaceCoverPhotoTransitionController *coverPhotoTransitionController;
  double v33;
  double v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *verifiedBusinessHeaderHeightConstraint;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  MUPlaceHeaderViewModel *viewModel;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *verifiedBusinessCoverPhotoImageView;
  id v55;
  MUEdgeLayout *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  MUStackLayout *v65;
  MUSizeLayout *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[4];
  CGRect v71;

  v70[3] = *MEMORY[0x1E0C80C00];
  v3 = -[MUStackLayout initWithContainer:axis:]([MUStackLayout alloc], "initWithContainer:axis:", self, 1);
  -[MUStackLayout setAlignment:](v3, "setAlignment:", 1);
  -[MUStackLayout setAlignmentBoundsContent:](v3, "setAlignmentBoundsContent:", 1);
  objc_storeStrong((id *)&self->_stackLayout, v3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "addObject:", v3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_heroImageView)
  {
    -[MUStackLayout addArrangedLayoutItem:](v3, "addArrangedLayoutItem:");
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v3, "setPadding:forArrangedLayoutItem:", self->_heroImageView, 16.0, 19.0, 0.0, 19.0);
    v6 = -[MUSizeLayout initWithItem:size:]([MUSizeLayout alloc], "initWithItem:size:", self->_heroImageView, 86.0, 86.0);
    objc_msgSend(v4, "addObject:", v6);

  }
  v69 = v5;
  v64 = v4;
  v65 = v3;
  if (self->_verifiedBusinessContainerView && self->_verifiedBusinessCoverPhotoImageView)
  {
    -[MUStackLayout addArrangedLayoutItem:](v3, "addArrangedLayoutItem:");
    -[MUStackLayout setAlignment:forArrangedLayoutItem:](v3, "setAlignment:forArrangedLayoutItem:", 0, self->_verifiedBusinessContainerView);
    if (-[MUPlaceHeaderViewModel supportsLogo](self->_viewModel, "supportsLogo"))
    {
      v7 = [MUSizeLayout alloc];
      verifiedBusinessLogoImageView = self->_verifiedBusinessLogoImageView;
      if (MUIdiomInTraitEnvironment(self) == 5)
        v9 = 40.0;
      else
        v9 = 56.0;
      if (MUIdiomInTraitEnvironment(self) == 5)
        v10 = 40.0;
      else
        v10 = 56.0;
      v66 = -[MUSizeLayout initWithItem:size:](v7, "initWithItem:size:", verifiedBusinessLogoImageView, v9, v10);
      LODWORD(v11) = 1148829696;
      -[MUSizeLayout setPriority:](v66, "setPriority:", v11);
      objc_msgSend(v4, "addObject:", v66);
      -[MUVerifiedLogoImageView bottomAnchor](self->_verifiedBusinessLogoImageView, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUImageView bottomAnchor](self->_verifiedBusinessCoverPhotoImageView, "bottomAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, self->_headerMetrics.coverPhotoMetrics.coverPhotoBottomToLogoBottomSpacing);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v15) = 1148829696;
      objc_msgSend(v14, "setPriority:", v15);
      objc_msgSend(v69, "addObject:", v14);
      -[MUVerifiedLogoImageView bottomAnchor](self->_verifiedBusinessLogoImageView, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self->_verifiedBusinessContainerView, "bottomAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v18);

      -[MUVerifiedLogoImageView leadingAnchor](self->_verifiedBusinessLogoImageView, "leadingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self->_verifiedBusinessContainerView, "leadingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 16.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v21);

      v22 = 11;
    }
    else
    {
      v22 = 15;
    }
    if (-[MUPlaceCoverPhotoOptions insetsCoverPhoto](self->_coverPhotoOptions, "insetsCoverPhoto"))
    {
      v26 = 16.0;
      v27 = 0.0;
      v28 = 8.0;
      v29 = 8.0;
    }
    else
    {
      v26 = *MEMORY[0x1E0DC3298];
      v29 = *(double *)(MEMORY[0x1E0DC3298] + 8);
      v27 = *(double *)(MEMORY[0x1E0DC3298] + 16);
      v28 = *(double *)(MEMORY[0x1E0DC3298] + 24);
    }
    v30 = [MUEdgeLayout alloc];
    LODWORD(v31) = 1148846080;
    v23 = -[MUEdgeLayout initWithItem:container:insets:edges:priority:](v30, "initWithItem:container:insets:edges:priority:", self->_verifiedBusinessCoverPhotoImageView, self->_verifiedBusinessContainerView, v22, v26, v29, v27, v28, v31);
    objc_msgSend(v4, "addObject:", v23);
    coverPhotoTransitionController = self->_coverPhotoTransitionController;
    -[MUPlaceHeaderView frame](self, "frame");
    -[MUPlaceCoverPhotoTransitionController coverPhotoHeightForProposedWidth:](coverPhotoTransitionController, "coverPhotoHeightForProposedWidth:", CGRectGetWidth(v71));
    v34 = v33;
    -[UIView heightAnchor](self->_verifiedBusinessContainerView, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v34);
    v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    verifiedBusinessHeaderHeightConstraint = self->_verifiedBusinessHeaderHeightConstraint;
    self->_verifiedBusinessHeaderHeightConstraint = v36;

    objc_msgSend(v69, "addObject:", self->_verifiedBusinessHeaderHeightConstraint);
    -[UILayoutGuide topAnchor](self->_topToTitleLayoutGuide, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUImageView bottomAnchor](self->_verifiedBusinessCoverPhotoImageView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v38);

  }
  else
  {
    -[UILayoutGuide topAnchor](self->_topToTitleLayoutGuide, "topAnchor");
    v23 = (MUEdgeLayout *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceHeaderView topAnchor](self, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUEdgeLayout constraintEqualToAnchor:](v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v25);
  }

  -[UILayoutGuide leadingAnchor](self->_topToTitleLayoutGuide, "leadingAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderView leadingAnchor](self, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "constraintEqualToAnchor:", v63);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v39;
  -[UILayoutGuide trailingAnchor](self->_topToTitleLayoutGuide, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v42;
  -[UILayoutGuide bottomAnchor](self->_topToTitleLayoutGuide, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_titleLabel, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObjectsFromArray:", v46);

  if (self->_titleLabel)
  {
    -[MUStackLayout addArrangedLayoutItem:](v65, "addArrangedLayoutItem:");
    -[MUPlaceHeaderView _trailingPadding](self, "_trailingPadding");
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_titleLabel, 16.0, 19.0, 0.0, v47);
  }
  if (self->_secondaryTitleLabel)
  {
    if (self->_containmentLabel)
      v48 = 2.0;
    else
      v48 = 4.0;
    -[MUStackLayout addArrangedLayoutItem:](v65, "addArrangedLayoutItem:");
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_secondaryTitleLabel, 0.0, 19.0, 0.0, 19.0);
  }
  else
  {
    v48 = 4.0;
  }
  viewModel = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewModel enclosingPlaceAttributedStringWithFont:labelColor:tokenColor:](viewModel, "enclosingPlaceAttributedStringWithFont:labelColor:tokenColor:", v50, v51, v52);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_containmentLabel && objc_msgSend(v68, "length"))
  {
    -[MUStackLayout addArrangedLayoutItem:](v65, "addArrangedLayoutItem:", self->_containmentLabel);
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_containmentLabel, v48, 19.0, 0.0, 19.0);
  }
  if (self->_transitInfoLabelView)
  {
    -[MUStackLayout addArrangedLayoutItem:](v65, "addArrangedLayoutItem:");
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_transitInfoLabelView, v48, 19.0, 0.0, 19.0);
  }
  if (self->_verifiedLabel)
  {
    -[MUStackLayout addArrangedLayoutItem:](v65, "addArrangedLayoutItem:");
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_verifiedLabel, v48, 19.0, 0.0, 19.0);
  }
  if (self->_contactAddressDescription)
  {
    -[MUStackLayout addArrangedLayoutItem:](v65, "addArrangedLayoutItem:");
    -[MUStackLayout setPadding:forArrangedLayoutItem:](v65, "setPadding:forArrangedLayoutItem:", self->_contactAddressDescription, v48, 19.0, 0.0, 19.0);
  }
  if (-[MUPlaceCoverPhotoOptions showShareButton](self->_coverPhotoOptions, "showShareButton"))
  {
    v53 = -[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader");
    verifiedBusinessCoverPhotoImageView = self;
    if (v53)
      verifiedBusinessCoverPhotoImageView = self->_verifiedBusinessCoverPhotoImageView;
    v55 = verifiedBusinessCoverPhotoImageView;
    v56 = -[MUEdgeLayout initWithItem:container:]([MUEdgeLayout alloc], "initWithItem:container:", self->_shareButton, v55);
    -[MUEdgeLayout setEdges:](v56, "setEdges:", 9);
    objc_msgSend(v64, "addObject:", v56);
    if (self->_titleLabel)
    {
      -[MUCardButton leadingAnchor](self->_shareButton, "leadingAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintGreaterThanOrEqualToAnchor:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v59);

    }
  }
  v60 = (void *)MEMORY[0x1E0CB3718];
  v61 = (void *)objc_msgSend(v64, "copy");
  v62 = (void *)objc_msgSend(v69, "copy");
  objc_msgSend(v60, "_mapsui_activateLayouts:constraints:", v61, v62);

}

- (void)_updateAppearance
{
  MUPlaceHeaderViewModel *viewModel;
  void *v4;
  double v5;
  double v6;
  MUPlaceHeaderViewModel *v7;
  MUPlaceHeaderView *v8;
  double v9;
  MUPlaceHeaderView *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
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
  MUPlaceHeaderViewModel *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  if (-[MUPlaceHeaderViewModel hasHeroImage](self->_viewModel, "hasHeroImage"))
  {
    viewModel = self->_viewModel;
    -[MUPlaceHeaderView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayScale");
    v6 = v5;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __38__MUPlaceHeaderView__updateAppearance__block_invoke;
    v46[3] = &unk_1E2E027F0;
    objc_copyWeak(&v47, &location);
    -[MUPlaceHeaderViewModel loadHeroImageWithFrameSize:displayScale:completion:](viewModel, "loadHeroImageWithFrameSize:displayScale:completion:", v46, 86.0, 86.0, v6);

    objc_destroyWeak(&v47);
  }
  if (-[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader"))
  {
    -[MUPlaceHeaderView _updateCoverPhoto](self, "_updateCoverPhoto");
    if (-[MUPlaceHeaderViewModel supportsLogo](self->_viewModel, "supportsLogo"))
    {
      v7 = self->_viewModel;
      v8 = self;
      if (MUIdiomInTraitEnvironment(v8) == 5)
        v9 = 40.0;
      else
        v9 = 56.0;

      v10 = v8;
      if (MUIdiomInTraitEnvironment(v10) == 5)
        v11 = 40.0;
      else
        v11 = 56.0;

      -[MUPlaceHeaderView traitCollection](v10, "traitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayScale");
      v14 = v13;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __38__MUPlaceHeaderView__updateAppearance__block_invoke_2;
      v44[3] = &unk_1E2E027F0;
      objc_copyWeak(&v45, &location);
      -[MUPlaceHeaderViewModel loadVerifiedLogoImageWithFrameSize:displayScale:completion:](v7, "loadVerifiedLogoImageWithFrameSize:displayScale:completion:", v44, v9, v11, v14);

      objc_destroyWeak(&v45);
    }
  }
  -[MUPlaceHeaderViewModel placeName](self->_viewModel, "placeName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length") == 0;

  if (!v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[MUPlaceHeaderViewModel placeName](self->_viewModel, "placeName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_mapkit_fontWithSymbolicTraits:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v22);

    objc_msgSend(v17, "addObject:", v23);
    if (-[MUPlaceHeaderViewModel isClaimed](self->_viewModel, "isClaimed"))
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v17, "addObject:", v24);
      v41 = (void *)v24;
      v25 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0DC3888];
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B60]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_mapkit_fontWithSymbolicTraits:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "configurationWithFont:scale:", v29, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "imageWithConfiguration:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "imageWithRenderingMode:", 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setImage:", v32);

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v25);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v33, "mutableCopy");

      v49 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addAttributes:range:", v36, 0, objc_msgSend(v34, "length"));

      objc_msgSend(v17, "addObject:", v34);
    }
    v37 = (void *)objc_msgSend(v17, "copy", v41);
    +[MapsUILayout buildAttributedDisplayStringForComponents:](MapsUILayout, "buildAttributedDisplayStringForComponents:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v38);

  }
  -[MUPlaceHeaderViewModel placeSecondaryName](self->_viewModel, "placeSecondaryName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_secondaryTitleLabel, "setText:", v39);

  if (-[MUPlaceHeaderViewModel hasInitialData](self->_viewModel, "hasInitialData"))
  {
    -[MUPlaceHeaderView _updateContainmentLineWithAttributedString](self, "_updateContainmentLineWithAttributedString");
  }
  else if (-[MUPlaceHeaderViewModel hasEnclosingPlace](self->_viewModel, "hasEnclosingPlace"))
  {
    v40 = self->_viewModel;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __38__MUPlaceHeaderView__updateAppearance__block_invoke_3;
    v42[3] = &unk_1E2E02818;
    objc_copyWeak(&v43, &location);
    -[MUPlaceHeaderViewModel refineEnclosingMapItemWithCompletion:](v40, "refineEnclosingMapItemWithCompletion:", v42);
    objc_destroyWeak(&v43);
  }
  objc_destroyWeak(&location);
}

void __38__MUPlaceHeaderView__updateAppearance__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  id *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!a3 && WeakRetained)
    objc_msgSend(WeakRetained[52], "setImage:animated:", v7, 1);

}

void __38__MUPlaceHeaderView__updateAppearance__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v6 && !a3)
    objc_msgSend(WeakRetained[54], "setImage:animated:", v6, 0);

}

void __38__MUPlaceHeaderView__updateAppearance__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateContainmentLineWithAttributedString");
    WeakRetained = v2;
  }

}

- (void)_updateContainmentLineWithAttributedString
{
  MUPlaceHeaderViewModel *viewModel;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  viewModel = self->_viewModel;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceHeaderViewModel enclosingPlaceAttributedStringWithFont:labelColor:tokenColor:](viewModel, "enclosingPlaceAttributedStringWithFont:labelColor:tokenColor:", v7, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULinkView setAttributedText:](self->_containmentLabel, "setAttributedText:", v6);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[MUPlaceHeaderViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceHeaderView _updateAppearance](self, "_updateAppearance");
  }

}

- (void)_contentSizeDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_mapkit_fontWithSymbolicTraits:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_secondaryTitleLabel, "setFont:", v5);

  -[MUPlaceHeaderView _verifiedAttributedString](self, "_verifiedAttributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_verifiedLabel, "setAttributedText:", v6);

  -[MUPlaceHeaderViewModel addressDescriptionForContact](self->_viewModel, "addressDescriptionForContact");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_contactAddressDescription, "setAttributedText:", v7);

}

- (void)_tappedEnclosingPlace
{
  MUPlaceHeaderViewModel *viewModel;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[MUPlaceHeaderView suppressContainmentTap](self, "suppressContainmentTap"))
  {
    objc_initWeak(&location, self);
    -[MUPlaceHeaderView beginAnimatingActivityIndicator](self, "beginAnimatingActivityIndicator");
    viewModel = self->_viewModel;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __42__MUPlaceHeaderView__tappedEnclosingPlace__block_invoke;
    v4[3] = &unk_1E2E02818;
    objc_copyWeak(&v5, &location);
    -[MUPlaceHeaderViewModel refineEnclosingMapItemWithCompletion:](viewModel, "refineEnclosingMapItemWithCompletion:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __42__MUPlaceHeaderView__tappedEnclosingPlace__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v7 && !a3)
  {
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "headerView:didSelectEnclosingMapItem:", WeakRetained, v7);

    objc_msgSend(WeakRetained, "endAnimatingActivityIndicatorWithError:", 0);
  }

}

- (void)setSuppressContainmentTap:(BOOL)a3
{
  if (self->_suppressContainmentTap != a3)
  {
    self->_suppressContainmentTap = a3;
    -[MULinkView setUserInteractionEnabled:](self->_containmentLabel, "setUserInteractionEnabled:", !a3);
  }
}

- (void)reloadTrailingConstraint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[MUStackLayout paddingForArrangedLayoutItem:](self->_stackLayout, "paddingForArrangedLayoutItem:", self->_titleLabel);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[MUPlaceHeaderView _trailingPadding](self, "_trailingPadding");
  -[MUStackLayout setPadding:forArrangedLayoutItem:](self->_stackLayout, "setPadding:forArrangedLayoutItem:", self->_titleLabel, v4, v6, v8, v9);
}

- (void)hideTitle:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UILabel setHidden:](self->_titleLabel, "setHidden:");
  -[UIView setHidden:](self->_verifiedBusinessContainerView, "setHidden:", v3);
}

- (double)verifiedBusinessHeaderHeight
{
  double result;

  -[NSLayoutConstraint constant](self->_verifiedBusinessHeaderHeightConstraint, "constant");
  return result;
}

- (void)setVerifiedBusinessHeaderHeight:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_verifiedBusinessHeaderHeightConstraint, "setConstant:", a3);
}

- (void)setVerifiedBusinessHeaderExpansionProgress:(double)a3
{
  -[MUPlaceCoverPhotoTransitionController setExpansionProgress:](self->_coverPhotoTransitionController, "setExpansionProgress:", a3);
}

- (double)verifiedBusinessHeaderAlpha
{
  double result;

  -[UIView alpha](self->_verifiedBusinessContainerView, "alpha");
  return result;
}

- (void)setVerifiedBusinessHeaderAlpha:(double)a3
{
  -[UIView setAlpha:](self->_verifiedBusinessContainerView, "setAlpha:", a3);
}

+ (double)minimalModeHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mapkit_fontWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4 + 16.0 + 4.0;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  v8 = v5 + v7 + 14.0;

  return v8;
}

- (double)_trailingPadding
{
  void (**trailingConstraintProvider)(void);
  double result;

  trailingConstraintProvider = (void (**)(void))self->_trailingConstraintProvider;
  if (!trailingConstraintProvider)
    return 19.0;
  trailingConstraintProvider[2]();
  return result;
}

- (void)beginAnimatingActivityIndicator
{
  -[MULinkView setAlpha:](self->_containmentLabel, "setAlpha:", 0.3);
  -[MULinkView setUserInteractionEnabled:](self->_containmentLabel, "setUserInteractionEnabled:", 0);
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[MULinkView setAlpha:](self->_containmentLabel, "setAlpha:", a3, 1.0);
  -[MULinkView setUserInteractionEnabled:](self->_containmentLabel, "setUserInteractionEnabled:", 1);
}

- (void)_shareButtonPressed
{
  void *v3;
  char v4;
  void *v5;
  MUPresentationOptions *v6;

  v6 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setSourceView:](v6, "setSourceView:", self->_shareButton);
  -[MUPlaceHeaderView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlaceHeaderView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerView:didSelectShareWithPresentationOptions:", self, v6);

  }
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  MUPlaceCoverPhotoTransitionController *coverPhotoTransitionController;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)MUPlaceHeaderView;
  -[MUPlaceHeaderView layoutSubviews](&v8, sel_layoutSubviews);
  -[MUPlaceHeaderView bounds](self, "bounds");
  if (!CGRectEqualToRect(v9, self->_cachedBounds))
  {
    -[MUPlaceHeaderView bounds](self, "bounds");
    self->_cachedBounds.origin.x = v3;
    self->_cachedBounds.origin.y = v4;
    self->_cachedBounds.size.width = v5;
    self->_cachedBounds.size.height = v6;
    if (-[MUPlaceHeaderViewModel supportsEnhancedBusinessHeader](self->_viewModel, "supportsEnhancedBusinessHeader"))
    {
      coverPhotoTransitionController = self->_coverPhotoTransitionController;
      -[MUPlaceHeaderView frame](self, "frame");
      -[MUPlaceCoverPhotoTransitionController coverPhotoHeightForProposedWidth:](coverPhotoTransitionController, "coverPhotoHeightForProposedWidth:", CGRectGetWidth(v10));
      -[MUPlaceHeaderView setVerifiedBusinessHeaderHeight:](self, "setVerifiedBusinessHeaderHeight:");
      -[MUPlaceHeaderView _updateCoverPhoto](self, "_updateCoverPhoto");
    }
    -[MUPlaceHeaderView reloadTrailingConstraint](self, "reloadTrailingConstraint");
  }
}

- (void)_updateCoverPhoto
{
  double v3;
  double v4;
  MUPlaceHeaderViewModel *viewModel;
  void *v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[MUPlaceHeaderView frame](self, "frame");
  v4 = v3;
  objc_initWeak(&location, self);
  viewModel = self->_viewModel;
  -[MUPlaceHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__MUPlaceHeaderView__updateCoverPhoto__block_invoke;
  v9[3] = &unk_1E2E027F0;
  objc_copyWeak(&v10, &location);
  -[MUPlaceHeaderViewModel loadCoverPhotoWithFrameSize:displayScale:completion:](viewModel, "loadCoverPhotoWithFrameSize:displayScale:completion:", v9, v4, v4, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__MUPlaceHeaderView__updateCoverPhoto__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && v6 && !a3)
    objc_msgSend(WeakRetained[53], "setImage:animated:", v6, 0);

}

- (BOOL)shouldBlurChromeHeaderButtons
{
  return -[MUPlaceCoverPhotoTransitionController shouldBlurChromeHeaderButtons](self->_coverPhotoTransitionController, "shouldBlurChromeHeaderButtons");
}

- (UIView)viewForContainmentString
{
  return (UIView *)self->_containmentLabel;
}

- (MUPlaceHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (MUPlaceHeaderViewDelegate)delegate
{
  return (MUPlaceHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)suppressContainmentTap
{
  return self->_suppressContainmentTap;
}

- (MUPlaceCoverPhotoOptions)coverPhotoOptions
{
  return self->_coverPhotoOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverPhotoOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_coverPhotoTransitionController, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_topToTitleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_titleTrailingConstraint, 0);
  objc_storeStrong(&self->_trailingConstraintProvider, 0);
  objc_storeStrong((id *)&self->_transitInfoLabelView, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessContainerView, 0);
  objc_storeStrong((id *)&self->_contactAddressDescription, 0);
  objc_storeStrong((id *)&self->_verifiedLabel, 0);
  objc_storeStrong((id *)&self->_containmentLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessLogoImageView, 0);
  objc_storeStrong((id *)&self->_verifiedBusinessCoverPhotoImageView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
}

@end
