@implementation WDClinicalOnboardingGatewayCell

- (WDClinicalOnboardingGatewayCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalOnboardingGatewayCell *v4;
  WDClinicalOnboardingGatewayCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingGatewayCell;
  v4 = -[WDMedicalRecordGroupableCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[WDMedicalRecordGroupableCell setIntendedPlacement:](v4, "setIntendedPlacement:", 2);
  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingGatewayCell;
  -[WDMedicalRecordGroupableCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WDClinicalOnboardingGatewayCell configureWithGateway:dataProvider:connected:](self, "configureWithGateway:dataProvider:connected:", 0, 0, 0);
  -[WDClinicalOnboardingGatewayCell logoView](self, "logoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

}

- (void)setupSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalOnboardingGatewayCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v4, sel_setupSubviews);
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 16.0, 16.0, 16.0, 16.0);

  -[WDClinicalOnboardingGatewayCell _createLogoView](self, "_createLogoView");
  -[WDClinicalOnboardingGatewayCell _createTitleLabel](self, "_createTitleLabel");
  -[WDClinicalOnboardingGatewayCell _createSubtitleLabel](self, "_createSubtitleLabel");
  -[WDClinicalOnboardingGatewayCell _createDetailLabel](self, "_createDetailLabel");
  -[WDClinicalOnboardingGatewayCell _createDownloadAvailableView](self, "_createDownloadAvailableView");
  -[WDClinicalOnboardingGatewayCell _createSharingAvailableView](self, "_createSharingAvailableView");
  -[WDClinicalOnboardingGatewayCell _createVerticalSpecContainerView](self, "_createVerticalSpecContainerView");
  -[WDClinicalOnboardingGatewayCell _createTapToConnectLabel](self, "_createTapToConnectLabel");
  -[WDClinicalOnboardingGatewayCell _createOuterSpecContainerView](self, "_createOuterSpecContainerView");
}

