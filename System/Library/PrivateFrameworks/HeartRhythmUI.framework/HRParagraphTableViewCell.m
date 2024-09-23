@implementation HRParagraphTableViewCell

- (HRParagraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HRParagraphTableViewCell *v4;
  HRParagraphTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRParagraphTableViewCell;
  v4 = -[HRParagraphTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[HRParagraphTableViewCell _setUpUI](v4, "_setUpUI");
    -[HRParagraphTableViewCell _setUpConstraints](v5, "_setUpConstraints");
  }
  return v5;
}

- (HRParagraphTableViewCell)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (void)setTitleText:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)setParagraphText:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_paragraphText, a3);
  v5 = a3;
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (void)setButtonText:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_buttonText, a3);
  v5 = a3;
  -[HRParagraphTableViewCell button](self, "button");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v5, 0);

  -[HRParagraphTableViewCell _updateBottomConstraint](self, "_updateBottomConstraint");
  -[HRParagraphTableViewCell contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
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
  v9.super_class = (Class)HRParagraphTableViewCell;
  -[HRParagraphTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HRParagraphTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HRParagraphTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
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
  id v12;
  void *v13;
  void *v14;
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
  id v30;

  -[HRParagraphTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRParagraphTableViewCell setTitleLabel:](self, "setTitleLabel:", v3);

  -[HRParagraphTableViewCell _titleLabelFont](self, "_titleLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  v12 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[HRParagraphTableViewCell setParagraphLabel:](self, "setParagraphLabel:", v12);

  -[HRParagraphTableViewCell _paragraphLabelFont](self, "_paragraphLabelFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v13);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNumberOfLines:", 0);

  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = objc_alloc_init(MEMORY[0x24BDF6880]);
  -[HRParagraphTableViewCell setButton:](self, "setButton:", v21);

  -[HRParagraphTableViewCell _buttonFont](self, "_buttonFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell button](self, "button");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v22);

  -[HRParagraphTableViewCell button](self, "button");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthKeyColor();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitleColor:forState:", v26, 0);

  -[HRParagraphTableViewCell button](self, "button");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setContentHorizontalAlignment:", -[HRParagraphTableViewCell _buttonHorizontalAlignment](self, "_buttonHorizontalAlignment"));

  -[HRParagraphTableViewCell button](self, "button");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell button](self, "button");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v29);

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

  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell _titleLabelTopToBaseline](self, "_titleLabelTopToBaseline");
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell setTitleLabelBaselineConstraint:](self, "setTitleLabelBaselineConstraint:", v7);

  -[HRParagraphTableViewCell titleLabelBaselineConstraint](self, "titleLabelBaselineConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell layoutMarginsGuide](self, "layoutMarginsGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hrui_alignHorizontalConstraintsWithGuide:insets:", v10, *MEMORY[0x24BDF65E8], *(double *)(MEMORY[0x24BDF65E8] + 8), *(double *)(MEMORY[0x24BDF65E8] + 16), *(double *)(MEMORY[0x24BDF65E8] + 24));

  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstBaselineAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastBaselineAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell _titleLabelBaselineToParagraphBaseline](self, "_titleLabelBaselineToParagraphBaseline");
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell setParagraphLabelBaselineConstraint:](self, "setParagraphLabelBaselineConstraint:", v15);

  -[HRParagraphTableViewCell paragraphLabelBaselineConstraint](self, "paragraphLabelBaselineConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:margin:", v18, 0.0);

  -[HRParagraphTableViewCell button](self, "button");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell _subtitleLabelBaselineToButton](self, "_subtitleLabelBaselineToButton");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell setButtonBaselineConstraint:](self, "setButtonBaselineConstraint:", v23);

  -[HRParagraphTableViewCell buttonBaselineConstraint](self, "buttonBaselineConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[HRParagraphTableViewCell button](self, "button");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hk_alignHorizontalConstraintsWithView:margin:", v26, 0.0);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lastBaselineAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell _lastViewToBottom](self, "_lastViewToBottom");
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell setContentViewParagraphBottomConstraint:](self, "setContentViewParagraphBottomConstraint:", v31);

  -[HRParagraphTableViewCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell button](self, "button");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lastBaselineAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell _lastViewToBottom](self, "_lastViewToBottom");
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell setContentViewButtonBottomConstraint:](self, "setContentViewButtonBottomConstraint:", v36);

  -[HRParagraphTableViewCell _updateBottomConstraint](self, "_updateBottomConstraint");
}

- (id)_titleLabelFontTextStyle
{
  return (id)*MEMORY[0x24BDF7858];
}

- (id)_titleLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRParagraphTableViewCell _titleLabelFontTextStyle](self, "_titleLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 32770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleLabelTopToBaseline
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRParagraphTableViewCell _titleLabelFontTextStyle](self, "_titleLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 30.0);
  v6 = v5;

  return v6;
}

