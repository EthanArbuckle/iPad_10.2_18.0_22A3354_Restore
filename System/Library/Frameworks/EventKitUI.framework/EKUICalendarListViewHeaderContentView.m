@implementation EKUICalendarListViewHeaderContentView

- (EKUICalendarListViewHeaderContentView)initWithFrame:(CGRect)a3
{
  EKUICalendarListViewHeaderContentView *v3;
  UILabel *v4;
  UILabel *weekDayLabel;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *altCalendarLabel;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *weekNumberLabel;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *accessibilityLeadingMarginConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  double v30;
  double v31;
  uint64_t v32;
  EKUICalendarListViewHeaderContentView *v33;
  uint64_t v34;
  void *v35;
  double v36;
  uint64_t v37;
  NSLayoutConstraint *trailingMarginConstraint;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)EKUICalendarListViewHeaderContentView;
  v3 = -[EKUICalendarListViewHeaderContentView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    weekDayLabel = v3->_weekDayLabel;
    v3->_weekDayLabel = v4;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_weekDayLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "dynamicFontSizeForMainText");
    objc_msgSend(v6, "boldSystemFontOfSize:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_weekDayLabel, "setFont:", v7);

    -[EKUICalendarListViewHeaderContentView addSubview:](v3, "addSubview:", v3->_weekDayLabel);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    altCalendarLabel = v3->_altCalendarLabel;
    v3->_altCalendarLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_altCalendarLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "dynamicFontSizeForSecondaryText");
    objc_msgSend(v10, "boldSystemFontOfSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_altCalendarLabel, "setFont:", v11);

    -[EKUICalendarListViewHeaderContentView addSubview:](v3, "addSubview:", v3->_altCalendarLabel);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    weekNumberLabel = v3->_weekNumberLabel;
    v3->_weekNumberLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_weekNumberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend((id)objc_opt_class(), "dynamicFontSizeForSecondaryText");
    objc_msgSend(v14, "systemFontOfSize:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_weekNumberLabel, "setFont:", v15);

    -[EKUICalendarListViewHeaderContentView addSubview:](v3, "addSubview:", v3->_weekNumberLabel);
    _NSDictionaryOfVariableBindings(CFSTR("_weekDayLabel, _altCalendarLabel, _weekNumberLabel"), v3->_weekDayLabel, v3->_altCalendarLabel, v3->_weekNumberLabel, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "isAccessibilityLayout");
    v17 = (void *)MEMORY[0x1E0CB3718];
    if (v18 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leadingMargin)-[_weekDayLabel(>=0)]-[_altCalendarLabel]-[_weekNumberLabel]"), 0, &unk_1E606FBD8, v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v35);

      LODWORD(v36) = 0;
      -[UILabel setContentHuggingPriority:forAxis:](v3->_weekDayLabel, "setContentHuggingPriority:forAxis:", 0, v36);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3, 6, 0, v3->_weekNumberLabel, 6, 1.0, 16.0);
      v37 = objc_claimAutoreleasedReturnValue();
      trailingMarginConstraint = v3->_trailingMarginConstraint;
      v3->_trailingMarginConstraint = (NSLayoutConstraint *)v37;

      -[NSLayoutConstraint setActive:](v3->_trailingMarginConstraint, "setActive:", 1);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_weekDayLabel, 3, 0, v3, 3, 1.0, 8.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_weekDayLabel, 4, 0, v3, 4, 1.0, -8.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_altCalendarLabel, 10, 0, v3, 10, 1.0, 0.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setActive:", 1);

      v28 = (void *)MEMORY[0x1E0CB3718];
      v29 = v3->_weekNumberLabel;
      v30 = 1.0;
      v31 = 0.0;
      v32 = 10;
      v33 = v3;
      v34 = 10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leadingMargin)-[_weekDayLabel(>=0)]-(edgeMargin)-|"), 0, &unk_1E606FBD8, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v19);

      v20 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[_altCalendarLabel]-[_weekNumberLabel]-(>=edgeMargin)-|"), 0, &unk_1E606FBD8, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v21);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_altCalendarLabel, 5, 0, v3, 5, 1.0, 16.0);
      v22 = objc_claimAutoreleasedReturnValue();
      accessibilityLeadingMarginConstraint = v3->_accessibilityLeadingMarginConstraint;
      v3->_accessibilityLeadingMarginConstraint = (NSLayoutConstraint *)v22;

      -[NSLayoutConstraint setActive:](v3->_accessibilityLeadingMarginConstraint, "setActive:", 1);
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_weekDayLabel, 3, 0, v3, 3, 1.0, 8.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_altCalendarLabel, 3, 0, v3->_weekDayLabel, 4, 1.0, 0.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_weekNumberLabel, 3, 0, v3->_weekDayLabel, 4, 1.0, 0.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_altCalendarLabel, 4, 0, v3, 4, 1.0, -8.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setActive:", 1);

      v28 = (void *)MEMORY[0x1E0CB3718];
      v29 = v3->_weekNumberLabel;
      v30 = 1.0;
      v31 = -8.0;
      v32 = 4;
      v33 = v3;
      v34 = 4;
    }
    objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, v32, 0, v33, v34, v30, v31);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

  }
  return v3;
}

