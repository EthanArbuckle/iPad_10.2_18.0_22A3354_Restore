@implementation HKElectrocardiogramBulletedTextTableViewCell

- (HKElectrocardiogramBulletedTextTableViewCell)initWithReuseIdentifier:(id)a3
{
  HKElectrocardiogramBulletedTextTableViewCell *v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  UILabel *detailLabel;
  NSMutableArray *v8;
  NSMutableArray *bodyFirstBaselineConstraints;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramBulletedTextTableViewCell;
  v3 = -[HKElectrocardiogramBulletedTextTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 0, a3);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bodyFirstBaselineConstraints = v3->_bodyFirstBaselineConstraints;
    v3->_bodyFirstBaselineConstraints = v8;

    -[HKElectrocardiogramBulletedTextTableViewCell _setUpUI](v3, "_setUpUI");
  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKElectrocardiogramBulletedTextTableViewCell;
  -[HKElectrocardiogramBulletedTextTableViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HKElectrocardiogramBulletedTextTableViewCell setTitleText:](self, "setTitleText:", 0);
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)detailText
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDetailTextWithBullets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("•\t%@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  -[HKElectrocardiogramBulletedTextTableViewCell _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");

}

- (void)_updateLeadingDetailAttributedTextSize
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC37F8]);
  v4 = *MEMORY[0x1E0DC4B10];
  v5 = (void *)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x1E0DC4B10]);
  objc_msgSend(v5, "scaledValueForValue:", 12.0);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_alloc(MEMORY[0x1E0DC1328]);
  v11 = (void *)objc_msgSend(v10, "initWithTextAlignment:location:options:", 4, MEMORY[0x1E0C9AA70], v7);
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTabStops:", v12);

  objc_msgSend(v5, "scaledValueForValue:", 4.0);
  objc_msgSend(v9, "setParagraphSpacingBefore:");
  objc_msgSend(v9, "setDefaultTabInterval:", v7);
  objc_msgSend(v9, "setFirstLineHeadIndent:", 0.0);
  objc_msgSend(v9, "setHeadIndent:", v7);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1138];
  v22[0] = *MEMORY[0x1E0DC1178];
  v22[1] = v14;
  v23[0] = v9;
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v13);

  -[HKElectrocardiogramBulletedTextTableViewCell detailText](self, "detailText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[HKElectrocardiogramBulletedTextTableViewCell detailText](self, "detailText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v15);
    -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttributedText:", v20);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
    goto LABEL_3;
  objc_msgSend(v9, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    -[HKElectrocardiogramBulletedTextTableViewCell _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");
    -[HKElectrocardiogramBulletedTextTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v8 = v9;
  }

}

- (void)_setUpUI
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

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v13);

  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextAlignment:", 4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v20);

  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  -[HKElectrocardiogramBulletedTextTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  -[HKElectrocardiogramBulletedTextTableViewCell _setupConstraints](self, "_setupConstraints");
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
  _QWORD v49[4];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  -[HKElectrocardiogramBulletedTextTableViewCell bodyFirstBaselineConstraints](self, "bodyFirstBaselineConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "firstBaselineAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v5;
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstBaselineAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramBulletedTextTableViewCell bodyFirstBaselineConstraints](self, "bodyFirstBaselineConstraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateConstraints:", v13);

  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastBaselineAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell setDetailLabelLastBaselineConstraint:](self, "setDetailLabelLastBaselineConstraint:", v18);

  -[HKElectrocardiogramBulletedTextTableViewCell detailLabelLastBaselineConstraint](self, "detailLabelLastBaselineConstraint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  v34 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "layoutMarginsGuide");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v40;
  -[HKElectrocardiogramBulletedTextTableViewCell titleLabel](self, "titleLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutMarginsGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v33;
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v22;
  -[HKElectrocardiogramBulletedTextTableViewCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabel](self, "detailLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v29);

}

- (void)updateConstraints
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC37F8]);
  v4 = (void *)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKElectrocardiogramBulletedTextTableViewCell bodyFirstBaselineConstraints](self, "bodyFirstBaselineConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(v4, "scaledValueForValue:", 24.0);
        objc_msgSend(v10, "setConstant:");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v11 = objc_alloc(MEMORY[0x1E0DC37F8]);
  v12 = (void *)objc_msgSend(v11, "initForTextStyle:", *MEMORY[0x1E0DC4B10]);
  objc_msgSend(v12, "scaledValueForValue:", 16.0);
  v14 = v13;
  -[HKElectrocardiogramBulletedTextTableViewCell detailLabelLastBaselineConstraint](self, "detailLabelLastBaselineConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v14);

  v16.receiver = self;
  v16.super_class = (Class)HKElectrocardiogramBulletedTextTableViewCell;
  -[HKElectrocardiogramBulletedTextTableViewCell updateConstraints](&v16, sel_updateConstraints);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (NSMutableArray)bodyFirstBaselineConstraints
{
  return self->_bodyFirstBaselineConstraints;
}

- (void)setBodyFirstBaselineConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraints, a3);
}

- (NSLayoutConstraint)detailLabelLastBaselineConstraint
{
  return self->_detailLabelLastBaselineConstraint;
}

- (void)setDetailLabelLastBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabelLastBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabelLastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