- (id)_paragraphLabelFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_paragraphLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRParagraphTableViewCell _paragraphLabelFontTextStyle](self, "_paragraphLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_titleLabelBaselineToParagraphBaseline
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRParagraphTableViewCell _paragraphLabelFontTextStyle](self, "_paragraphLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 24.0);
  v6 = v5;

  return v6;
}

- (double)_subtitleLabelBaselineToButton
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRParagraphTableViewCell _paragraphLabelFontTextStyle](self, "_paragraphLabelFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 24.0);
  v6 = v5;

  return v6;
}

- (id)_buttonFontTextStyle
{
  return (id)*MEMORY[0x24BDF77B0];
}

- (id)_buttonFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6A70];
  -[HRParagraphTableViewCell _buttonFontTextStyle](self, "_buttonFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 0x8000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_lastViewToBottom
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BDF6A80];
  -[HRParagraphTableViewCell _buttonFontTextStyle](self, "_buttonFontTextStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metricsForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "scaledValueForValue:", 20.0);
  v6 = v5;

  return v6;
}

- (void)_updateBottomConstraint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[HRParagraphTableViewCell buttonText](self, "buttonText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRParagraphTableViewCell contentViewParagraphBottomConstraint](self, "contentViewParagraphBottomConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setActive:", 0);

    -[HRParagraphTableViewCell contentViewButtonBottomConstraint](self, "contentViewButtonBottomConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "setActive:", 1);

    -[HRParagraphTableViewCell contentViewButtonBottomConstraint](self, "contentViewButtonBottomConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v7 = 0;
  }
  objc_msgSend(v6, "setActive:", v7);

}

- (int64_t)_buttonHorizontalAlignment
{
  if (-[HRParagraphTableViewCell hk_isLeftToRight](self, "hk_isLeftToRight"))
    return 1;
  else
    return 2;
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;

  -[HRParagraphTableViewCell _titleLabelFont](self, "_titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[HRParagraphTableViewCell _paragraphLabelFont](self, "_paragraphLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell paragraphLabel](self, "paragraphLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[HRParagraphTableViewCell _buttonFont](self, "_buttonFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRParagraphTableViewCell button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);

  -[HRParagraphTableViewCell _titleLabelTopToBaseline](self, "_titleLabelTopToBaseline");
  v11 = v10;
  -[HRParagraphTableViewCell titleLabelBaselineConstraint](self, "titleLabelBaselineConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConstant:", v11);

  -[HRParagraphTableViewCell _titleLabelBaselineToParagraphBaseline](self, "_titleLabelBaselineToParagraphBaseline");
  v14 = v13;
  -[HRParagraphTableViewCell paragraphLabelBaselineConstraint](self, "paragraphLabelBaselineConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v14);

  -[HRParagraphTableViewCell _subtitleLabelBaselineToButton](self, "_subtitleLabelBaselineToButton");
  v17 = v16;
  -[HRParagraphTableViewCell buttonBaselineConstraint](self, "buttonBaselineConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v17);

  -[HRParagraphTableViewCell _lastViewToBottom](self, "_lastViewToBottom");
  v20 = v19;
  -[HRParagraphTableViewCell contentViewParagraphBottomConstraint](self, "contentViewParagraphBottomConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConstant:", v20);

  -[HRParagraphTableViewCell _lastViewToBottom](self, "_lastViewToBottom");
  v23 = v22;
  -[HRParagraphTableViewCell contentViewButtonBottomConstraint](self, "contentViewButtonBottomConstraint");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", v23);

  -[HRParagraphTableViewCell _updateBottomConstraint](self, "_updateBottomConstraint");
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)paragraphText
{
  return self->_paragraphText;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)paragraphLabel
{
  return self->_paragraphLabel;
}

- (void)setParagraphLabel:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphLabel, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (NSLayoutConstraint)titleLabelBaselineConstraint
{
  return self->_titleLabelBaselineConstraint;
}

- (void)setTitleLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)paragraphLabelBaselineConstraint
{
  return self->_paragraphLabelBaselineConstraint;
}

- (void)setParagraphLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)buttonBaselineConstraint
{
  return self->_buttonBaselineConstraint;
}

- (void)setButtonBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_buttonBaselineConstraint, a3);
}

- (NSLayoutConstraint)contentViewParagraphBottomConstraint
{
  return self->_contentViewParagraphBottomConstraint;
}

- (void)setContentViewParagraphBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewParagraphBottomConstraint, a3);
}

- (NSLayoutConstraint)contentViewButtonBottomConstraint
{
  return self->_contentViewButtonBottomConstraint;
}

- (void)setContentViewButtonBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewButtonBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewParagraphBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_paragraphLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_paragraphLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_paragraphText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
