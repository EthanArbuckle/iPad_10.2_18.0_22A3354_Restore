@implementation HKOrganDonationCallToActionTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)CFSTR("HKOrganDonationCallToActionTableViewCell");
}

- (HKOrganDonationCallToActionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKOrganDonationCallToActionTableViewCell *v4;
  HKOrganDonationCallToActionTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKOrganDonationCallToActionTableViewCell;
  v4 = -[HKOrganDonationCallToActionTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HKOrganDonationCallToActionTableViewCell setupSubviews](v4, "setupSubviews");
    -[HKOrganDonationCallToActionTableViewCell setupConstraints](v5, "setupConstraints");
  }
  return v5;
}

- (void)setupSubviews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  id v45;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKOrganDonationCallToActionTableViewCell setTitleLabel:](self, "setTitleLabel:", v4);

  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OD_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v15 = (void *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKOrganDonationCallToActionTableViewCell setSpacerView:](self, "setSpacerView:", v15);

  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v17);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  -[HKOrganDonationCallToActionTableViewCell setCallToActionTextView:](self, "setCallToActionTextView:", v21);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelegate:", self);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextViewString](self, "callToActionTextViewString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAttributedText:", v24);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setScrollEnabled:", 0);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserInteractionEnabled:", 1);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_setInteractiveTextSelectionDisabled:", 1);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDataDetectorTypes:", 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTextColor:", v30);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setBackgroundColor:", v32);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addSubview:", v35);

  v36 = (void *)MEMORY[0x1E0DC3518];
  HKHealthKeyColor();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("OD_SIGN_UP_WITH_DL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "hk_roundRectButtonTintedWithColor:title:target:action:", v37, v39, 0, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell setActionButton:](self, "setActionButton:", v40);

  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setNumberOfLines:", 0);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addSubview:", v44);

}

- (void)setupConstraints
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
  id v74;

  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_scaledValueForValue:", 60.0);
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 16.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 0.5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastBaselineAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 18.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell spacerView](self, "spacerView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, 16.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "firstBaselineAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell titleLabel](self, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "lastBaselineAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "font");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_scaledValueForValue:", 45.0);
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, 16.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "trailingAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, 16.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell callToActionTextView](self, "callToActionTextView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "lastBaselineAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v58, 33.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "leadingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:constant:", v63, 16.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "trailingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "trailingAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, 16.0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setActive:", 1);

  -[HKOrganDonationCallToActionTableViewCell contentView](self, "contentView");
  v74 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "bottomAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationCallToActionTableViewCell actionButton](self, "actionButton");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "lastBaselineAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v72, 48.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setActive:", 1);

}

- (NSAttributedString)callToActionTextViewString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OD_BODY_CONCATENATION_RULE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OD_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OD_LEARN_MORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0CB3778]);
  v11 = *MEMORY[0x1E0DC1140];
  v30[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  v13 = *MEMORY[0x1E0DC1138];
  v30[1] = *MEMORY[0x1E0DC1138];
  v14 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v16);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OD_LEARN_MORE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v9, "rangeOfString:", v19);
  v22 = v21;

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28[0] = v11;
    HKHealthKeyColor();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    v28[1] = *MEMORY[0x1E0DC1160];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("OD_LEARN_MORE"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v24;
    v28[2] = v13;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributes:range:", v26, v20, v22);

  }
  return (NSAttributedString *)v17;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  +[HKOrganDonationConnectionManager openDonateLifeMicroSiteInSafari](HKOrganDonationConnectionManager, "openDonateLifeMicroSiteInSafari", a3, a4, a5.location, a5.length, a6);
  return 0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITextView)callToActionTextView
{
  return self->_callToActionTextView;
}

- (void)setCallToActionTextView:(id)a3
{
  objc_storeStrong((id *)&self->_callToActionTextView, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIView)spacerView
{
  return self->_spacerView;
}

- (void)setSpacerView:(id)a3
{
  objc_storeStrong((id *)&self->_spacerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spacerView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_callToActionTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
