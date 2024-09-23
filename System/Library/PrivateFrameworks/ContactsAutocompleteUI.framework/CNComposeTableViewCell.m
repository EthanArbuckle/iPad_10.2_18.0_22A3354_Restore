@implementation CNComposeTableViewCell

+ (id)identifier
{
  return 0;
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

+ (double)additionalSeparatorInset
{
  return 48.0;
}

+ (void)requireIntrinsicSizeForView:(id)a3
{
  double v3;
  double v4;
  id v5;

  v5 = a3;
  LODWORD(v3) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 0, v4);

}

- (CNComposeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNComposeTableViewCell *v4;
  CNComposeTableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int IsAppDesignedForVisionOS;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)CNComposeTableViewCell;
  v4 = -[NUITableViewContainerCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNComposeTableViewCell titleTextStyle](v4, "titleTextStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell labelWithTextStyle:](v5, "labelWithTextStyle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell setTitleLabel:](v5, "setTitleLabel:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell titleLabel](v5, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    IsAppDesignedForVisionOS = CNComposeIsAppDesignedForVisionOS();
    v11 = (_QWORD *)MEMORY[0x1E0CEB558];
    if (!IsAppDesignedForVisionOS)
      v11 = (_QWORD *)MEMORY[0x1E0CEB590];
    -[CNComposeTableViewCell labelWithTextStyle:](v5, "labelWithTextStyle:", *v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell setDetailLabel:](v5, "setDetailLabel:", v12);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    v15 = (void *)MEMORY[0x1E0CFAAB0];
    -[CNComposeTableViewCell titleLabel](v5, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v16;
    -[CNComposeTableViewCell detailLabel](v5, "detailLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "verticalContainerStackViewWithArrangedSubviews:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setDelegate:", v5);
    objc_msgSend(v19, "setBaselineRelativeArrangement:", 0);
    v20 = CNComposeIsAppDesignedForVisionOS();
    v21 = 0.0;
    if (v20)
      v21 = 4.0;
    objc_msgSend(v19, "setSpacing:", v21);
    -[CNComposeTableViewCell setLabelViewStack:](v5, "setLabelViewStack:", v19);
    v33 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUITableViewContainerCell containerView](v5, "containerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setArrangedSubviews:", v22);

    -[NUITableViewContainerCell containerView](v5, "containerView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPreservesSuperviewLayoutMargins:", 0);

    -[NUITableViewContainerCell containerView](v5, "containerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSpacing:", 12.0);

    -[NUITableViewContainerCell containerView](v5, "containerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAlignment:", 3);

    -[NUITableViewContainerCell containerView](v5, "containerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", v5);

    v28 = (void *)objc_opt_new();
    -[CNComposeTableViewCell setBackgroundView:](v5, "setBackgroundView:", v28);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeTableViewCell backgroundView](v5, "backgroundView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v29);

  }
  return v5;
}

- (id)titleTextStyle
{
  return (id)*MEMORY[0x1E0CEB538];
}

+ (id)axCappedFontWithTextStyle:(id)a3 bold:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:maximumContentSizeCategory:", a3, *MEMORY[0x1E0CEB3D8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = 32770;
  else
    v7 = 0x8000;
  objc_msgSend(v5, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v9, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)axCappedSymbolConfigurationIsBold:(BOOL)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontWithDescriptor:size:", v7, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (UIContentSizeCategoryCompareToCategory(v10, (UIContentSizeCategory)*MEMORY[0x1E0CEB3D8]) == NSOrderedDescending)
    {
      v11 = 1;
    }
    else if (UIContentSizeCategoryCompareToCategory(v10, (UIContentSizeCategory)*MEMORY[0x1E0CEB3F8]) == NSOrderedDescending)
    {
      v11 = 2;
    }
    else
    {
      v11 = 3;
    }
  }
  else
  {
    v11 = 3;
  }
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)labelWithTextStyle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLineBreakMode:", 4);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFont:", v5);
  return v4;
}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
  -[CNComposeTableViewCell layoutMarginsDidChange](self, "layoutMarginsDidChange");
}

- (void)layoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNComposeTableViewCell;
  -[CNComposeTableViewCell layoutMarginsDidChange](&v8, sel_layoutMarginsDidChange);
  -[CNComposeTableViewCell directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  -[CNComposeTableViewCell leadingInsetsFromCurrentMargins:](self, "leadingInsetsFromCurrentMargins:", 6.0);
  v6 = v5;
  -[NUITableViewContainerCell containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 6.0, v6, 5.0, v4);

}

- (double)leadingInsetsFromCurrentMargins:(NSDirectionalEdgeInsets)a3
{
  return a3.leading;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  BOOL v16;
  CGSize result;

  v7 = a3;
  v8 = a5;
  -[NUITableViewContainerCell containerView](self, "containerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v7)
    goto LABEL_4;
  objc_msgSend(v7, "arrangedSubviews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 != v8)
  {

    v9 = v7;
LABEL_4:

    goto LABEL_5;
  }
  v16 = -[CNComposeTableViewCell supportsAvatarView](self, "supportsAvatarView");

  if (v16)
  {
    v12 = 0x4042000000000000;
    v13 = 0x4042000000000000;
    goto LABEL_6;
  }
LABEL_5:
  v12 = *MEMORY[0x1E0CFAA88];
  v13 = *(_QWORD *)(MEMORY[0x1E0CFAA88] + 8);
LABEL_6:

  v14 = *(double *)&v12;
  v15 = *(double *)&v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  id v5;
  id v6;
  CGRect v7;

  v4 = a3;
  -[CNComposeTableViewCell labelViewStack](self, "labelViewStack");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[CNComposeTableViewCell labelViewStack](self, "labelViewStack");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    -[CNComposeTableViewCell labelsChangedWidth:](self, "labelsChangedWidth:", CGRectGetWidth(v7));

  }
}

- (void)setLabelColor:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "isEqual:", self->_labelColor) & 1) != 0)
    goto LABEL_13;
  objc_storeStrong((id *)&self->_labelColor, a3);
  v5 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNComposeTableViewCell titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

  if (!v13)
  -[CNComposeTableViewCell recipient](self, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "kind") == 6)
  {

LABEL_9:
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v11 = 1;
    goto LABEL_11;
  }
  -[CNComposeTableViewCell recipient](self, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "kind");

  if (v9 == 7)
    goto LABEL_9;
  if (!v13)
    goto LABEL_10;
  v11 = 0;
  v10 = v13;
LABEL_11:
  -[CNComposeTableViewCell detailLabel](self, "detailLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v10);

  if (v11)
LABEL_13:

}

- (BOOL)supportsAvatarView
{
  return 0;
}

- (BOOL)canExpandRecipient
{
  return 0;
}

- (BOOL)canCollapseRecipient
{
  return 0;
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
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

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (double)trailingButtonWidth
{
  return self->_trailingButtonWidth;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (NUIContainerStackView)labelViewStack
{
  return self->_labelViewStack;
}

- (void)setLabelViewStack:(id)a3
{
  objc_storeStrong((id *)&self->_labelViewStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelViewStack, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
