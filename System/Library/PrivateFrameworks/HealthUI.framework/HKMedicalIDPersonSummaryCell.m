@implementation HKMedicalIDPersonSummaryCell

- (HKMedicalIDPersonSummaryCell)initWithFrame:(CGRect)a3
{
  HKMedicalIDPersonSummaryCell *v3;
  UIImageView *v4;
  UIImageView *pictureView;
  UILabel *v6;
  UILabel *nameLabel;
  UILabel *v8;
  UILabel *birthdateLabel;
  UILabel *v10;
  UILabel *organDonationLabel;
  id v12;
  void *v13;
  UILabel *v14;
  UILabel *emergencyAccessLabel;
  uint64_t v16;
  UIStackView *labelContainerView;
  id v18;
  void *v19;
  uint64_t v20;
  UIStackView *mainContainerView;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  UIStackView *fullContainerView;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;
  _QWORD v51[4];
  UIStackView *v52;
  _QWORD v53[2];
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HKMedicalIDPersonSummaryCell;
  v3 = -[HKMedicalIDPersonSummaryCell initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    pictureView = v3->_pictureView;
    v3->_pictureView = v4;

    -[UIImageView setContentMode:](v3->_pictureView, "setContentMode:", 2);
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v6;

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    birthdateLabel = v3->_birthdateLabel;
    v3->_birthdateLabel = v8;

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    organDonationLabel = v3->_organDonationLabel;
    v3->_organDonationLabel = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_pictureView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_birthdateLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_organDonationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v54[0] = v3->_nameLabel;
    v54[1] = v3->_birthdateLabel;
    v54[2] = v3->_organDonationLabel;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v12, "initWithArray:", v13);

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    emergencyAccessLabel = v3->_emergencyAccessLabel;
    v3->_emergencyAccessLabel = v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_emergencyAccessLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_emergencyAccessLabel, "setNumberOfLines:", 0);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v49);
    labelContainerView = v3->_labelContainerView;
    v3->_labelContainerView = (UIStackView *)v16;

    -[UIStackView setAxis:](v3->_labelContainerView, "setAxis:", 1);
    -[UIStackView setAlignment:](v3->_labelContainerView, "setAlignment:", 1);
    -[UIStackView setBaselineRelativeArrangement:](v3->_labelContainerView, "setBaselineRelativeArrangement:", 0);
    -[UIStackView setCustomSpacing:afterView:](v3->_labelContainerView, "setCustomSpacing:afterView:", v3->_nameLabel, 4.0);
    -[UIStackView setCustomSpacing:afterView:](v3->_labelContainerView, "setCustomSpacing:afterView:", v3->_birthdateLabel, 4.0);
    -[UIStackView setLayoutMarginsRelativeArrangement:](v3->_labelContainerView, "setLayoutMarginsRelativeArrangement:", 1);
    v18 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v53[0] = v3->_labelContainerView;
    v53[1] = v3->_pictureView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithArrangedSubviews:", v19);
    mainContainerView = v3->_mainContainerView;
    v3->_mainContainerView = (UIStackView *)v20;

    -[UIStackView setAxis:](v3->_mainContainerView, "setAxis:", 0);
    -[UIStackView setDistribution:](v3->_mainContainerView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v3->_mainContainerView, "setAlignment:", 1);
    -[UIStackView setSpacing:](v3->_mainContainerView, "setSpacing:", 16.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_mainContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView layer](v3->_pictureView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMasksToBounds:", 1);

    -[UILabel setNumberOfLines:](v3->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setNumberOfLines:](v3->_birthdateLabel, "setNumberOfLines:", 0);
    -[UILabel setNumberOfLines:](v3->_organDonationLabel, "setNumberOfLines:", 0);
    v23 = objc_alloc(MEMORY[0x1E0DC3CA8]);
    v52 = v3->_mainContainerView;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "initWithArrangedSubviews:", v24);
    fullContainerView = v3->_fullContainerView;
    v3->_fullContainerView = (UIStackView *)v25;

    -[UIStackView setDirectionalLayoutMargins:](v3->_fullContainerView, "setDirectionalLayoutMargins:", 7.0, 0.0, 7.0, 0.0);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_fullContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_fullContainerView, "setAxis:", 1);
    -[UIStackView setSpacing:](v3->_fullContainerView, "setSpacing:", 4.0);
    -[UIStackView addArrangedSubview:](v3->_fullContainerView, "addArrangedSubview:", v3->_emergencyAccessLabel);
    -[HKMedicalIDPersonSummaryCell contentView](v3, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v3->_fullContainerView);

    -[HKMedicalIDPersonSummaryCell contentView](v3, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setBackgroundColor:", v29);

    -[UIStackView leadingAnchor](v3->_fullContainerView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDPersonSummaryCell contentView](v3, "contentView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, 16.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v45;
    -[UIStackView trailingAnchor](v3->_fullContainerView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDPersonSummaryCell contentView](v3, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -16.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v30;
    -[UIStackView topAnchor](v3->_fullContainerView, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDPersonSummaryCell contentView](v3, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v33, 20.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v34;
    -[UIStackView bottomAnchor](v3->_fullContainerView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDPersonSummaryCell contentView](v3, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, -20.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v41);
    -[HKMedicalIDPersonSummaryCell _contentSizeCategoryDidChange:](v3, "_contentSizeCategoryDidChange:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v3, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDPersonSummaryCell;
  -[HKMedicalIDPersonSummaryCell dealloc](&v4, sel_dealloc);
}

- (void)localeDidChange:(id)a3
{
  self->_resetFormatters = 1;
  -[HKMedicalIDPersonSummaryCell updateSubviewsFromData](self, "updateSubviewsFromData", a3);
}

- (void)timeZoneDidChange:(id)a3
{
  NSCalendar *gregorianCalendar;

  gregorianCalendar = self->_gregorianCalendar;
  self->_gregorianCalendar = 0;

  -[HKMedicalIDPersonSummaryCell updateSubviewsFromData](self, "updateSubviewsFromData");
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  _BOOL4 IsLargerThanSizeCategory;
  int *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 IsSmallerThanSizeCategory;
  UILabel *emergencyAccessLabel;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *pictureWidthAnchor;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;

  if (HKUIApplicationIsUsingAccessibilityContentSizeCategory())
  {
    IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC4918]);
    v5 = &OBJC_IVAR___HKMedicalIDPersonSummaryCell__pictureView;
    if (IsLargerThanSizeCategory)
      v5 = &OBJC_IVAR___HKMedicalIDPersonSummaryCell__labelContainerView;
    v23 = 3;
    if (IsLargerThanSizeCategory)
      v6 = 3;
    else
      v6 = 1;
    if (IsLargerThanSizeCategory)
      v7 = 150.0;
    else
      v7 = 60.0;
    v8 = *v5;
    -[UIStackView removeArrangedSubview:](self->_mainContainerView, "removeArrangedSubview:", *(Class *)((char *)&self->super.super.super.super.isa + v8));
    -[UIStackView addArrangedSubview:](self->_mainContainerView, "addArrangedSubview:", *(Class *)((char *)&self->super.super.super.super.isa + v8));
    -[UIStackView setAlignment:](self->_mainContainerView, "setAlignment:", v6);
    v9 = 1;
  }
  else
  {
    v9 = 0;
    v7 = 60.0;
    v23 = 1;
  }
  IsSmallerThanSizeCategory = HKUIApplicationContentSizeCategoryIsSmallerThanSizeCategory((void *)*MEMORY[0x1E0DC4920]);
  emergencyAccessLabel = self->_emergencyAccessLabel;
  if (IsSmallerThanSizeCategory)
  {
    -[UIStackView removeArrangedSubview:](self->_fullContainerView, "removeArrangedSubview:", emergencyAccessLabel);
    -[UIStackView addArrangedSubview:](self->_labelContainerView, "addArrangedSubview:", self->_emergencyAccessLabel);
    -[UIStackView setCustomSpacing:afterView:](self->_labelContainerView, "setCustomSpacing:afterView:", self->_organDonationLabel, 4.0);
  }
  else
  {
    -[UIStackView removeArrangedSubview:](self->_labelContainerView, "removeArrangedSubview:", emergencyAccessLabel);
    -[UIStackView addArrangedSubview:](self->_fullContainerView, "addArrangedSubview:", self->_emergencyAccessLabel);
  }
  -[UIImageView widthAnchor](self->_pictureView, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", v7);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  pictureWidthAnchor = self->_pictureWidthAnchor;
  self->_pictureWidthAnchor = v13;

  -[NSLayoutConstraint setActive:](self->_pictureWidthAnchor, "setActive:", 1);
  -[UIImageView heightAnchor](self->_pictureView, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView widthAnchor](self->_pictureView, "widthAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[UIImageView layer](self->_pictureView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", v7 * 0.5);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B60], 32770);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_nameLabel, "setFont:", v19);

  v20 = *MEMORY[0x1E0DC4B08];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B08], 0x8000);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_birthdateLabel, "setFont:", v21);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", v20, 0x8000);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_organDonationLabel, "setFont:", v22);

  -[UILabel setTextAlignment:](self->_nameLabel, "setTextAlignment:", v9);
  -[UILabel setTextAlignment:](self->_birthdateLabel, "setTextAlignment:", v9);
  -[UILabel setTextAlignment:](self->_organDonationLabel, "setTextAlignment:", v9);
  -[UIStackView setAlignment:](self->_labelContainerView, "setAlignment:", v23);
  -[UIStackView setAxis:](self->_mainContainerView, "setAxis:", v9);
  -[UILabel setTextAlignment:](self->_emergencyAccessLabel, "setTextAlignment:", v9);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", v20, 0x8000);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_emergencyAccessLabel, "setFont:", v24);

}

