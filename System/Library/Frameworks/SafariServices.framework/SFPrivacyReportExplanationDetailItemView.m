@implementation SFPrivacyReportExplanationDetailItemView

- (SFPrivacyReportExplanationDetailItemView)initWithFrame:(CGRect)a3
{
  SFPrivacyReportExplanationDetailItemView *v3;
  SFPrivacyReportExplanationDetailItemView *v4;
  UIView *v5;
  UIView *hairline;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  uint64_t v10;
  void *v11;
  void *v12;
  UITextView *v13;
  UITextView *bodyTextView;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *titleTopConstraint;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *hairlineTopConstraint;
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
  double v39;
  void *v40;
  void *v41;
  id v42;
  SFPrivacyReportExplanationDetailItemView *v43;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  objc_super v67;
  uint64_t v68;
  _QWORD v69[12];
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)SFPrivacyReportExplanationDetailItemView;
  v3 = -[SFPrivacyReportExplanationDetailItemView initWithFrame:](&v67, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFPrivacyReportExplanationDetailItemView setPreservesSuperviewLayoutMargins:](v3, "setPreservesSuperviewLayoutMargins:", 1);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    hairline = v4->_hairline;
    v4->_hairline = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_hairline, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_hairline, "setBackgroundColor:", v7);

    -[SFPrivacyReportExplanationDetailItemView addSubview:](v4, "addSubview:", v4->_hairline);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    v10 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 0);
    -[SFPrivacyReportExplanationDetailItemView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v13 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    bodyTextView = v4->_bodyTextView;
    v4->_bodyTextView = v13;

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v4->_bodyTextView, "setFont:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v4->_bodyTextView, "setTextColor:", v16);

    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v4->_bodyTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView setAdjustsFontForContentSizeCategory:](v4->_bodyTextView, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v4->_bodyTextView, "setBackgroundColor:", v17);

    -[UITextView setShowsVerticalScrollIndicator:](v4->_bodyTextView, "setShowsVerticalScrollIndicator:", 0);
    -[UITextView setEditable:](v4->_bodyTextView, "setEditable:", 0);
    -[UITextView setSelectable:](v4->_bodyTextView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v4->_bodyTextView, "setScrollEnabled:", 0);
    -[UITextView textContainer](v4->_bodyTextView, "textContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLineFragmentPadding:", 0.0);

    -[UITextView _setInteractiveTextSelectionDisabled:](v4->_bodyTextView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTextContainerInset:](v4->_bodyTextView, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    v70 = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](v4->_bodyTextView, "setLinkTextAttributes:", v20);

    -[UITextView setDelegate:](v4->_bodyTextView, "setDelegate:", v4);
    -[SFPrivacyReportExplanationDetailItemView addSubview:](v4, "addSubview:", v4->_bodyTextView);
    -[UILabel topAnchor](v4->_titleLabel, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView topAnchor](v4, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
    v23 = objc_claimAutoreleasedReturnValue();
    titleTopConstraint = v4->_titleTopConstraint;
    v4->_titleTopConstraint = (NSLayoutConstraint *)v23;

    -[UIView topAnchor](v4->_hairline, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView topAnchor](v4, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    hairlineTopConstraint = v4->_hairlineTopConstraint;
    v4->_hairlineTopConstraint = (NSLayoutConstraint *)v27;

    -[SFPrivacyReportExplanationDetailItemView layoutMarginsGuide](v4, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x1E0CB3718];
    v69[0] = v4->_hairlineTopConstraint;
    -[UIView leadingAnchor](v4->_hairline, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v64;
    -[UIView centerXAnchor](v4->_hairline, "centerXAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v29;
    objc_msgSend(v29, "centerXAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v61;
    -[UIView heightAnchor](v4->_hairline, "heightAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    _SFOnePixel();
    objc_msgSend(v60, "constraintEqualToConstant:");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v58;
    -[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v55;
    -[UILabel centerXAnchor](v4->_titleLabel, "centerXAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v51;
    -[UITextView leadingAnchor](v4->_bodyTextView, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v48;
    -[UITextView centerXAnchor](v4->_bodyTextView, "centerXAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "centerXAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v45;
    v69[8] = v4->_titleTopConstraint;
    -[UITextView topAnchor](v4->_bodyTextView, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v31, 0.5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69[9] = v32;
    -[UITextView bottomAnchor](v4->_bodyTextView, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView bottomAnchor](v4, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v69[10] = v35;
    -[UITextView bottomAnchor](v4->_bodyTextView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView bottomAnchor](v4, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v39) = 1131413504;
    objc_msgSend(v38, "setPriority:", v39);
    v69[11] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 12);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "activateConstraints:", v40);

    v68 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)-[SFPrivacyReportExplanationDetailItemView registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v41, v4, sel__preferredContentSizeCategoryDidChange);

    v43 = v4;
  }

  return v4;
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  if (self->_usesInsetStyle != a3)
  {
    self->_usesInsetStyle = a3;
    -[SFPrivacyReportExplanationDetailItemView _updateTopSpacing](self, "_updateTopSpacing");
  }
}

- (void)setGridPosition:(unint64_t)a3
{
  if (self->_gridPosition != a3)
  {
    self->_gridPosition = a3;
    -[UIView setHidden:](self->_hairline, "setHidden:", (a3 & 1) == 0);
    -[SFPrivacyReportExplanationDetailItemView _updateTopSpacing](self, "_updateTopSpacing");
  }
}

- (void)setTitleLabelTopSpacing:(double)a3
{
  if (self->_titleLabelTopSpacing != a3)
  {
    self->_titleLabelTopSpacing = a3;
    -[SFPrivacyReportExplanationDetailItemView _updateTopConstraints](self, "_updateTopConstraints");
  }
}

- (void)setHairlineTopSpacing:(double)a3
{
  if (self->_hairlineTopSpacing != a3)
  {
    self->_hairlineTopSpacing = a3;
    -[SFPrivacyReportExplanationDetailItemView _updateTopConstraints](self, "_updateTopConstraints");
  }
}

- (void)_updateTopConstraints
{
  -[NSLayoutConstraint setConstant:](self->_titleTopConstraint, "setConstant:", self->_titleLabelTopSpacing + self->_hairlineTopSpacing);
  -[NSLayoutConstraint setConstant:](self->_hairlineTopConstraint, "setConstant:", self->_hairlineTopSpacing);
}

- (void)_updateTopSpacing
{
  BOOL v3;
  double v4;
  double v5;

  v3 = -[UIView isHidden](self->_hairline, "isHidden");
  v4 = 0.0;
  v5 = 0.0;
  if (!v3)
  {
    v4 = 35.0;
    v5 = 20.0;
    if (!self->_usesInsetStyle)
      v5 = 35.0;
  }
  -[SFPrivacyReportExplanationDetailItemView setTitleLabelTopSpacing:](self, "setTitleLabelTopSpacing:", v5);
  -[SFPrivacyReportExplanationDetailItemView setHairlineTopSpacing:](self, "setHairlineTopSpacing:", v4);
}

- (void)_preferredContentSizeCategoryDidChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "itemDidChangeContentSize:", self);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  objc_msgSend(MEMORY[0x1E0D8AAF8], "openPrivateRelayICloudSettings", a3, a4, a5.location, a5.length, a6);
  return 0;
}

- (SFPrivacyReportGridItemDelegate)delegate
{
  return (SFPrivacyReportGridItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)gridPosition
{
  return self->_gridPosition;
}

- (UIColor)cellBackgroundColor
{
  return self->_cellBackgroundColor;
}

- (void)setCellBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_cellBackgroundColor, a3);
}

- (double)cellBackgroundCornerRadius
{
  return self->_cellBackgroundCornerRadius;
}

- (void)setCellBackgroundCornerRadius:(double)a3
{
  self->_cellBackgroundCornerRadius = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (double)titleLabelTopSpacing
{
  return self->_titleLabelTopSpacing;
}

- (double)hairlineTopSpacing
{
  return self->_hairlineTopSpacing;
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairlineTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleTopConstraint, 0);
  objc_storeStrong((id *)&self->_hairline, 0);
}

@end
