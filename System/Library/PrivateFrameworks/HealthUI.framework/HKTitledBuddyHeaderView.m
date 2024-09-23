@implementation HKTitledBuddyHeaderView

- (HKTitledBuddyHeaderView)initWithTopInset:(double)a3 linkButtonTitle:(id)a4
{
  id v6;
  HKTitledBuddyHeaderView *v7;
  HKTitledBuddyHeaderView *v8;
  double v9;
  NSString *bodyText;
  UILabel *v11;
  double v12;
  UITextView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIButton *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *titleLabelBaselineConstraint;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *bodyFirstBaselineConstraint;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSLayoutConstraint *bodyLastBaselineToLinkConstraint;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSLayoutConstraint *bodyBottomConstraint;
  id *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSLayoutConstraint *bodyZeroHeightConstraint;
  UILabel *titleLabel;
  UILabel *v68;
  UITextView *bodyTextView;
  UITextView *v70;
  UIButton *optionalLinkButton;
  objc_super v73;

  v6 = a4;
  v73.receiver = self;
  v73.super_class = (Class)HKTitledBuddyHeaderView;
  v7 = -[HKTitledBuddyHeaderView initWithFrame:](&v73, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    -[HKTitledBuddyHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v9) = 1148846080;
    -[HKTitledBuddyHeaderView setContentCompressionResistancePriority:forAxis:](v8, "setContentCompressionResistancePriority:forAxis:", 1, v9);
    bodyText = v8->_bodyText;
    v8->_bodyText = 0;

    v8->_bodyTextAlignment = 1;
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v11, "setAllowsDefaultTighteningForTruncation:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v11, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v11, "setTextAlignment:", 1);
    LODWORD(v12) = 1057803469;
    -[UILabel _setHyphenationFactor:](v11, "_setHyphenationFactor:", v12);
    -[HKTitledBuddyHeaderView addSubview:](v8, "addSubview:", v11);
    v13 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v13, "setTextColor:", v15);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setScrollEnabled:](v13, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v13, "setEditable:", 0);
    -[UITextView _setInteractiveTextSelectionDisabled:](v13, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setDataDetectorTypes:](v13, "setDataDetectorTypes:", 2);
    -[HKTitledBuddyHeaderView addSubview:](v8, "addSubview:", v13);
    if (v6)
    {
      v16 = (void *)MEMORY[0x1E0DC3518];
      HKHealthKeyColor();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hk_buttonTintedWithColor:title:target:action:", v17, v6, v8, sel__linkButtonTapped_);
      v18 = (UIButton *)objc_claimAutoreleasedReturnValue();

      -[HKTitledBuddyHeaderView addSubview:](v8, "addSubview:", v18);
    }
    else
    {
      v18 = 0;
    }
    -[UILabel firstBaselineAnchor](v11, "firstBaselineAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyHeaderView topAnchor](v8, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20, a3);
    v21 = objc_claimAutoreleasedReturnValue();
    titleLabelBaselineConstraint = v8->_titleLabelBaselineConstraint;
    v8->_titleLabelBaselineConstraint = (NSLayoutConstraint *)v21;

    -[NSLayoutConstraint setActive:](v8->_titleLabelBaselineConstraint, "setActive:", 1);
    -[UITextView firstBaselineAnchor](v13, "firstBaselineAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v11, "lastBaselineAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 0.0);
    v25 = objc_claimAutoreleasedReturnValue();
    bodyFirstBaselineConstraint = v8->_bodyFirstBaselineConstraint;
    v8->_bodyFirstBaselineConstraint = (NSLayoutConstraint *)v25;

    -[NSLayoutConstraint setActive:](v8->_bodyFirstBaselineConstraint, "setActive:", 1);
    if (v18)
    {
      -[UIButton widthAnchor](v18, "widthAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "constraintEqualToConstant:", 288.0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setActive:", 1);

      -[UIButton centerXAnchor](v18, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKTitledBuddyHeaderView centerXAnchor](v8, "centerXAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      -[UITextView lastBaselineAnchor](v13, "lastBaselineAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton firstBaselineAnchor](v18, "firstBaselineAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 0.0);
      v34 = objc_claimAutoreleasedReturnValue();
      bodyLastBaselineToLinkConstraint = v8->_bodyLastBaselineToLinkConstraint;
      v8->_bodyLastBaselineToLinkConstraint = (NSLayoutConstraint *)v34;

      -[NSLayoutConstraint setActive:](v8->_bodyLastBaselineToLinkConstraint, "setActive:", 1);
      -[UIButton lastBaselineAnchor](v18, "lastBaselineAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKTitledBuddyHeaderView bottomAnchor](v8, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 0.0);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = 496;
    }
    else
    {
      -[UITextView lastBaselineAnchor](v13, "lastBaselineAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKTitledBuddyHeaderView bottomAnchor](v8, "bottomAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, 0.0);
      v42 = objc_claimAutoreleasedReturnValue();
      bodyBottomConstraint = v8->_bodyBottomConstraint;
      v8->_bodyBottomConstraint = (NSLayoutConstraint *)v42;

      -[UILabel lastBaselineAnchor](v11, "lastBaselineAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKTitledBuddyHeaderView bottomAnchor](v8, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, 0.0);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = 472;
    }
    v44 = (id *)((char *)&v8->super.super.super.isa + v39);
    v45 = *(Class *)((char *)&v8->super.super.super.isa + v39);
    *v44 = (id)v38;

    objc_msgSend(*v44, "setActive:", 1);
    v46 = HKHealthUIBuddyDirectionalEdgeInsets();
    v48 = v47;
    v50 = v49;
    -[UILabel leadingAnchor](v11, "leadingAnchor", v46);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyHeaderView leadingAnchor](v8, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, v48);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setActive:", 1);

    -[UILabel trailingAnchor](v11, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyHeaderView trailingAnchor](v8, "trailingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -v50;
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

    -[UITextView leadingAnchor](v13, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyHeaderView leadingAnchor](v8, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, v48);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setActive:", 1);

    -[UITextView trailingAnchor](v13, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyHeaderView trailingAnchor](v8, "trailingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, v56);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setActive:", 1);

    -[UITextView heightAnchor](v13, "heightAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToConstant:", 0.0);
    v65 = objc_claimAutoreleasedReturnValue();
    bodyZeroHeightConstraint = v8->_bodyZeroHeightConstraint;
    v8->_bodyZeroHeightConstraint = (NSLayoutConstraint *)v65;

    -[NSLayoutConstraint setActive:](v8->_bodyZeroHeightConstraint, "setActive:", 1);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v11;
    v68 = v11;

    bodyTextView = v8->_bodyTextView;
    v8->_bodyTextView = v13;
    v70 = v13;

    optionalLinkButton = v8->_optionalLinkButton;
    v8->_optionalLinkButton = v18;

    -[HKTitledBuddyHeaderView _updateForCurrentSizeCategory](v8, "_updateForCurrentSizeCategory");
  }

  return v8;
}

- (void)_updateForCurrentSizeCategory
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;

  v15 = (id)*MEMORY[0x1E0DC4B50];
  if (objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen"))
  {
    v3 = (id)*MEMORY[0x1E0DC4B58];

    v4 = v3;
  }
  else
  {
    v4 = v15;
  }
  v5 = (void *)MEMORY[0x1E0DC1350];
  v16 = v4;
  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_optionalLinkButton, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(v9, "_scaledValueForValue:", 32.0);
  -[NSLayoutConstraint setConstant:](self->_bodyFirstBaselineConstraint, "setConstant:");
  if (self->_optionalLinkButton)
  {
    objc_msgSend(v9, "_scaledValueForValue:", 30.0);
    -[NSLayoutConstraint setConstant:](self->_bodyLastBaselineToLinkConstraint, "setConstant:", -v11);
  }
  -[HKTitledBuddyHeaderView bottomPadding](self, "bottomPadding");
  v13 = -v12;
  -[NSLayoutConstraint setConstant:](self->_linkButtonLastBaselineToBottomConstraint, "setConstant:", -v12);
  -[NSLayoutConstraint setConstant:](self->_bodyBottomConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setConstant:](self->_titleBottomConstraint, "setConstant:", v13);
  -[HKTitledBuddyHeaderView bodyText](self, "bodyText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setBodyText:](self, "setBodyText:", v14);

}

- (void)_updateBodyTextViewConstraints
{
  NSUInteger v3;
  NSLayoutConstraint *bodyZeroHeightConstraint;
  uint64_t v5;
  BOOL v6;
  _BOOL8 v7;
  uint64_t v8;

  v3 = -[NSString length](self->_bodyText, "length");
  if (v3)
  {
    bodyZeroHeightConstraint = self->_bodyZeroHeightConstraint;
    v5 = 0;
  }
  else
  {
    -[UITextView setText:](self->_bodyTextView, "setText:", 0);
    -[UITextView setAttributedText:](self->_bodyTextView, "setAttributedText:", 0);
    bodyZeroHeightConstraint = self->_bodyZeroHeightConstraint;
    v5 = 1;
  }
  -[NSLayoutConstraint setActive:](bodyZeroHeightConstraint, "setActive:", v5);
  if (self->_titleBottomConstraint)
  {
    v6 = v3 == 0;
    v7 = v3 == 0;
    v8 = !v6;
    -[NSLayoutConstraint setActive:](self->_bodyBottomConstraint, "setActive:", v8);
    -[NSLayoutConstraint setActive:](self->_titleBottomConstraint, "setActive:", v7);
  }
}

- (double)bottomPadding
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 32.0);
  v4 = v3;

  return v4;
}

- (void)setTitleText:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (NSString)titleText
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setBodyText:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_bodyText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_bodyText, a3);
    if (objc_msgSend(v6, "length"))
    {
      -[HKTitledBuddyHeaderView _attributedBodyTextWithString:alignment:](self, "_attributedBodyTextWithString:alignment:", v6, self->_bodyTextAlignment);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setAttributedText:](self->_bodyTextView, "setAttributedText:", v5);

    }
    -[HKTitledBuddyHeaderView _updateBodyTextViewConstraints](self, "_updateBodyTextViewConstraints");
  }

}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyTextAlignment:(int64_t)a3
{
  id v5;

  if (self->_bodyTextAlignment != a3)
  {
    self->_bodyTextAlignment = a3;
    if (-[NSString length](self->_bodyText, "length"))
    {
      -[HKTitledBuddyHeaderView _attributedBodyTextWithString:alignment:](self, "_attributedBodyTextWithString:alignment:", self->_bodyText, a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UITextView setAttributedText:](self->_bodyTextView, "setAttributedText:", v5);

    }
  }
}