- (void)_createLogoView
{
  WDBrandLogoView *v3;
  WDBrandLogoView *v4;
  WDBrandLogoView *logoView;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = [WDBrandLogoView alloc];
  v4 = -[WDBrandLogoView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  logoView = self->_logoView;
  self->_logoView = v4;

  -[WDClinicalOnboardingGatewayCell logoView](self, "logoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingGatewayCell logoView](self, "logoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentMode:", 1);

  objc_msgSend(MEMORY[0x1E0DC3890], "mediumLogoViewDimension");
  v9 = v8;
  -[WDClinicalOnboardingGatewayCell logoView](self, "logoView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSize:", v9);

}

- (void)_createTitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  -[WDClinicalOnboardingGatewayCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 1280);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

}

- (void)_createSubtitleLabel
{
  id v3;
  UILabel *v4;
  UILabel *subtitleLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v4;

  -[WDClinicalOnboardingGatewayCell subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell subtitleLabel](self, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

}

- (void)_createDetailLabel
{
  id v3;
  UILabel *v4;
  UILabel *detailLabel;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  detailLabel = self->_detailLabel;
  self->_detailLabel = v4;

  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

}

- (void)_createDownloadAvailableView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *featureDownloadTitleLabel;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *featureDownloadTextLabel;
  void *v22;
  void *v23;
  id v24;
  HKBorderLineView *v25;
  HKBorderLineView *featureDownloadView;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *featureDownloadBottomConstraint;
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
  id v54;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], v5, v6, v7);
  featureDownloadTitleLabel = self->_featureDownloadTitleLabel;
  self->_featureDownloadTitleLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_featureDownloadTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_featureDownloadTitleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_featureDownloadTitleLabel, "setTextColor:", v10);

  v11 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_featureDownloadTitleLabel, "setFont:", v12);

  v13 = (void *)MEMORY[0x1E0CB3498];
  HROsloLocalizedString(CFSTR("GATEWAY_FEATURE_DOWNLOAD_TITLE"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.down.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringText:textColor:symbol:symbolColor:useLargeSpacing:", v15, v16, v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_featureDownloadTitleLabel, "setAttributedText:", v19);

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  featureDownloadTextLabel = self->_featureDownloadTextLabel;
  self->_featureDownloadTextLabel = v20;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_featureDownloadTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_featureDownloadTextLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_featureDownloadTextLabel, "setTextColor:", v22);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_featureDownloadTextLabel, "setFont:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D2F5E8]);
  v25 = (HKBorderLineView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  featureDownloadView = self->_featureDownloadView;
  self->_featureDownloadView = v25;

  -[HKBorderLineView setTranslatesAutoresizingMaskIntoConstraints:](self->_featureDownloadView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView setBackgroundColor:](self->_featureDownloadView, "setBackgroundColor:", v27);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView setBorderLineColor:](self->_featureDownloadView, "setBorderLineColor:", v28);

  -[HKBorderLineView addSubview:](self->_featureDownloadView, "addSubview:", self->_featureDownloadTitleLabel);
  -[HKBorderLineView addSubview:](self->_featureDownloadView, "addSubview:", self->_featureDownloadTextLabel);
  LODWORD(v29) = 1131610112;
  -[UILabel setContentHuggingPriority:forAxis:](self->_featureDownloadTitleLabel, "setContentHuggingPriority:forAxis:", 1, v29);
  LODWORD(v30) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_featureDownloadTitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v30);
  LODWORD(v31) = 1131806720;
  -[UILabel setContentHuggingPriority:forAxis:](self->_featureDownloadTextLabel, "setContentHuggingPriority:forAxis:", 1, v31);
  LODWORD(v32) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_featureDownloadTextLabel, "setContentCompressionResistancePriority:forAxis:", 1, v32);
  -[UILabel topAnchor](self->_featureDownloadTitleLabel, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView topAnchor](self->_featureDownloadView, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UILabel topAnchor](self->_featureDownloadTextLabel, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_featureDownloadTitleLabel, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 2.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[UILabel bottomAnchor](self->_featureDownloadTextLabel, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView bottomAnchor](self->_featureDownloadView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  featureDownloadBottomConstraint = self->_featureDownloadBottomConstraint;
  self->_featureDownloadBottomConstraint = v41;

  -[NSLayoutConstraint setActive:](self->_featureDownloadBottomConstraint, "setActive:", 1);
  -[UILabel leadingAnchor](self->_featureDownloadTitleLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView leadingAnchor](self->_featureDownloadView, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[UILabel trailingAnchor](self->_featureDownloadTitleLabel, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView trailingAnchor](self->_featureDownloadView, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[UILabel leadingAnchor](self->_featureDownloadTextLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView leadingAnchor](self->_featureDownloadView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[UILabel trailingAnchor](self->_featureDownloadTextLabel, "trailingAnchor");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView trailingAnchor](self->_featureDownloadView, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

}

- (void)_createSharingAvailableView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *v8;
  UILabel *featureSharingTitleLabel;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *featureSharingTextLabel;
  void *v22;
  void *v23;
  id v24;
  HKBorderLineView *v25;
  HKBorderLineView *featureSharingView;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSLayoutConstraint *v41;
  NSLayoutConstraint *featureSharingBottomConstraint;
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
  id v54;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v8 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], v5, v6, v7);
  featureSharingTitleLabel = self->_featureSharingTitleLabel;
  self->_featureSharingTitleLabel = v8;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_featureSharingTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_featureSharingTitleLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_featureSharingTitleLabel, "setTextColor:", v10);

  v11 = *MEMORY[0x1E0DC4B10];
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_featureSharingTitleLabel, "setFont:", v12);

  v13 = (void *)MEMORY[0x1E0CB3498];
  HROsloLocalizedString(CFSTR("GATEWAY_FEATURE_SHARING_TITLE"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.circle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringText:textColor:symbol:symbolColor:useLargeSpacing:", v15, v16, v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](self->_featureSharingTitleLabel, "setAttributedText:", v19);

  v20 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  featureSharingTextLabel = self->_featureSharingTextLabel;
  self->_featureSharingTextLabel = v20;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_featureSharingTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_featureSharingTextLabel, "setAdjustsFontForContentSizeCategory:", 0);
  -[UILabel setNumberOfLines:](self->_featureSharingTextLabel, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_featureSharingTextLabel, "setTextColor:", v22);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_featureSharingTextLabel, "setFont:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D2F5E8]);
  v25 = (HKBorderLineView *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  featureSharingView = self->_featureSharingView;
  self->_featureSharingView = v25;

  -[HKBorderLineView setTranslatesAutoresizingMaskIntoConstraints:](self->_featureSharingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView setBackgroundColor:](self->_featureSharingView, "setBackgroundColor:", v27);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView setBorderLineColor:](self->_featureSharingView, "setBorderLineColor:", v28);

  -[HKBorderLineView addSubview:](self->_featureSharingView, "addSubview:", self->_featureSharingTitleLabel);
  -[HKBorderLineView addSubview:](self->_featureSharingView, "addSubview:", self->_featureSharingTextLabel);
  LODWORD(v29) = 1131675648;
  -[UILabel setContentHuggingPriority:forAxis:](self->_featureSharingTitleLabel, "setContentHuggingPriority:forAxis:", 1, v29);
  LODWORD(v30) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_featureSharingTitleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v30);
  LODWORD(v31) = 1131741184;
  -[UILabel setContentHuggingPriority:forAxis:](self->_featureSharingTextLabel, "setContentHuggingPriority:forAxis:", 1, v31);
  LODWORD(v32) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_featureSharingTextLabel, "setContentCompressionResistancePriority:forAxis:", 1, v32);
  -[UILabel topAnchor](self->_featureSharingTitleLabel, "topAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView topAnchor](self->_featureSharingView, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[UILabel topAnchor](self->_featureSharingTextLabel, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_featureSharingTitleLabel, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 2.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setActive:", 1);

  -[UILabel bottomAnchor](self->_featureSharingTextLabel, "bottomAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView bottomAnchor](self->_featureSharingView, "bottomAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v40);
  v41 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  featureSharingBottomConstraint = self->_featureSharingBottomConstraint;
  self->_featureSharingBottomConstraint = v41;

  -[NSLayoutConstraint setActive:](self->_featureSharingBottomConstraint, "setActive:", 1);
  -[UILabel leadingAnchor](self->_featureSharingTitleLabel, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView leadingAnchor](self->_featureSharingView, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[UILabel trailingAnchor](self->_featureSharingTitleLabel, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView trailingAnchor](self->_featureSharingView, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[UILabel leadingAnchor](self->_featureSharingTextLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView leadingAnchor](self->_featureSharingView, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  -[UILabel trailingAnchor](self->_featureSharingTextLabel, "trailingAnchor");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[HKBorderLineView trailingAnchor](self->_featureSharingView, "trailingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

}

- (void)_createTapToConnectLabel
{
  id v3;
  UILabel *v4;
  UILabel *tapToConnectLabel;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  tapToConnectLabel = self->_tapToConnectLabel;
  self->_tapToConnectLabel = v4;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tapToConnectLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontForContentSizeCategory:](self->_tapToConnectLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setNumberOfLines:](self->_tapToConnectLabel, "setNumberOfLines:", 0);
  -[WDClinicalOnboardingGatewayCell tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_tapToConnectLabel, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 1024);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_tapToConnectLabel, "setFont:", v7);

  -[UILabel setEnabled:](self->_tapToConnectLabel, "setEnabled:", objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode") ^ 1);
  HRLocalizedString(CFSTR("TAP_TO_CONNECT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_tapToConnectLabel, "setText:", v8);

  -[UILabel setAccessibilityIdentifier:](self->_tapToConnectLabel, "setAccessibilityIdentifier:", CFSTR("UIA.Health.ClinicalOnboarding.Gateway.ConnectAccount"));
  LODWORD(v9) = 1148846080;
  -[UILabel setContentHuggingPriority:forAxis:](self->_tapToConnectLabel, "setContentHuggingPriority:forAxis:", 1, v9);
  -[WDClinicalOnboardingGatewayCell contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_tapToConnectLabel);

}

- (void)_createVerticalSpecContainerView
{
  UILabel *subtitleLabel;
  HKBorderLineView *featureDownloadView;
  void *v5;
  UIStackView *v6;
  UIStackView *verticalSpecContainerView;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  subtitleLabel = self->_subtitleLabel;
  v11[0] = self->_titleLabel;
  v11[1] = subtitleLabel;
  featureDownloadView = self->_featureDownloadView;
  v11[2] = self->_detailLabel;
  v11[3] = featureDownloadView;
  v11[4] = self->_featureSharingView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIStackView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v5);
  verticalSpecContainerView = self->_verticalSpecContainerView;
  self->_verticalSpecContainerView = v6;

  -[WDClinicalOnboardingGatewayCell verticalSpecContainerView](self, "verticalSpecContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAxis:", 1);

  -[WDClinicalOnboardingGatewayCell verticalSpecContainerView](self, "verticalSpecContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDClinicalOnboardingGatewayCell verticalSpecContainerView](self, "verticalSpecContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBaselineRelativeArrangement:", 0);

  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_subtitleLabel, 12.0);
  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_detailLabel, 20.0);
  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_featureDownloadView, 12.0);
  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_featureSharingView, 12.0);

}