- (void)updateSubviewsFromData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
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
  UILabel *organDonationLabel;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  UILabel *v27;
  NSInteger v28;
  UILabel *v29;
  id v30;

  if (self->_resetFormatters)
  {
    v3 = (void *)updateSubviewsFromData___birthdayFormatter;
    updateSubviewsFromData___birthdayFormatter = 0;

    v4 = (void *)updateSubviewsFromData___ageFormatter;
    updateSubviewsFromData___ageFormatter = 0;

    self->_resetFormatters = 0;
  }
  if (!updateSubviewsFromData___birthdayFormatter)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v6 = (void *)updateSubviewsFromData___birthdayFormatter;
    updateSubviewsFromData___birthdayFormatter = (uint64_t)v5;

    objc_msgSend((id)updateSubviewsFromData___birthdayFormatter, "setDateStyle:", 3);
  }
  if (!updateSubviewsFromData___ageFormatter)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v8 = (void *)updateSubviewsFromData___ageFormatter;
    updateSubviewsFromData___ageFormatter = (uint64_t)v7;

  }
  -[UIImageView setHidden:](self->_pictureView, "setHidden:", self->_picture == 0);
  -[NSLayoutConstraint setActive:](self->_pictureWidthAnchor, "setActive:", self->_picture != 0);
  if (self->_gregorianBirthday)
  {
    -[HKMedicalIDPersonSummaryCell _cachedCalendar](self, "_cachedCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", self->_gregorianBirthday);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKMedicalIDPersonSummaryCell _cachedCalendar](self, "_cachedCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:toDate:options:", 4, v10, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)updateSubviewsFromData___ageFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "year"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromNumber:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("age_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v19, v16);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    -[UILabel setHidden:](self->_birthdateLabel, "setHidden:", 0);
  }
  else
  {
    -[UILabel setHidden:](self->_birthdateLabel, "setHidden:", 1);
    v30 = 0;
  }
  -[UIImageView setImage:](self->_pictureView, "setImage:", self->_picture);
  -[UILabel setText:](self->_nameLabel, "setText:", self->_name);
  -[UILabel setText:](self->_birthdateLabel, "setText:", v30);
  if (+[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation](HKOrganDonationConnectionManager, "shouldShowStoreDemoOrganDonation"))
  {
    -[UILabel setHidden:](self->_organDonationLabel, "setHidden:", 0);
LABEL_12:
    organDonationLabel = self->_organDonationLabel;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = CFSTR("organ_donor_donate_life_registered");
LABEL_13:
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_vitalsKeyColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDPersonSummaryCell stringWithImageNamed:withText:andColor:](self, "stringWithImageNamed:withText:andColor:", CFSTR("heart.fill"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](organDonationLabel, "setAttributedText:", v26);

    goto LABEL_14;
  }
  v27 = self->_organDonationLabel;
  if (!self->_organDonationStatus)
  {
    -[UILabel setHidden:](v27, "setHidden:", 1);
    -[UIStackView removeArrangedSubview:](self->_fullContainerView, "removeArrangedSubview:", self->_emergencyAccessLabel);
    -[UIStackView addArrangedSubview:](self->_labelContainerView, "addArrangedSubview:", self->_emergencyAccessLabel);
    goto LABEL_21;
  }
  -[UILabel setHidden:](v27, "setHidden:", 0);
  v28 = -[NSNumber integerValue](self->_organDonationStatus, "integerValue");
  if (v28 == 2)
    goto LABEL_12;
  if (v28 == 1)
  {
    organDonationLabel = self->_organDonationLabel;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = CFSTR("organ_donor_self_reported");
    goto LABEL_13;
  }
  if (v28)
    goto LABEL_21;
  v29 = self->_organDonationLabel;
  -[HKMedicalIDPersonSummaryCell notOrganDonorString](self, "notOrganDonorString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](v29, "setAttributedText:", v22);
LABEL_14:

LABEL_21:
  -[HKMedicalIDPersonSummaryCell buildEmergencyAccessTableItem](self, "buildEmergencyAccessTableItem");

}

