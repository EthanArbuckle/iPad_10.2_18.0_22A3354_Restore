@implementation SFPrivacyReportOverviewCellContentView

- (SFPrivacyReportOverviewCellContentView)initWithFrame:(CGRect)a3
{
  SFPrivacyReportOverviewCellContentView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  uint64_t v13;
  UILabel *subtitleLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SFPrivacyReportOverviewCellContentView *v32;
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
  objc_super v51;
  _QWORD v52[10];

  v52[8] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)SFPrivacyReportOverviewCellContentView;
  v3 = -[SFPrivacyReportOverviewCellView initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0);
    -[UILabel setLineBreakStrategy:](v3->_titleLabel, "setLineBreakStrategy:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v12);

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (UILabel *)v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_subtitleLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v3->_subtitleLabel, "setLineBreakMode:", 0);
    -[UILabel setLineBreakStrategy:](v3->_subtitleLabel, "setLineBreakStrategy:", 1);
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B60]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v50, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v16);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFPrivacyReportOverviewCellContentView addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[SFPrivacyReportOverviewCellContentView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    -[SFPrivacyReportOverviewCellContentView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v47;
    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    objc_msgSend(v17, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v44;
    -[UILabel centerXAnchor](v3->_titleLabel, "centerXAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView centerXAnchor](v3, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v41;
    -[UILabel topAnchor](v3->_subtitleLabel, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v38, 4.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v37;
    -[UILabel topAnchor](v3->_subtitleLabel, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 4.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v22) = 1131413504;
    objc_msgSend(v21, "setPriority:", v22);
    v52[4] = v21;
    -[UILabel leadingAnchor](v3->_subtitleLabel, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v18;
    v23 = v18;
    objc_msgSend(v18, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v52[5] = v24;
    -[UILabel centerXAnchor](v3->_subtitleLabel, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportOverviewCellContentView centerXAnchor](v3, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v52[6] = v27;
    -[UILabel bottomAnchor](v3->_subtitleLabel, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52[7] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v31);

    v32 = v3;
  }

  return v3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
