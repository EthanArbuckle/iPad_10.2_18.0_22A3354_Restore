@implementation HKListItemLabel

- (HKListItemLabel)initWithView:(id)a3 size:(CGSize)a4 text:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  HKListItemLabel *v12;
  HKListItemLabel *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKListItemLabel;
  v12 = -[HKListItemLabel initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemView, a3);
    v13->_itemViewSize.width = width;
    v13->_itemViewSize.height = height;
    objc_storeStrong((id *)&v13->_text, a5);
    -[HKListItemLabel _setUpUI](v13, "_setUpUI");
    -[HKListItemLabel _setUpConstraints](v13, "_setUpConstraints");
  }

  return v13;
}

- (void)setCenterItemViewToFirstLine:(BOOL)a3
{
  self->_centerItemViewToFirstLine = a3;
  -[HKListItemLabel _updateItemViewTextAlignmentConstraint](self, "_updateItemViewTextAlignmentConstraint");
}

- (void)setBoldText:(BOOL)a3
{
  self->_boldText = a3;
  -[HKListItemLabel _updateTextLabelFont](self, "_updateTextLabelFont");
  -[HKListItemLabel _updateItemViewTextAlignmentConstraint](self, "_updateItemViewTextAlignmentConstraint");
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKListItemLabel;
  -[HKListItemLabel traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[HKListItemLabel textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKListItemLabel textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  -[HKListItemLabel _updateItemViewTextAlignmentConstraint](self, "_updateItemViewTextAlignmentConstraint");
}

+ (id)createListItem:(id)a3 itemNumber:(int)a4
{
  id v5;
  void *v6;
  HKListItemLabel *v7;
  void *v8;
  HKListItemLabel *v9;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "createButtonBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HKListItemLabel alloc];
  objc_msgSend((id)objc_opt_class(), "createNumberedViewWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "listItemSize");
  v9 = -[HKListItemLabel initWithView:size:text:](v7, "initWithView:size:text:", v8, v5);

  -[HKListItemLabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKListItemLabel setCenterItemViewToFirstLine:](v9, "setCenterItemViewToFirstLine:", 1);
  -[HKListItemLabel setBoldText:](v9, "setBoldText:", 1);
  objc_msgSend(v6, "addSubview:", v9);
  -[UIView hk_alignHorizontalConstraintsWithView:insets:](v9, "hk_alignHorizontalConstraintsWithView:insets:", v6, 0.0, 12.0, 0.0, 20.0);
  -[UIView hk_alignVerticalConstraintsWithView:insets:](v9, "hk_alignVerticalConstraintsWithView:insets:", v6, *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));

  return v6;
}

- (void)_setUpUI
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HKListItemLabel itemView](self, "itemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKListItemLabel itemView](self, "itemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel addSubview:](self, "addSubview:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[HKListItemLabel setTextLabel:](self, "setTextLabel:", v5);

  -[HKListItemLabel text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[HKListItemLabel textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKListItemLabel textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 0);

  -[HKListItemLabel _updateTextLabelFont](self, "_updateTextLabelFont");
  -[HKListItemLabel textLabel](self, "textLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel addSubview:](self, "addSubview:", v10);

}

- (void)_setUpConstraints
{
  double v3;
  double v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
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
  id v33;

  -[HKListItemLabel itemViewSize](self, "itemViewSize");
  if (v4 != *MEMORY[0x1E0C9D820] || v3 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[HKListItemLabel itemView](self, "itemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widthAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKListItemLabel itemViewSize](self, "itemViewSize");
    objc_msgSend(v7, "constraintEqualToConstant:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    -[HKListItemLabel itemView](self, "itemView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heightAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKListItemLabel itemViewSize](self, "itemViewSize");
    objc_msgSend(v10, "constraintEqualToConstant:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

  }
  -[HKListItemLabel itemView](self, "itemView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel leadingAnchor](self, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HKListItemLabel textLabel](self, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel itemView](self, "itemView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 12.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HKListItemLabel textLabel](self, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel trailingAnchor](self, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HKListItemLabel _updateItemViewTextAlignmentConstraint](self, "_updateItemViewTextAlignmentConstraint");
  -[HKListItemLabel textLabel](self, "textLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstBaselineAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel topAnchor](self, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel _topToTextLabelFirstBaseline](self, "_topToTextLabelFirstBaseline");
  objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[HKListItemLabel bottomAnchor](self, "bottomAnchor");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "lastBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel _textLabelLastBaselineToBottom](self, "_textLabelLastBaselineToBottom");
  objc_msgSend(v33, "constraintEqualToAnchor:constant:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

}

- (void)_updateTextLabelFont
{
  void *v3;
  id v4;

  if (-[HKListItemLabel boldText](self, "boldText"))
    -[HKListItemLabel _textLabelBoldFont](self, "_textLabelBoldFont");
  else
    -[HKListItemLabel _textLabelFont](self, "_textLabelFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (void)_updateItemViewTextAlignmentConstraint
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;

  -[HKListItemLabel itemViewTextAlignmentConstraint](self, "itemViewTextAlignmentConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKListItemLabel itemViewTextAlignmentConstraint](self, "itemViewTextAlignmentConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKListItemLabel removeConstraint:](self, "removeConstraint:", v4);

    -[HKListItemLabel setItemViewTextAlignmentConstraint:](self, "setItemViewTextAlignmentConstraint:", 0);
  }
  v5 = -[HKListItemLabel centerItemViewToFirstLine](self, "centerItemViewToFirstLine");
  -[HKListItemLabel itemView](self, "itemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKListItemLabel textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKListItemLabel setItemViewTextAlignmentConstraint:](self, "setItemViewTextAlignmentConstraint:", v11);

    -[HKListItemLabel textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lineHeight");
    v13 = v12 * 0.5;
    -[HKListItemLabel itemViewTextAlignmentConstraint](self, "itemViewTextAlignmentConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v13);
  }
  else
  {
    objc_msgSend(v8, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKListItemLabel setItemViewTextAlignmentConstraint:](self, "setItemViewTextAlignmentConstraint:", v15);

  }
  -[HKListItemLabel itemViewTextAlignmentConstraint](self, "itemViewTextAlignmentConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1144750080;
  objc_msgSend(v16, "setPriority:", v17);

  -[HKListItemLabel itemViewTextAlignmentConstraint](self, "itemViewTextAlignmentConstraint");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

}

- (id)_textLabelFontStyle
{
  return (id)*MEMORY[0x1E0DC4AD0];
}

- (id)_textLabelFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  -[HKListItemLabel _textLabelFontStyle](self, "_textLabelFontStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFontForTextStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_textLabelBoldFont
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC1350];
  -[HKListItemLabel _textLabelFontStyle](self, "_textLabelFontStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_preferredFontForTextStyle:symbolicTraits:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)_topToTextLabelFirstBaseline
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[HKListItemLabel textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 32.0);
  v5 = v4;

  return v5;
}

- (double)_textLabelLastBaselineToBottom
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 20.0);
  v4 = v3;

  return v4;
}

- (UIView)itemView
{
  return self->_itemView;
}

- (void)setItemView:(id)a3
{
  objc_storeStrong((id *)&self->_itemView, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (BOOL)centerItemViewToFirstLine
{
  return self->_centerItemViewToFirstLine;
}

- (BOOL)boldText
{
  return self->_boldText;
}

- (CGSize)itemViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemViewSize.width;
  height = self->_itemViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setItemViewSize:(CGSize)a3
{
  self->_itemViewSize = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSLayoutConstraint)itemViewTextAlignmentConstraint
{
  return self->_itemViewTextAlignmentConstraint;
}

- (void)setItemViewTextAlignmentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_itemViewTextAlignmentConstraint, a3);
}

- (NSLayoutConstraint)topToTextLabelFirstBaselineConstraint
{
  return self->_topToTextLabelFirstBaselineConstraint;
}

- (void)setTopToTextLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToTextLabelFirstBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topToTextLabelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_itemViewTextAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
