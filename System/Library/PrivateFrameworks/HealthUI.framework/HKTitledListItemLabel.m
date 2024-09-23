@implementation HKTitledListItemLabel

- (HKTitledListItemLabel)initWithView:(id)a3 size:(CGSize)a4 title:(id)a5 body:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  HKTitledListItemLabel *v14;
  HKListItemLabel *v15;
  HKListItemLabel *listItemLabel;
  UILabel *v17;
  UILabel *bodyLabel;
  objc_super v20;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKTitledListItemLabel;
  v14 = -[HKTitledListItemLabel init](&v20, sel_init);
  if (v14)
  {
    v15 = -[HKListItemLabel initWithView:size:text:]([HKListItemLabel alloc], "initWithView:size:text:", v11, v12, width, height);
    listItemLabel = v14->_listItemLabel;
    v14->_listItemLabel = v15;

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    bodyLabel = v14->_bodyLabel;
    v14->_bodyLabel = v17;

    -[UILabel setText:](v14->_bodyLabel, "setText:", v13);
    -[HKTitledListItemLabel _setUpUI](v14, "_setUpUI");
    -[HKTitledListItemLabel _setUpConstraints](v14, "_setUpConstraints");
  }

  return v14;
}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKTitledListItemLabel;
  -[HKTitledListItemLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[HKTitledListItemLabel _updateCurrentUserInterfaceStyleIfNeeded](self, "_updateCurrentUserInterfaceStyleIfNeeded");
}

+ (id)createTitledListItem:(id)a3 listBody:(id)a4 itemNumber:(int)a5
{
  return (id)objc_msgSend(a1, "createTitledListItem:titleAccessibilityIdentifier:listBody:bodyAccessibilityIdentifier:itemNumber:", a3, 0, a4, 0, *(_QWORD *)&a5);
}

+ (id)createTitledListItem:(id)a3 titleAccessibilityIdentifier:(id)a4 listBody:(id)a5 bodyAccessibilityIdentifier:(id)a6 itemNumber:(int)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HKTitledListItemLabel *v16;
  void *v17;
  HKTitledListItemLabel *v18;
  void *v19;
  void *v20;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend((id)objc_opt_class(), "createButtonBackgroundView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [HKTitledListItemLabel alloc];
  objc_msgSend((id)objc_opt_class(), "createNumberedViewWithInteger:", a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "listItemSize");
  v18 = -[HKTitledListItemLabel initWithView:size:title:body:](v16, "initWithView:size:title:body:", v17, v14, v12);

  -[HKTitledListItemLabel listItemLabel](v18, "listItemLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", v13);

  -[HKTitledListItemLabel bodyLabel](v18, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityIdentifier:", v11);

  -[HKTitledListItemLabel setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "addSubview:", v18);
  -[UIView hk_alignHorizontalConstraintsWithView:insets:](v18, "hk_alignHorizontalConstraintsWithView:insets:", v15, 0.0, 12.0, 0.0, 20.0);
  -[UIView hk_alignVerticalConstraintsWithView:insets:](v18, "hk_alignVerticalConstraintsWithView:insets:", v15, *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));

  return v15;
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
  id v12;

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCenterItemViewToFirstLine:", 1);

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoldText:", 1);

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel addSubview:](self, "addSubview:", v6);

  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  -[HKTitledListItemLabel _bodyLabelFont](self, "_bodyLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel addSubview:](self, "addSubview:", v12);

}

- (void)_setUpConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  id v23;

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC3298];
  v5 = *(double *)(MEMORY[0x1E0DC3298] + 8);
  v6 = *(double *)(MEMORY[0x1E0DC3298] + 16);
  v7 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  objc_msgSend(v3, "hk_alignHorizontalConstraintsWithView:insets:", self, *MEMORY[0x1E0DC3298], v5, v6, v7);

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel topAnchor](self, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstBaselineAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastBaselineAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel _listItemLabelToBody](self, "_listItemLabelToBody");
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hk_alignHorizontalConstraintsWithView:insets:", v19, v4, v5, v6, v7);

  -[HKTitledListItemLabel bottomAnchor](self, "bottomAnchor");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledListItemLabel _bodyLabelToBottom](self, "_bodyLabelToBottom");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

}

- (void)_updateCurrentUserInterfaceStyleIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[HKTitledListItemLabel traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (-[HKTitledListItemLabel currentUserInterfaceStyle](self, "currentUserInterfaceStyle") != v4)
  {
    -[HKTitledListItemLabel setCurrentUserInterfaceStyle:](self, "setCurrentUserInterfaceStyle:", v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HKTitledListItemLabel bodyLabel](self, "bodyLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (double)_listItemLabelToBody
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[HKTitledListItemLabel listItemLabel](self, "listItemLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 27.0);
  v6 = v5;

  return v6;
}

- (id)_bodyLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

- (double)_bodyLabelToBottom
{
  void *v2;
  double v3;
  double v4;

  -[HKTitledListItemLabel _bodyLabelFont](self, "_bodyLabelFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (HKListItemLabel)listItemLabel
{
  return self->_listItemLabel;
}

- (void)setListItemLabel:(id)a3
{
  objc_storeStrong((id *)&self->_listItemLabel, a3);
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
  objc_storeStrong((id *)&self->_bodyLabel, a3);
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_listItemLabel, 0);
}

@end
