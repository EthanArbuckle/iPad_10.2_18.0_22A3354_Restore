@implementation SFPrivacyReportTrackingTableViewCell

- (SFPrivacyReportTrackingTableViewCell)initWithDetailLabel:(BOOL)a3 reuseIdentifier:(id)a4
{
  _BOOL4 v4;
  SFPrivacyReportTrackingTableViewCell *v5;
  SFPrivacyReportTrackingTableViewCell *v6;
  void *v7;
  UILabel *v8;
  UILabel *domainLabel;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *domainDetailLabel;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  UILabel *countLabel;
  void *v20;
  uint64_t v21;
  UILabel *maxCountLabel;
  void *v23;
  SFPrivacyReportMeterBar *v24;
  SFPrivacyReportMeterBar *countMeter;
  UILayoutGuide *v26;
  UILayoutGuide *maxCountMeterGuide;
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
  NSNumberFormatter *v47;
  NSNumberFormatter *countFormatter;
  SFPrivacyReportTrackingTableViewCell *v49;
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
  _BOOL4 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD v83[4];
  id v84;
  objc_super v85;
  _QWORD v86[4];
  _QWORD v87[12];

  v4 = a3;
  v87[10] = *MEMORY[0x1E0C80C00];
  v85.receiver = self;
  v85.super_class = (Class)SFPrivacyReportTrackingTableViewCell;
  v5 = -[SFPrivacyReportTrackingTableViewCell initWithStyle:reuseIdentifier:](&v85, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v6 = v5;
  if (v5)
  {
    -[SFPrivacyReportTrackingTableViewCell setAccessoryType:](v5, "setAccessoryType:", 1);
    -[SFPrivacyReportTrackingTableViewCell contentView](v6, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    domainLabel = v6->_domainLabel;
    v6->_domainLabel = v8;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_domainLabel, "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_domainLabel, "setTextColor:", v11);

    -[UILabel setNumberOfLines:](v6->_domainLabel, "setNumberOfLines:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_domainLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_domainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v6->_domainLabel);
    v78 = v4;
    if (v4)
    {
      v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
      domainDetailLabel = v6->_domainDetailLabel;
      v6->_domainDetailLabel = v12;

      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v6->_domainDetailLabel, "setFont:", v14);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v6->_domainDetailLabel, "setTextColor:", v15);

      -[UILabel setNumberOfLines:](v6->_domainDetailLabel, "setNumberOfLines:", 0);
      -[UILabel setAdjustsFontForContentSizeCategory:](v6->_domainDetailLabel, "setAdjustsFontForContentSizeCategory:", 1);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_domainDetailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v7, "addSubview:", v6->_domainDetailLabel);
    }
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __76__SFPrivacyReportTrackingTableViewCell_initWithDetailLabel_reuseIdentifier___block_invoke;
    v83[3] = &unk_1E4AC5D40;
    v16 = v7;
    v84 = v16;
    v17 = MEMORY[0x1A8598C40](v83);
    (*(void (**)(void))(v17 + 16))();
    v18 = objc_claimAutoreleasedReturnValue();
    countLabel = v6->_countLabel;
    v6->_countLabel = (UILabel *)v18;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_countLabel, "setTextColor:", v20);

    v80 = (void *)v17;
    (*(void (**)(uint64_t))(v17 + 16))(v17);
    v21 = objc_claimAutoreleasedReturnValue();
    maxCountLabel = v6->_maxCountLabel;
    v6->_maxCountLabel = (UILabel *)v21;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_maxCountLabel, "setTextColor:", v23);

    -[UILabel setHidden:](v6->_maxCountLabel, "setHidden:", 1);
    v24 = objc_alloc_init(SFPrivacyReportMeterBar);
    countMeter = v6->_countMeter;
    v6->_countMeter = v24;

    -[SFPrivacyReportMeterBar setTranslatesAutoresizingMaskIntoConstraints:](v6->_countMeter, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "addSubview:", v6->_countMeter);
    v26 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0DC39A0]);
    maxCountMeterGuide = v6->_maxCountMeterGuide;
    v6->_maxCountMeterGuide = v26;

    objc_msgSend(v16, "addLayoutGuide:", v6->_maxCountMeterGuide);
    objc_msgSend(v16, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v6->_domainLabel, "leadingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintEqualToAnchor:", v74);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v72;
    -[UILabel trailingAnchor](v6->_domainLabel, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:", v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v68;
    -[UILayoutGuide leadingAnchor](v6->_maxCountMeterGuide, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v87[2] = v65;
    -[UILabel leadingAnchor](v6->_maxCountLabel, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](v6->_maxCountMeterGuide, "trailingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v63, 1.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v87[3] = v62;
    -[UILabel trailingAnchor](v6->_maxCountLabel, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, -12.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v87[4] = v58;
    -[UILabel leadingAnchor](v6->_countLabel, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportMeterBar trailingAnchor](v6->_countMeter, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v56, 1.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v87[5] = v55;
    -[SFPrivacyReportMeterBar leadingAnchor](v6->_countMeter, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v28;
    objc_msgSend(v28, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v87[6] = v52;
    -[UILabel topAnchor](v6->_domainLabel, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v29, 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v87[7] = v30;
    v81 = v16;
    objc_msgSend(v16, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v6->_countLabel, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v32, 1.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v87[8] = v33;
    -[SFPrivacyReportMeterBar centerYAnchor](v6->_countMeter, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v6->_countLabel, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v87[9] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "activateConstraints:", v37);

    if (v78)
    {
      v75 = (void *)MEMORY[0x1E0CB3718];
      -[UILabel leadingAnchor](v6->_domainDetailLabel, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToAnchor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v86[0] = v40;
      -[UILabel trailingAnchor](v6->_domainDetailLabel, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "constraintEqualToAnchor:", v77);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v86[1] = v73;
      -[UILabel topAnchor](v6->_domainDetailLabel, "topAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](v6->_domainLabel, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v41, 0.25);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v86[2] = v42;
      -[UILabel topAnchor](v6->_countLabel, "topAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](v6->_domainDetailLabel, "bottomAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v44, 0.25);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v86[3] = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "activateConstraints:", v46);

    }
    else
    {
      -[UILabel topAnchor](v6->_countLabel, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel bottomAnchor](v6->_domainLabel, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v39, 0.25);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setActive:", 1);
    }

    v47 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    countFormatter = v6->_countFormatter;
    v6->_countFormatter = v47;

    -[NSNumberFormatter setNumberStyle:](v6->_countFormatter, "setNumberStyle:", 1);
    -[SFPrivacyReportTrackingTableViewCell _updateCountViews](v6, "_updateCountViews");
    v49 = v6;

  }
  return v6;
}

id __76__SFPrivacyReportTrackingTableViewCell_initWithDetailLabel_reuseIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v5);

  objc_msgSend(v2, "setNumberOfLines:", 1);
  objc_msgSend(v2, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);

  return v2;
}

- (void)setCount:(double)a3
{
  if (self->_count != a3)
  {
    self->_count = a3;
    -[SFPrivacyReportTrackingTableViewCell _updateCountViews](self, "_updateCountViews");
  }
}

- (void)setMaxCount:(double)a3
{
  if (self->_maxCount != a3)
  {
    self->_maxCount = a3;
    -[SFPrivacyReportTrackingTableViewCell _updateCountViews](self, "_updateCountViews");
  }
}

- (void)_updateCountViews
{
  NSNumberFormatter *countFormatter;
  void *v4;
  void *v5;
  NSNumberFormatter *v6;
  void *v7;
  void *v8;
  double maxCount;
  void *v10;
  void *v11;
  void *countMeterWidthConstraint;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *v15;
  double v16;

  countFormatter = self->_countFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_count);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](countFormatter, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_countLabel, "setText:", v5);

  v6 = self->_countFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v6, "stringFromNumber:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_maxCountLabel, "setText:", v8);

  -[NSLayoutConstraint setActive:](self->_countMeterWidthConstraint, "setActive:", 0);
  maxCount = self->_maxCount;
  -[SFPrivacyReportMeterBar widthAnchor](self->_countMeter, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (maxCount <= 0.0001)
  {
    objc_msgSend(v10, "constraintEqualToConstant:", 0.0);
    v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    countMeterWidthConstraint = self->_countMeterWidthConstraint;
    self->_countMeterWidthConstraint = v15;
  }
  else
  {
    -[UILayoutGuide widthAnchor](self->_maxCountMeterGuide, "widthAnchor");
    countMeterWidthConstraint = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:multiplier:", countMeterWidthConstraint, self->_count / self->_maxCount);
    v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v14 = self->_countMeterWidthConstraint;
    self->_countMeterWidthConstraint = v13;

  }
  LODWORD(v16) = 1144586240;
  -[NSLayoutConstraint setPriority:](self->_countMeterWidthConstraint, "setPriority:", v16);
  -[NSLayoutConstraint setActive:](self->_countMeterWidthConstraint, "setActive:", 1);
}

- (UILabel)domainLabel
{
  return self->_domainLabel;
}

- (UILabel)domainDetailLabel
{
  return self->_domainDetailLabel;
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (double)count
{
  return self->_count;
}

- (double)maxCount
{
  return self->_maxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_domainDetailLabel, 0);
  objc_storeStrong((id *)&self->_domainLabel, 0);
  objc_storeStrong((id *)&self->_countFormatter, 0);
  objc_storeStrong((id *)&self->_countMeterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_maxCountMeterGuide, 0);
  objc_storeStrong((id *)&self->_maxCountLabel, 0);
  objc_storeStrong((id *)&self->_countMeter, 0);
}

@end
