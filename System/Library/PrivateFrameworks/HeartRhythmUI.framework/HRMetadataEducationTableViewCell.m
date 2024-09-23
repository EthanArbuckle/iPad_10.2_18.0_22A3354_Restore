@implementation HRMetadataEducationTableViewCell

+ (id)defaultReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HRMetadataEducationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HRMetadataEducationTableViewCell *v4;
  HRMetadataEducationTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRMetadataEducationTableViewCell;
  v4 = -[HRMetadataEducationTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HRMetadataEducationTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[HRMetadataEducationTableViewCell _setUpUI](v5, "_setUpUI");
    -[HRMetadataEducationTableViewCell _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
}

- (void)setTitleText:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSString *titleText;
  BOOL v8;
  void *v9;
  void *v10;
  NSString *v11;

  v5 = (NSString *)a3;
  v6 = v5;
  titleText = self->_titleText;
  if (titleText != v5)
  {
    v11 = v5;
    if (!titleText || (v8 = -[NSString isEqualToString:](v5, "isEqualToString:"), v6 = v11, !v8))
    {
      objc_storeStrong((id *)&self->_titleText, a3);
      -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v11);

      -[HRMetadataEducationTableViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

      v6 = v11;
    }
  }

}

- (void)setBodyText:(id)a3
{
  NSString *v5;
  NSString *v6;
  NSString *bodyText;
  BOOL v8;
  void *v9;
  void *v10;
  NSString *v11;

  v5 = (NSString *)a3;
  v6 = v5;
  bodyText = self->_bodyText;
  if (bodyText != v5)
  {
    v11 = v5;
    if (!bodyText || (v8 = -[NSString isEqualToString:](v5, "isEqualToString:"), v6 = v11, !v8))
    {
      objc_storeStrong((id *)&self->_bodyText, a3);
      -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v11);

      -[HRMetadataEducationTableViewCell contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

      v6 = v11;
    }
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRMetadataEducationTableViewCell;
  -[HRMetadataEducationTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HRMetadataEducationTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HRMetadataEducationTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (void)_setUpUI
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
  id v22;

  -[HRMetadataEducationTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRMetadataEducationTableViewCell setTitleLabel:](self, "setTitleLabel:", v3);

  -[HRMetadataEducationTableViewCell _titleLabelFont](self, "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  -[HRMetadataEducationTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRMetadataEducationTableViewCell setBodyLabel:](self, "setBodyLabel:", v13);

  -[HRMetadataEducationTableViewCell _bodyLabelFont](self, "_bodyLabelFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNumberOfLines:", 0);

  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAdjustsFontForContentSizeCategory:", 1);

  -[HRMetadataEducationTableViewCell contentView](self, "contentView");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

}

- (void)_setUpConstraints
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
  id v25;

  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMarginsGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hrui_alignHorizontalConstraintsWithGuide:insets:", v5, *MEMORY[0x24BDF65E8], *(double *)(MEMORY[0x24BDF65E8] + 8), *(double *)(MEMORY[0x24BDF65E8] + 16), *(double *)(MEMORY[0x24BDF65E8] + 24));

  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_alignHorizontalConstraintsWithView:margin:", v7, 0.0);

  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell _topToTitleBaseline](self, "_topToTitleBaseline");
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell setTopToTitleBaselineConstraint:](self, "setTopToTitleBaselineConstraint:", v12);

  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstBaselineAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell titleLabel](self, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastBaselineAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell _titleBaselineToBodyBaseline](self, "_titleBaselineToBodyBaseline");
  objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell setTitleBaselineToBodyBaselineConstraint:](self, "setTitleBaselineToBodyBaselineConstraint:", v17);

  -[HRMetadataEducationTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell _bodyBottomAnchorToBottom](self, "_bodyBottomAnchorToBottom");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRMetadataEducationTableViewCell setBodyBottomAnchorToBottomConstraint:](self, "setBodyBottomAnchorToBottomConstraint:", v22);

  -[HRMetadataEducationTableViewCell topToTitleBaselineConstraint](self, "topToTitleBaselineConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setActive:", 1);

  -[HRMetadataEducationTableViewCell titleBaselineToBodyBaselineConstraint](self, "titleBaselineToBodyBaselineConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[HRMetadataEducationTableViewCell bodyBottomAnchorToBottomConstraint](self, "bodyBottomAnchorToBottomConstraint");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

}

- (void)_updateForCurrentSizeCategory
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  -[HRMetadataEducationTableViewCell _topToTitleBaseline](self, "_topToTitleBaseline");
  v4 = v3;
  -[HRMetadataEducationTableViewCell topToTitleBaselineConstraint](self, "topToTitleBaselineConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", v4);

  -[HRMetadataEducationTableViewCell _titleBaselineToBodyBaseline](self, "_titleBaselineToBodyBaseline");
  v7 = v6;
  -[HRMetadataEducationTableViewCell titleBaselineToBodyBaselineConstraint](self, "titleBaselineToBodyBaselineConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v7);

  -[HRMetadataEducationTableViewCell _bodyBottomAnchorToBottom](self, "_bodyBottomAnchorToBottom");
  v10 = v9;
  -[HRMetadataEducationTableViewCell bodyBottomAnchorToBottomConstraint](self, "bodyBottomAnchorToBottomConstraint");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v10);

}

- (id)_titleLabelFontTextStyle
{
  return (id)*MEMORY[0x24BDF7850];
}

- (id)_bodyLabelFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRMetadataEducationTableViewCell _titleLabelFontTextStyle](self, "_titleLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bodyLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRMetadataEducationTableViewCell _bodyLabelFontTextStyle](self, "_bodyLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_topToTitleBaseline
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRMetadataEducationTableViewCell _titleLabelFontTextStyle](self, "_titleLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 44.0);
  v6 = v5;

  return v6;
}

- (double)_titleBaselineToBodyBaseline
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRMetadataEducationTableViewCell _titleLabelFontTextStyle](self, "_titleLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 28.0);
  v6 = v5;

  return v6;
}

- (double)_bodyBottomAnchorToBottom
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRMetadataEducationTableViewCell _bodyLabelFontTextStyle](self, "_bodyLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 28.0);
  v6 = v5;

  return v6;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (NSLayoutConstraint)topToTitleBaselineConstraint
{
  return self->_topToTitleBaselineConstraint;
}

- (void)setTopToTitleBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToTitleBaselineConstraint, a3);
}

- (NSLayoutConstraint)titleBaselineToBodyBaselineConstraint
{
  return self->_titleBaselineToBodyBaselineConstraint;
}

- (void)setTitleBaselineToBodyBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleBaselineToBodyBaselineConstraint, a3);
}

- (NSLayoutConstraint)bodyBottomAnchorToBottomConstraint
{
  return self->_bodyBottomAnchorToBottomConstraint;
}

- (void)setBodyBottomAnchorToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bodyBottomAnchorToBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyBottomAnchorToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineToBodyBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
