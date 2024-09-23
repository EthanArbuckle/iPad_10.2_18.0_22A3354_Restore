@implementation WDMedicalRecordDetailTitleCell

- (void)setupSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)WDMedicalRecordDetailTitleCell;
  -[WDMedicalRecordGroupableCell setupSubviews](&v56, sel_setupSubviews);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordDetailTitleCell setTitleLabel:](self, "setTitleLabel:", v3);

  objc_msgSend((id)objc_opt_class(), "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 8);

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineBreakMode:", 5);

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordDetailTitleCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[WDMedicalRecordDetailTitleCell setDateSubtitleLabel:](self, "setDateSubtitleLabel:", v13);

  objc_msgSend((id)objc_opt_class(), "_subtitleLabelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WDMedicalRecordDetailTitleCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 16.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29, -16.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 24.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, 16.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActive:", 1);

  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "firstBaselineAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "lastBaselineAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_subtitleLabelTopToFirstBaseline");
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setActive:", 1);

  -[WDMedicalRecordGroupableCell pillBackgroundView](self, "pillBackgroundView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "lastBaselineAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_subtitleLabelLastBaselineToBottom");
  objc_msgSend(v52, "constraintEqualToAnchor:constant:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setActive:", 1);

}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WDMedicalRecordDetailTitleCell titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDateSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)dateSubtitle
{
  void *v2;
  void *v3;

  -[WDMedicalRecordDetailTitleCell dateSubtitleLabel](self, "dateSubtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)_titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B50], 1024);
}

+ (double)_titleLabelTopToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 34.0);
  v4 = v3;

  return v4;
}

+ (id)_subtitleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

+ (double)_subtitleLabelTopToFirstBaseline
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_subtitleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 27.0);
  v4 = v3;

  return v4;
}

+ (double)_subtitleLabelLastBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend((id)objc_opt_class(), "_subtitleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 24.0);
  v4 = v3;

  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)dateSubtitleLabel
{
  return self->_dateSubtitleLabel;
}

- (void)setDateSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateSubtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