- (void)_createOuterSpecContainerView
{
  id v3;
  UIStackView *verticalSpecContainerView;
  void *v5;
  UIStackView *v6;
  UIStackView *outerSpecContainerView;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  verticalSpecContainerView = self->_verticalSpecContainerView;
  v9[0] = self->_logoView;
  v9[1] = verticalSpecContainerView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (UIStackView *)objc_msgSend(v3, "initWithArrangedSubviews:", v5);
  outerSpecContainerView = self->_outerSpecContainerView;
  self->_outerSpecContainerView = v6;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_outerSpecContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_outerSpecContainerView, "setAxis:", 0);
  -[UIStackView setAlignment:](self->_outerSpecContainerView, "setAlignment:", 1);
  -[UIStackView setSpacing:](self->_outerSpecContainerView, "setSpacing:", 12.0);
  -[WDClinicalOnboardingGatewayCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_outerSpecContainerView);

}

- (void)setUpConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDClinicalOnboardingGatewayCell;
  -[WDMedicalRecordGroupableCell setUpConstraints](&v3, sel_setUpConstraints);
  -[WDClinicalOnboardingGatewayCell _constrainStackViewContainerWithinContentView](self, "_constrainStackViewContainerWithinContentView");
  -[WDClinicalOnboardingGatewayCell _positionTapToConnectLabel](self, "_positionTapToConnectLabel");
}

