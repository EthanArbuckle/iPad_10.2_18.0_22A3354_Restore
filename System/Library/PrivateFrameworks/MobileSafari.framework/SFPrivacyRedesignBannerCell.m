@implementation SFPrivacyRedesignBannerCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("SFPrivacyRedesignBannerCell");
}

- (SFPrivacyRedesignBannerCell)initWithFrame:(CGRect)a3
{
  SFPrivacyRedesignBannerCell *v3;
  SFPrivacyRedesignBannerCell *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;
  UILabel *textLabel;
  UILabel *v13;
  UILabel *actionLabel;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  UIStackView *privacyCellStackView;
  double v23;
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
  SFPrivacyRedesignBannerCell *v36;
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
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_super v79;
  _QWORD v80[15];
  void *v81;
  _QWORD v82[3];

  v82[1] = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)SFPrivacyRedesignBannerCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v79, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFStartPageFilledBackgroundCell defaultBackgroundConfiguration](v3, "defaultBackgroundConfiguration");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setCornerRadius:", 10.0);
    -[SFPrivacyRedesignBannerCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v78);
    -[SFPrivacyRedesignBannerCell contentView](v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayoutMargins:", 20.0, 20.0, 20.0, 20.0);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("shield.lefthalf.fill"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

    v8 = (void *)MEMORY[0x1E0DC3888];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithPaletteColors:", v10);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setPreferredSymbolConfiguration:", v77);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setLineBreakMode:](v4->_textLabel, "setLineBreakMode:", 0);
    -[UILabel setLineBreakStrategy:](v4->_textLabel, "setLineBreakStrategy:", 1);
    -[UILabel setNumberOfLines:](v4->_textLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFPrivacyRedesignBannerCell _updateState](v4, "_updateState");
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    actionLabel = v4->_actionLabel;
    v4->_actionLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->_actionLabel, "setText:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_actionLabel, "setTextColor:", v16);

    v17 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v17, "addSubview:", v6);
    objc_msgSend(v17, "addSubview:", v4->_textLabel);
    v18 = v17;
    objc_msgSend(v17, "addSubview:", v4->_actionLabel);
    v19 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v81 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithArrangedSubviews:", v20);
    privacyCellStackView = v4->_privacyCellStackView;
    v4->_privacyCellStackView = (UIStackView *)v21;

    -[UIStackView setAxis:](v4->_privacyCellStackView, "setAxis:", 0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_privacyCellStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setSpacing:](v4->_privacyCellStackView, "setSpacing:", 8.0);
    LODWORD(v23) = 1144750080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v4->_privacyCellStackView, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    -[UIStackView setDistribution:](v4->_privacyCellStackView, "setDistribution:", 1);
    v76 = v5;
    objc_msgSend(v5, "addSubview:", v4->_privacyCellStackView);
    objc_msgSend(v5, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "widthAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToConstant:", 56.0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v74;
    objc_msgSend(v6, "heightAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToConstant:", 56.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v72;
    objc_msgSend(v6, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v68;
    v71 = v6;
    objc_msgSend(v6, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v80[3] = v65;
    -[UILabel topAnchor](v4->_textLabel, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:constant:", v63, 8.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v80[4] = v62;
    -[UILabel leadingAnchor](v4->_textLabel, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v80[5] = v58;
    -[UILabel trailingAnchor](v4->_textLabel, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v80[6] = v54;
    -[UILabel centerYAnchor](v4->_textLabel, "centerYAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerYAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v80[7] = v51;
    -[UILabel leadingAnchor](v4->_actionLabel, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v18;
    objc_msgSend(v18, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v80[8] = v47;
    -[UILabel bottomAnchor](v4->_actionLabel, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v80[9] = v44;
    -[UILabel widthAnchor](v4->_actionLabel, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToConstant:", 50.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v80[10] = v42;
    -[UIStackView leadingAnchor](v4->_privacyCellStackView, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v80[11] = v39;
    -[UIStackView trailingAnchor](v4->_privacyCellStackView, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    objc_msgSend(v24, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v80[12] = v27;
    -[UIStackView topAnchor](v4->_privacyCellStackView, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    v49 = v25;
    objc_msgSend(v25, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v80[13] = v31;
    -[UIStackView bottomAnchor](v4->_privacyCellStackView, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v80[14] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 15);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "activateConstraints:", v35);

    v36 = v4;
  }

  return v4;
}

- (void)_updateState
{
  int v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v13, "isPrivacyProxyActive");
  v4 = objc_msgSend(v13, "state");
  if (!self->_privateBrowsingEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "webui_trackerProtectionEnabled");

    if ((v10 & 1) != 0)
      -[SFPrivacyRedesignBannerCell _changeActionTextForState:](self, "_changeActionTextForState:", 0);
    else
      -[SFPrivacyRedesignBannerCell _changeActionTextForState:](self, "_changeActionTextForState:", 1);
LABEL_19:
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_textLabel, "setText:", v11);
    goto LABEL_20;
  }
  -[SFPrivacyRedesignBannerCell _changeActionTextForState:](self, "_changeActionTextForState:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_enableAdvancedPrivacyProtections:", 1);

  if (!v6)
    goto LABEL_19;
  v7 = v4 ? v3 : 0;
  if (!self->_numberOfTrackers)
    goto LABEL_19;
  if (!v7)
    goto LABEL_15;
  if (v4 == 2)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_18;
  }
  if (v4 == 1)
    v8 = (void *)MEMORY[0x1E0CB3940];
  else
LABEL_15:
    v8 = (void *)MEMORY[0x1E0CB3940];
LABEL_18:
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v11, self->_numberOfTrackers);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_textLabel, "setText:", v12);

LABEL_20:
}

- (void)configureUsingBanner:(id)a3
{
  id v4;
  void *v5;
  WBSPrivacyReportData *v6;
  WBSPrivacyReportData *privacyReportData;

  v4 = a3;
  self->_privateBrowsingEnabled = objc_msgSend(v4, "isPrivateBrowsingEnabled");
  -[WBSPrivacyReportData knownTrackers](self->_privacyReportData, "knownTrackers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numberOfTrackers = objc_msgSend(v5, "count");

  -[SFPrivacyRedesignBannerCell _updateState](self, "_updateState");
  objc_msgSend(v4, "privacyReportData");
  v6 = (WBSPrivacyReportData *)objc_claimAutoreleasedReturnValue();

  privacyReportData = self->_privacyReportData;
  self->_privacyReportData = v6;

  -[SFPrivacyRedesignBannerCell _updateGridVisibilityIfNeeded](self, "_updateGridVisibilityIfNeeded");
}

- (void)layoutSubviews
{
  CGFloat Width;
  _BOOL8 v4;
  objc_super v5;
  CGRect v6;

  if (self->_gridAndTitleView)
  {
    -[SFPrivacyRedesignBannerCell frame](self, "frame");
    Width = CGRectGetWidth(v6);
    v4 = Width >= 400.0;
    -[UIStackView setAxis:](self->_privacyCellStackView, "setAxis:", Width < 400.0);
    -[UIStackView setDistribution:](self->_privacyCellStackView, "setDistribution:", v4);
  }
  -[SFPrivacyRedesignBannerCell _updateGridVisibilityIfNeeded](self, "_updateGridVisibilityIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)SFPrivacyRedesignBannerCell;
  -[SFPrivacyRedesignBannerCell layoutSubviews](&v5, sel_layoutSubviews);
}

- (id)_createGridLabel
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E2245788, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v6);

  objc_msgSend(v2, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v2, "setAutoresizingMask:", 10);
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", *MEMORY[0x1E0DC1438]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v8, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v10);

  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (void)_updateGridVisibilityIfNeeded
{
  void *v3;
  int v4;
  UIView *gridAndTitleView;

  objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "webui_trackerProtectionEnabled") & 1) != 0)
  {
    v4 = -[WBSPrivacyReportData hasData](self->_privacyReportData, "hasData");

    if (v4)
    {
      if (self->_gridAndTitleView)
        return;
      -[SFPrivacyRedesignBannerCell _createGrid](self, "_createGrid");
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (!self->_gridAndTitleView)
    return;
  -[UIStackView removeArrangedSubview:](self->_privacyCellStackView, "removeArrangedSubview:");
  -[UIView removeFromSuperview](self->_gridAndTitleView, "removeFromSuperview");
  gridAndTitleView = self->_gridAndTitleView;
  self->_gridAndTitleView = 0;

LABEL_8:
  -[SFPrivacyRedesignBannerCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_createGrid
{
  SFPrivacyReportOverviewView *v3;
  SFPrivacyReportOverviewView *gridView;
  UIView *v5;
  UIView *gridAndTitleView;
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
  _QWORD v31[9];

  v31[7] = *MEMORY[0x1E0C80C00];
  -[SFPrivacyRedesignBannerCell _createGridLabel](self, "_createGridLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SFPrivacyReportOverviewView initWithPrivacyReportDataProvider:]([SFPrivacyReportOverviewView alloc], "initWithPrivacyReportDataProvider:", self->_privacyReportData);
  gridView = self->_gridView;
  self->_gridView = v3;

  -[SFPrivacyReportOverviewView setContextType:](self->_gridView, "setContextType:", 1);
  -[SFPrivacyReportOverviewView setUsesInsetStyle:](self->_gridView, "setUsesInsetStyle:", 1);
  -[SFPrivacyReportOverviewView setTranslatesAutoresizingMaskIntoConstraints:](self->_gridView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFPrivacyReportGridView setDelegate:](self->_gridView, "setDelegate:", self);
  v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  gridAndTitleView = self->_gridAndTitleView;
  self->_gridAndTitleView = v5;

  -[UIView addSubview:](self->_gridAndTitleView, "addSubview:", v24);
  -[UIView addSubview:](self->_gridAndTitleView, "addSubview:", self->_gridView);
  -[UIView setPreservesSuperviewLayoutMargins:](self->_gridAndTitleView, "setPreservesSuperviewLayoutMargins:", 1);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_gridAndTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView addArrangedSubview:](self->_privacyCellStackView, "addArrangedSubview:", self->_gridAndTitleView);
  v20 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v24, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_gridAndTitleView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  objc_msgSend(v24, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_gridAndTitleView, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v25;
  objc_msgSend(v24, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_gridAndTitleView, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v21;
  -[SFPrivacyReportOverviewView topAnchor](self->_gridView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v17;
  -[SFPrivacyReportOverviewView leadingAnchor](self->_gridView, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_gridAndTitleView, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v9;
  -[SFPrivacyReportOverviewView trailingAnchor](self->_gridView, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_gridAndTitleView, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v12;
  -[SFPrivacyReportOverviewView bottomAnchor](self->_gridView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_gridAndTitleView, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v16);

}

- (void)_changeActionTextForState:(unint64_t)a3
{
  uint64_t v4;
  id v5;

  if (a3 > 1)
  {
    v4 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[UILabel setText:](self->_actionLabel, "setText:", v4);

}

- (void)gridViewDidUpdateContentSize:(id)a3
{
  -[SFPrivacyRedesignBannerCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", a3);
  -[SFPrivacyRedesignBannerCell setNeedsLayout](self, "setNeedsLayout");
}

- (UIView)gridAndTitleView
{
  return self->_gridAndTitleView;
}

- (WBSPrivacyReportData)privacyReportData
{
  return self->_privacyReportData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_gridAndTitleView, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_privacyCellStackView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_actionLabel, 0);
}

@end