+ (double)isAccessibilityLayout
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  double result;

  objc_msgSend(a1, "dynamicFontSizeForMainText");
  v4 = v3;
  objc_msgSend(a1, "defaultFontSizeForMainText");
  v6 = v4 <= v5 + 4.0;
  result = 0.0;
  if (!v6)
    return 1.0;
  return result;
}

+ (double)defaultFontSizeForMainText
{
  return 16.0;
}

+ (double)dynamicFontSizeForMainText
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v6 = v5;

  objc_msgSend(a1, "defaultFontSizeForMainText");
  CalRoundToScreenScale(v6 * (v7 / 11.0));
  return fmin(v8, 26.0);
}

+ (double)dynamicFontSizeForSecondaryText
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointSize");
  v5 = v4;

  CalRoundToScreenScale(v5 * 1.27272727);
  return fmin(v6, 22.0);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUICalendarListViewHeaderContentView;
  -[EKUICalendarListViewHeaderContentView layoutSubviews](&v3, sel_layoutSubviews);
  -[EKUICalendarListViewHeaderContentView reloadSubviews](self, "reloadSubviews");
}

- (UIContentConfiguration)configuration
{
  return (UIContentConfiguration *)self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  -[EKUICalendarListViewHeaderContentView reloadSubviews](self, "reloadSubviews");
}

- (void)reloadSubviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  UILabel *weekNumberLabel;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UILabel *altCalendarLabel;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  UILabel *weekDayLabel;
  double v36;
  double v37;
  double v38;
  id v39;

  -[EKUICalendarListContentConfiguration weekNumberText](self->_configuration, "weekNumberText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_weekNumberLabel, "setText:", v3);

  -[EKUICalendarListContentConfiguration secondaryTextColor](self->_configuration, "secondaryTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_weekNumberLabel, "setTextColor:", v4);

  -[UILabel text](self->_weekNumberLabel, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 8.0;
  v7 = 8.0;
  if (v5)
  {
    v8 = (void *)v5;
    -[UILabel text](self->_weekNumberLabel, "text", 8.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", &stru_1E601DFA8);

    v7 = 16.0;
    if (v10)
      v7 = 8.0;
  }
  -[NSLayoutConstraint setConstant:](self->_trailingMarginConstraint, "setConstant:", v7);
  -[EKUICalendarListContentConfiguration altCalendarText](self->_configuration, "altCalendarText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_altCalendarLabel, "setText:", v11);

  -[EKUICalendarListContentConfiguration secondaryTextColor](self->_configuration, "secondaryTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_altCalendarLabel, "setTextColor:", v12);

  -[UILabel text](self->_altCalendarLabel, "text");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[UILabel text](self->_altCalendarLabel, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", &stru_1E601DFA8);

    if (v16)
      v6 = 8.0;
    else
      v6 = 16.0;
  }
  -[NSLayoutConstraint setConstant:](self->_accessibilityLeadingMarginConstraint, "setConstant:", v6);
  -[EKUICalendarListContentConfiguration mainTextColor](self->_configuration, "mainTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_weekDayLabel, "setTextColor:", v17);

  -[EKUICalendarListContentConfiguration mainText](self->_configuration, "mainText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_weekDayLabel, "setText:", v18);

  -[UILabel frame](self->_weekDayLabel, "frame");
  v20 = v19;
  weekNumberLabel = self->_weekNumberLabel;
  -[UILabel frame](weekNumberLabel, "frame");
  -[UILabel sizeThatFits:](weekNumberLabel, "sizeThatFits:", v22, v23);
  v25 = v24;
  -[UILabel frame](self->_weekNumberLabel, "frame");
  v27 = v25 - v26;
  altCalendarLabel = self->_altCalendarLabel;
  -[UILabel frame](altCalendarLabel, "frame");
  -[UILabel sizeThatFits:](altCalendarLabel, "sizeThatFits:", v29, v30);
  v32 = v31;
  -[UILabel frame](self->_altCalendarLabel, "frame");
  v34 = v20 - v27 - (v32 - v33);
  if (v20 < 1.0)
    -[EKUICalendarListViewHeaderContentView setNeedsLayout](self, "setNeedsLayout");
  weekDayLabel = self->_weekDayLabel;
  -[UILabel frame](weekDayLabel, "frame");
  -[UILabel sizeThatFits:](weekDayLabel, "sizeThatFits:", v36, v37);
  if (v38 > v34)
  {
    -[EKUICalendarListContentConfiguration mainTextAbbr](self->_configuration, "mainTextAbbr");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_weekDayLabel, "setText:", v39);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_altCalendarLabel, 0);
  objc_storeStrong((id *)&self->_weekDayLabel, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
