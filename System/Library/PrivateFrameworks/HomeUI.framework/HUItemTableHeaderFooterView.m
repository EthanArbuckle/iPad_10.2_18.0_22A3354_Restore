@implementation HUItemTableHeaderFooterView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUItemTableHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  HUItemTableHeaderFooterView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUItemTableHeaderFooterView;
  v3 = -[HUItemTableHeaderFooterView initWithReuseIdentifier:](&v21, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[HUItemTableHeaderFooterView setMessageTextView:](v3, "setMessageTextView:", v4);

    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditable:", 0);

    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setInteractiveTextSelectionDisabled:", 1);

    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScrollEnabled:", 0);

    v9 = *MEMORY[0x1E0CEB4B0];
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v11 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextContainerInset:", v9, v10, v11, v12);

    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLineFragmentPadding:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[HUItemTableHeaderFooterView contentView](v3, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableHeaderFooterView messageTextView](v3, "messageTextView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    v3->_includeBottomSpacing = 1;
  }
  return v3;
}

- (void)setAttributedMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (NSAttributedString)attributedMessage
{
  void *v2;
  void *v3;

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setMessage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)message
{
  void *v2;
  void *v3;

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  void *v4;
  id v5;

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", a3);

}

- (unint64_t)numberOfLines
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maximumNumberOfLines");

  return v4;
}

- (void)setIncludeBottomSpacing:(BOOL)a3
{
  double v4;
  double v5;
  id v6;

  self->_includeBottomSpacing = a3;
  -[HUItemTableHeaderFooterView _bottomSpacing](self, "_bottomSpacing");
  v5 = -v4;
  -[HUItemTableHeaderFooterView bottomSpacingConstraint](self, "bottomSpacingConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

}

- (double)_bottomSpacing
{
  _BOOL4 v2;
  double result;

  v2 = -[HUItemTableHeaderFooterView includeBottomSpacing](self, "includeBottomSpacing");
  result = 35.0;
  if (!v2)
    return 0.0;
  return result;
}

- (void)updateConstraints
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
  double v28;
  void *v29;
  void *v30;
  objc_super v31;

  -[HUItemTableHeaderFooterView constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUItemTableHeaderFooterView constraints](self, "constraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  v6 = (void *)objc_opt_new();
  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableHeaderFooterView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readableContentGuide");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableHeaderFooterView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "readableContentGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v18);

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstBaselineAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableHeaderFooterView contentView](self, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v22, 46.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v23);

  -[HUItemTableHeaderFooterView messageTextView](self, "messageTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastBaselineAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableHeaderFooterView contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableHeaderFooterView _bottomSpacing](self, "_bottomSpacing");
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, -v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableHeaderFooterView setBottomSpacingConstraint:](self, "setBottomSpacingConstraint:", v29);

  -[HUItemTableHeaderFooterView bottomSpacingConstraint](self, "bottomSpacingConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v30);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
  -[HUItemTableHeaderFooterView setConstraints:](self, "setConstraints:", v6);
  v31.receiver = self;
  v31.super_class = (Class)HUItemTableHeaderFooterView;
  -[HUItemTableHeaderFooterView updateConstraints](&v31, sel_updateConstraints);

}

- (UITextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
  objc_storeStrong((id *)&self->_messageTextView, a3);
}

- (BOOL)includeBottomSpacing
{
  return self->_includeBottomSpacing;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_constraints, a3);
}

- (NSLayoutConstraint)bottomSpacingConstraint
{
  return self->_bottomSpacingConstraint;
}

- (void)setBottomSpacingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomSpacingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
}

@end