- (int64_t)bodyTextAlignment
{
  return self->_bodyTextAlignment;
}

- (id)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyText:(id)a3 alignment:(int64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_bodyText, a3);
  self->_bodyTextAlignment = a4;
  if (-[NSString length](self->_bodyText, "length"))
  {
    -[HKTitledBuddyHeaderView _attributedBodyTextWithString:alignment:](self, "_attributedBodyTextWithString:alignment:", v8, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](self->_bodyTextView, "setAttributedText:", v7);

  }
  -[HKTitledBuddyHeaderView _updateBodyTextViewConstraints](self, "_updateBodyTextViewConstraints");

}

- (void)_linkButtonTapped:(id)a3
{
  id v4;

  -[HKTitledBuddyHeaderView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titledBuddyHeaderViewDidTapLinkButton:", self);

}

- (void)deactivateDefaultTitleLabelBaselineConstraint
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3718];
  v4[0] = self->_titleLabelBaselineConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivateConstraints:", v3);

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
  v9.super_class = (Class)HKTitledBuddyHeaderView;
  -[HKTitledBuddyHeaderView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKTitledBuddyHeaderView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKTitledBuddyHeaderView _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (id)_attributedBodyTextWithString:(id)a3 alignment:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DC1350];
  v7 = *MEMORY[0x1E0DC4A88];
  v8 = a3;
  objc_msgSend(v6, "hk_preferredFontForTextStyle:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_scaledValueForValue:", 22.0);
  v11 = v10;
  objc_msgSend(v9, "_scaledValueForValue:", 32.0);
  v13 = v12 - v11;
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "setMinimumLineHeight:", v11);
  objc_msgSend(v15, "setParagraphSpacing:", v13);
  objc_msgSend(v15, "setParagraphSpacingBefore:", 0.0);
  objc_msgSend(v15, "setAlignment:", a4);
  v16 = *MEMORY[0x1E0DC1178];
  v24[0] = *MEMORY[0x1E0DC1138];
  v24[1] = v16;
  v25[0] = v9;
  v25[1] = v15;
  v24[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v8, v18);
  -[HKTitledBuddyHeaderView delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[HKTitledBuddyHeaderView delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateBodyTextAttributesWithMutableString:", v19);

  }
  return v19;
}

- (HKTitledBuddyHeaderViewDelegate)delegate
{
  return (HKTitledBuddyHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_linkButtonLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLastBaselineToLinkConstraint, 0);
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bodyBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bodyZeroHeightConstraint, 0);
  objc_storeStrong((id *)&self->_logoTitleGapConstraint, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_optionalLinkButton, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
}

@end