- (void)_constrainStackViewContainerWithinContentView
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
  id v15;

  -[WDClinicalOnboardingGatewayCell _contentViewMarginsGuide](self, "_contentViewMarginsGuide");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView topAnchor](self->_outerSpecContainerView, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  objc_msgSend(v15, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_outerSpecContainerView, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v15, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_outerSpecContainerView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v15, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_outerSpecContainerView, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

}

- (id)_contentViewMarginsGuide
{
  void *v2;
  void *v3;

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_positionTapToConnectLabel
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
  NSLayoutConstraint *v17;
  NSLayoutConstraint *tapToConnectLabelHeightConstraint;

  -[UILabel leadingAnchor](self->_tapToConnectLabel, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView leadingAnchor](self->_verticalSpecContainerView, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 1);

  -[UILabel trailingAnchor](self->_tapToConnectLabel, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView trailingAnchor](self->_verticalSpecContainerView, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[UILabel topAnchor](self->_tapToConnectLabel, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView bottomAnchor](self->_verticalSpecContainerView, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[UILabel bottomAnchor](self->_tapToConnectLabel, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  -[UILabel heightAnchor](self->_tapToConnectLabel, "heightAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintGreaterThanOrEqualToConstant:", 42.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tapToConnectLabelHeightConstraint = self->_tapToConnectLabelHeightConstraint;
  self->_tapToConnectLabelHeightConstraint = v17;

  -[NSLayoutConstraint setActive:](self->_tapToConnectLabelHeightConstraint, "setActive:", 1);
}

- (void)configureWithGateway:(id)a3 dataProvider:(id)a4 connected:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a5;
  v29 = a3;
  if (v29 && a4)
  {
    v8 = a4;
    -[WDClinicalOnboardingGatewayCell logoView](self, "logoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchBrandable:dataProvider:", v29, v8);

  }
  objc_msgSend(v29, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v29, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell subtitleLabel](self, "subtitleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v29, "displayableDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  HROsloLocalizedString(CFSTR("GATEWAY_%@_FEATURE_DOWNLOAD_TEXT"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithFormat:", v18, v19);
  -[UILabel setText:](self->_featureDownloadTextLabel, "setText:", v20);

  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  HROsloLocalizedString(CFSTR("GATEWAY_%@_FEATURE_SHARING_TEXT"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithFormat:", v23, v24);
  -[UILabel setText:](self->_featureSharingTextLabel, "setText:", v25);

  v26 = objc_msgSend(v29, "supportsSharingToProviderObjC") ^ 1;
  -[WDClinicalOnboardingGatewayCell featureSharingView](self, "featureSharingView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", v26);

  -[WDClinicalOnboardingGatewayCell tapToConnectLabel](self, "tapToConnectLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHidden:", v5);

  -[WDClinicalOnboardingGatewayCell _updateLabelVisibility](self, "_updateLabelVisibility");
  -[WDMedicalRecordGroupableCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  -[WDClinicalOnboardingGatewayCell _setAccessibilityIdentifiers](self, "_setAccessibilityIdentifiers");

}

- (void)_updateLabelVisibility
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;

  -[WDClinicalOnboardingGatewayCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;
  -[WDClinicalOnboardingGatewayCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[WDClinicalOnboardingGatewayCell subtitleLabel](self, "subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;
  -[WDClinicalOnboardingGatewayCell subtitleLabel](self, "subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length") == 0;
  -[WDClinicalOnboardingGatewayCell detailLabel](self, "detailLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  -[WDClinicalOnboardingGatewayCell tapToConnectLabel](self, "tapToConnectLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isHidden"))
  {

  }
  else
  {
    -[WDClinicalOnboardingGatewayCell featureSharingView](self, "featureSharingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isHidden");

    if ((v17 & 1) != 0)
    {
      -[WDClinicalOnboardingGatewayCell featureDownloadView](self, "featureDownloadView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setEdges:", 4);
      goto LABEL_9;
    }
  }
  -[WDClinicalOnboardingGatewayCell featureDownloadView](self, "featureDownloadView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEdges:", 0);

  -[WDClinicalOnboardingGatewayCell tapToConnectLabel](self, "tapToConnectLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isHidden"))
    v20 = 0;
  else
    v20 = 4;
  -[WDClinicalOnboardingGatewayCell featureSharingView](self, "featureSharingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setEdges:", v20);

LABEL_9:
  -[WDClinicalOnboardingGatewayCell verticalSpecContainerView](self, "verticalSpecContainerView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNeedsUpdateConstraints");

}

- (void)_updateForContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WDClinicalOnboardingGatewayCell;
  v4 = a3;
  -[WDMedicalRecordGroupableCell _updateForContentSizeCategory:](&v16, sel__updateForContentSizeCategory_, v4);
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v4, v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0DC37F8]);
  v7 = (void *)objc_msgSend(v6, "initForTextStyle:", *MEMORY[0x1E0DC4A88]);
  objc_msgSend(v7, "scaledValueForValue:compatibleWithTraitCollection:", v5, 20.0);
  v9 = v8;
  objc_msgSend(v7, "scaledValueForValue:compatibleWithTraitCollection:", v5, 12.0);
  v11 = v10;
  v12 = -[UILabel isHidden](self->_tapToConnectLabel, "isHidden");
  -[UIStackView setSpacing:](self->_outerSpecContainerView, "setSpacing:", v11);
  -[UIStackView setSpacing:](self->_verticalSpecContainerView, "setSpacing:", v11);
  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_titleLabel, 2.0);
  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_subtitleLabel, v11);
  -[UIStackView setCustomSpacing:afterView:](self->_verticalSpecContainerView, "setCustomSpacing:afterView:", self->_detailLabel, v9);
  if (v12)
    v13 = 0.0;
  else
    v13 = -v11;
  -[NSLayoutConstraint setConstant:](self->_featureDownloadBottomConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setConstant:](self->_featureSharingBottomConstraint, "setConstant:", v13);
  objc_msgSend(v7, "scaledValueForValue:compatibleWithTraitCollection:", v5, 42.0);
  v15 = fmax(v14, 42.0);
  if (v12)
    v15 = 0.0;
  -[NSLayoutConstraint setConstant:](self->_tapToConnectLabelHeightConstraint, "setConstant:", v15);

}

- (void)_updateBasedOnAccessibilityCategory:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingGatewayCell;
  -[WDMedicalRecordGroupableCell _updateBasedOnAccessibilityCategory:](&v7, sel__updateBasedOnAccessibilityCategory_);
  if (v3)
    v5 = 4;
  else
    v5 = 2;
  if (v3)
    v6 = 2;
  else
    v6 = 1;
  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", v5);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", v6);
  -[UIStackView setAxis:](self->_outerSpecContainerView, "setAxis:", v3);
}

- (void)_setAccessibilityIdentifiers
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
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  HKUIJoinStringsForAutomationIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v24[1] = CFSTR("ProviderName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", v5);

  v23[0] = v3;
  v23[1] = CFSTR("PatientPortal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_subtitleLabel, "setAccessibilityIdentifier:", v7);

  v22[0] = v3;
  v22[1] = CFSTR("GetSecureAccess");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_detailLabel, "setAccessibilityIdentifier:", v9);

  v21[0] = v3;
  v21[1] = CFSTR("DownloadClinicalRecords");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_featureDownloadTitleLabel, "setAccessibilityIdentifier:", v11);

  v20[0] = v3;
  v20[1] = CFSTR("AnyRecordsCanBeAdded");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_featureDownloadTextLabel, "setAccessibilityIdentifier:", v13);

  v19[0] = v3;
  v19[1] = CFSTR("SharingHealthData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_featureSharingTitleLabel, "setAccessibilityIdentifier:", v15);

  v18[0] = v3;
  v18[1] = CFSTR("YouCanChooseToSHare");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAccessibilityIdentifier:](self->_featureSharingTextLabel, "setAccessibilityIdentifier:", v17);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDClinicalOnboardingGatewayCell;
  -[WDClinicalOnboardingGatewayCell tintColorDidChange](&v5, sel_tintColorDidChange);
  -[WDClinicalOnboardingGatewayCell tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingGatewayCell tapToConnectLabel](self, "tapToConnectLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

- (WDBrandLogoView)logoView
{
  return self->_logoView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (HKBorderLineView)featureDownloadView
{
  return self->_featureDownloadView;
}

- (HKBorderLineView)featureSharingView
{
  return self->_featureSharingView;
}

- (UILabel)featureDownloadTitleLabel
{
  return self->_featureDownloadTitleLabel;
}

- (UILabel)featureDownloadTextLabel
{
  return self->_featureDownloadTextLabel;
}

- (UILabel)featureSharingTitleLabel
{
  return self->_featureSharingTitleLabel;
}

- (UILabel)featureSharingTextLabel
{
  return self->_featureSharingTextLabel;
}

- (NSLayoutConstraint)featureDownloadBottomConstraint
{
  return self->_featureDownloadBottomConstraint;
}

- (NSLayoutConstraint)featureSharingBottomConstraint
{
  return self->_featureSharingBottomConstraint;
}

- (UILabel)tapToConnectLabel
{
  return self->_tapToConnectLabel;
}

- (NSLayoutConstraint)tapToConnectLabelHeightConstraint
{
  return self->_tapToConnectLabelHeightConstraint;
}

- (UIStackView)outerSpecContainerView
{
  return self->_outerSpecContainerView;
}

- (UIStackView)verticalSpecContainerView
{
  return self->_verticalSpecContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalSpecContainerView, 0);
  objc_storeStrong((id *)&self->_outerSpecContainerView, 0);
  objc_storeStrong((id *)&self->_tapToConnectLabelHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tapToConnectLabel, 0);
  objc_storeStrong((id *)&self->_featureSharingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_featureDownloadBottomConstraint, 0);
  objc_storeStrong((id *)&self->_featureSharingTextLabel, 0);
  objc_storeStrong((id *)&self->_featureSharingTitleLabel, 0);
  objc_storeStrong((id *)&self->_featureDownloadTextLabel, 0);
  objc_storeStrong((id *)&self->_featureDownloadTitleLabel, 0);
  objc_storeStrong((id *)&self->_featureSharingView, 0);
  objc_storeStrong((id *)&self->_featureDownloadView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_logoView, 0);
}

@end
