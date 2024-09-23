@implementation HKParagraphTableViewCell

- (HKParagraphTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKParagraphTableViewCell *v4;
  HKParagraphTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKParagraphTableViewCell;
  v4 = -[HKParagraphTableViewCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKParagraphTableViewCell _setupUI](v4, "_setupUI");
  return v5;
}

- (HKParagraphTableViewCell)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (void)_setupUI
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *paragraphLabel;
  void *v10;
  void *v11;
  void *v12;
  UIButton *v13;
  UIButton *button;
  void *v15;
  void *v16;
  UIButton *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *titleLabelBaselineConstraint;
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
  NSLayoutConstraint *v35;
  NSLayoutConstraint *paragraphLabelBaselineConstraint;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *buttonBaselineConstraint;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *contentViewBottomConstraint;

  -[HKParagraphTableViewCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[HKParagraphTableViewCell _titleLabelFont](self, "_titleLabelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKParagraphTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_titleLabel);

  v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  paragraphLabel = self->_paragraphLabel;
  self->_paragraphLabel = v8;

  -[HKParagraphTableViewCell _paragraphLabelFont](self, "_paragraphLabelFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_paragraphLabel, "setFont:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_paragraphLabel, "setTextColor:", v11);

  -[UILabel setNumberOfLines:](self->_paragraphLabel, "setNumberOfLines:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_paragraphLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKParagraphTableViewCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_paragraphLabel);

  v13 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
  button = self->_button;
  self->_button = v13;

  -[HKParagraphTableViewCell _buttonFont](self, "_buttonFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_button, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v15);

  v17 = self->_button;
  HKHealthKeyColor();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](v17, "setTitleColor:forState:", v18, 0);

  -[UIButton setContentHorizontalAlignment:](self->_button, "setContentHorizontalAlignment:", -[HKParagraphTableViewCell _buttonHorizontalAlignment](self, "_buttonHorizontalAlignment"));
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKParagraphTableViewCell contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_button);

  -[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell _titleLabelTopToBaseline](self, "_titleLabelTopToBaseline");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22);
  v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleLabelBaselineConstraint = self->_titleLabelBaselineConstraint;
  self->_titleLabelBaselineConstraint = v23;

  -[NSLayoutConstraint setActive:](self->_titleLabelBaselineConstraint, "setActive:", 1);
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -20.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[UILabel firstBaselineAnchor](self->_paragraphLabel, "firstBaselineAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell _titleLabelBaselineToParagraphBaseline](self, "_titleLabelBaselineToParagraphBaseline");
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);
  v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  paragraphLabelBaselineConstraint = self->_paragraphLabelBaselineConstraint;
  self->_paragraphLabelBaselineConstraint = v35;

  -[NSLayoutConstraint setActive:](self->_paragraphLabelBaselineConstraint, "setActive:", 1);
  -[UILabel leadingAnchor](self->_paragraphLabel, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_titleLabel, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setActive:", 1);

  -[UILabel trailingAnchor](self->_paragraphLabel, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_titleLabel, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  -[UIButton firstBaselineAnchor](self->_button, "firstBaselineAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_paragraphLabel, "lastBaselineAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell _subtitleLabelBaselineToButton](self, "_subtitleLabelBaselineToButton");
  objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44);
  v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  buttonBaselineConstraint = self->_buttonBaselineConstraint;
  self->_buttonBaselineConstraint = v45;

  -[NSLayoutConstraint setActive:](self->_buttonBaselineConstraint, "setActive:", 1);
  -[UIButton leadingAnchor](self->_button, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel leadingAnchor](self->_paragraphLabel, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActive:", 1);

  -[UIButton trailingAnchor](self->_button, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel trailingAnchor](self->_paragraphLabel, "trailingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[HKParagraphTableViewCell contentView](self, "contentView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton lastBaselineAnchor](self->_button, "lastBaselineAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKParagraphTableViewCell _buttonBaselineToBottom](self, "_buttonBaselineToBottom");
  objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55);
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewBottomConstraint = self->_contentViewBottomConstraint;
  self->_contentViewBottomConstraint = v56;

  -[NSLayoutConstraint setActive:](self->_contentViewBottomConstraint, "setActive:", 1);
}

- (id)_titleLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4B60], 32770);
}

- (double)_titleLabelTopToBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HKParagraphTableViewCell _titleLabelFont](self, "_titleLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 30.0);
  v4 = v3;

  return v4;
}

- (double)_titleLabelBaselineToParagraphBaseline
{
  void *v2;
  double v3;
  double v4;

  -[HKParagraphTableViewCell _paragraphLabelFont](self, "_paragraphLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (id)_paragraphLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 0x8000);
}

- (double)_subtitleLabelBaselineToButton
{
  void *v2;
  double v3;
  double v4;

  -[HKParagraphTableViewCell _paragraphLabelFont](self, "_paragraphLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (id)_buttonFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 0x8000);
}

- (double)_buttonBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  -[HKParagraphTableViewCell _buttonFont](self, "_buttonFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (int64_t)_buttonHorizontalAlignment
{
  if (-[UIView hk_isLeftToRight](self, "hk_isLeftToRight"))
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

  -[HKParagraphTableViewCell _titleLabelFont](self, "_titleLabelFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

  -[HKParagraphTableViewCell _paragraphLabelFont](self, "_paragraphLabelFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_paragraphLabel, "setFont:", v4);

  -[HKParagraphTableViewCell _buttonFont](self, "_buttonFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_button, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  -[HKParagraphTableViewCell _titleLabelTopToBaseline](self, "_titleLabelTopToBaseline");
  -[NSLayoutConstraint setConstant:](self->_titleLabelBaselineConstraint, "setConstant:");
  -[HKParagraphTableViewCell _titleLabelBaselineToParagraphBaseline](self, "_titleLabelBaselineToParagraphBaseline");
  -[NSLayoutConstraint setConstant:](self->_paragraphLabelBaselineConstraint, "setConstant:");
  -[HKParagraphTableViewCell _subtitleLabelBaselineToButton](self, "_subtitleLabelBaselineToButton");
  -[NSLayoutConstraint setConstant:](self->_buttonBaselineConstraint, "setConstant:");
  -[HKParagraphTableViewCell _buttonBaselineToBottom](self, "_buttonBaselineToBottom");
  -[NSLayoutConstraint setConstant:](self->_contentViewBottomConstraint, "setConstant:");
}

- (void)setTitleText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_titleText, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[HKParagraphTableViewCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)setParagraphText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_paragraphText, a3);
  v5 = a3;
  -[UILabel setText:](self->_paragraphLabel, "setText:", v5);

  -[HKParagraphTableViewCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)setButtonText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_buttonText, a3);
  v5 = a3;
  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v5, 0);

  -[HKParagraphTableViewCell contentView](self, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

+ (id)reuseIdentifier
{
  return CFSTR("HKParagraphTableViewCellIdentifier");
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
  v9.super_class = (Class)HKParagraphTableViewCell;
  -[HKParagraphTableViewCell traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKParagraphTableViewCell traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKParagraphTableViewCell _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_paragraphText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_buttonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_paragraphLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_paragraphLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