- (id)stringWithImageNamed:(id)a3 withText:(id)a4 andColor:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC1350];
  v8 = *MEMORY[0x1E0DC4B08];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v7, "hk_preferredFontForTextStyle:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v12, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "imageWithRenderingMode:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v16);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v9, 0, objc_msgSend(v18, "length"));

  v20 = *MEMORY[0x1E0DC1138];
  v25[1] = v19;
  v26[0] = v12;
  v25[0] = v20;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v22);
  objc_msgSend(v18, "appendAttributedString:", v23);

  return v18;
}

- (id)notOrganDonorString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("organ_donor_not_donor"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, v4);

  return v8;
}

- (id)_cachedCalendar
{
  NSCalendar *gregorianCalendar;
  NSCalendar *v4;
  NSCalendar *v5;

  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    v5 = self->_gregorianCalendar;
    self->_gregorianCalendar = v4;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (void)buildEmergencyAccessTableItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_shareDuringEmergencyCalls || self->_shareOnLockScreen)
  {
    -[UILabel setHidden:](self->_emergencyAccessLabel, "setHidden:", 0);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("medical_id_sharing_status_lock_screen"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_shareDuringEmergencyCalls)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("medical_id_sharing_status_emergency_calls"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_shareOnLockScreen)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("medical_id_sharing_status_emergency_calls_and_lock_screen"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = v5;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDPersonSummaryCell stringWithImageNamed:withText:andColor:](self, "stringWithImageNamed:withText:andColor:", CFSTR("checkmark.circle.fill"), v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAttributedText:](self->_emergencyAccessLabel, "setAttributedText:", v8);

  }
  else
  {
    -[UILabel setHidden:](self->_emergencyAccessLabel, "setHidden:", 1);
  }
}

