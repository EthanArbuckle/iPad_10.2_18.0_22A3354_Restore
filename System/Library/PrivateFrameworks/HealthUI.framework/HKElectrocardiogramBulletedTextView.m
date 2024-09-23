@implementation HKElectrocardiogramBulletedTextView

- (HKElectrocardiogramBulletedTextView)init
{
  HKElectrocardiogramBulletedTextView *v2;
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
  UILabel *detailLabel;
  NSMutableArray *v7;
  NSMutableArray *bodyFirstBaselineConstraints;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKElectrocardiogramBulletedTextView;
  v2 = -[HKElectrocardiogramBulletedTextView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v3;

    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    detailLabel = v2->_detailLabel;
    v2->_detailLabel = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bodyFirstBaselineConstraints = v2->_bodyFirstBaselineConstraints;
    v2->_bodyFirstBaselineConstraints = v7;

    -[HKElectrocardiogramBulletedTextView _setUpUI](v2, "_setUpUI");
  }
  return v2;
}

- (NSString)titleText
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
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
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)detailText
{
  void *v2;
  void *v3;

  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
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
    -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

  }
  -[HKElectrocardiogramBulletedTextView _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");

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
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v13);

  -[HKElectrocardiogramBulletedTextView detailText](self, "detailText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[HKElectrocardiogramBulletedTextView detailText](self, "detailText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v19, v15);
    -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
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
  -[HKElectrocardiogramBulletedTextView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  v8 = v9;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    -[HKElectrocardiogramBulletedTextView _updateLeadingDetailAttributedTextSize](self, "_updateLeadingDetailAttributedTextSize");
    -[HKElectrocardiogramBulletedTextView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
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

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView addSubview:](self, "addSubview:", v12);

  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNumberOfLines:", 0);

  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextAlignment:", 4);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v17);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v19);

  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView addSubview:](self, "addSubview:", v21);

  -[HKElectrocardiogramBulletedTextView _setupConstraints](self, "_setupConstraints");
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
  _QWORD v42[4];
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView topAnchor](self, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 10.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[HKElectrocardiogramBulletedTextView bodyFirstBaselineConstraints](self, "bodyFirstBaselineConstraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastBaselineAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v13);

  v14 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramBulletedTextView bodyFirstBaselineConstraints](self, "bodyFirstBaselineConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v15);

  -[HKElectrocardiogramBulletedTextView bottomAnchor](self, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 10.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  v32 = (void *)MEMORY[0x1E0CB3718];
  -[HKElectrocardiogramBulletedTextView layoutMarginsGuide](self, "layoutMarginsGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v37;
  -[HKElectrocardiogramBulletedTextView titleLabel](self, "titleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView layoutMarginsGuide](self, "layoutMarginsGuide");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintGreaterThanOrEqualToAnchor:", v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v31;
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView layoutMarginsGuide](self, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v23;
  -[HKElectrocardiogramBulletedTextView layoutMarginsGuide](self, "layoutMarginsGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKElectrocardiogramBulletedTextView detailLabel](self, "detailLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "activateConstraints:", v29);

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
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC37F8]);
  v4 = (void *)objc_msgSend(v3, "initForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKElectrocardiogramBulletedTextView bodyFirstBaselineConstraints](self, "bodyFirstBaselineConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(v4, "scaledValueForValue:", 24.0);
        objc_msgSend(v10, "setConstant:");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramBulletedTextView;
  -[HKElectrocardiogramBulletedTextView updateConstraints](&v11, sel_updateConstraints);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