- (UIImage)picture
{
  return self->_picture;
}

- (void)setPicture:(id)a3
{
  objc_storeStrong((id *)&self->_picture, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1128);
}

- (NSDateComponents)gregorianBirthday
{
  return self->_gregorianBirthday;
}

- (void)setGregorianBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianBirthday, a3);
}

- (NSNumber)organDonationStatus
{
  return self->_organDonationStatus;
}

- (void)setOrganDonationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_organDonationStatus, a3);
}

- (BOOL)shareDuringEmergencyCalls
{
  return self->_shareDuringEmergencyCalls;
}

- (void)setShareDuringEmergencyCalls:(BOOL)a3
{
  self->_shareDuringEmergencyCalls = a3;
}

- (BOOL)shareOnLockScreen
{
  return self->_shareOnLockScreen;
}

- (void)setShareOnLockScreen:(BOOL)a3
{
  self->_shareOnLockScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organDonationStatus, 0);
  objc_storeStrong((id *)&self->_gregorianBirthday, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_pictureWidthAnchor, 0);
  objc_storeStrong((id *)&self->_nameLabelFont, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_mainContainerView, 0);
  objc_storeStrong((id *)&self->_fullContainerView, 0);
  objc_storeStrong((id *)&self->_emergencyAccessLabel, 0);
  objc_storeStrong((id *)&self->_organDonationLabel, 0);
  objc_storeStrong((id *)&self->_birthdateLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_pictureView, 0);
}

@end
