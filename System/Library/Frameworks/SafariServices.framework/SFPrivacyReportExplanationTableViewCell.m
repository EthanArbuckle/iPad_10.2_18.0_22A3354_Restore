@implementation SFPrivacyReportExplanationTableViewCell

- (SFPrivacyReportExplanationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SFPrivacyReportExplanationTableViewCell *v4;
  SFPrivacyReportExplanationTableViewCell *v5;
  void *v6;
  UITextView *v7;
  UITextView *textLabel;
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
  SFPrivacyReportExplanationTableViewCell *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)SFPrivacyReportExplanationTableViewCell;
  v4 = -[SFPrivacyReportExplanationTableViewCell initWithStyle:reuseIdentifier:](&v34, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFPrivacyReportExplanationTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textLabel = v5->_textLabel;
    v5->_textLabel = v7;

    -[UITextView setDelegate:](v5->_textLabel, "setDelegate:", v5);
    -[UITextView setAdjustsFontForContentSizeCategory:](v5->_textLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setEditable:](v5->_textLabel, "setEditable:", 0);
    -[UITextView setSelectable:](v5->_textLabel, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](v5->_textLabel, "setScrollEnabled:", 0);
    -[UITextView textContainer](v5->_textLabel, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[UITextView _setInteractiveTextSelectionDisabled:](v5->_textLabel, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTextContainerInset:](v5->_textLabel, "setTextContainerInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v5->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v5->_textLabel, "setBackgroundColor:", v10);

    privacyReportTitleForCurrentStatus(v5->_expanded);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](v5->_textLabel, "setAttributedText:", v11);

    v36 = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](v5->_textLabel, "setLinkTextAttributes:", v13);

    v33 = v6;
    objc_msgSend(v6, "addSubview:", v5->_textLabel);
    objc_msgSend(v6, "layoutMarginsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView topAnchor](v5->_textLabel, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    -[UITextView bottomAnchor](v5->_textLabel, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v15;
    -[UITextView leadingAnchor](v5->_textLabel, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v18;
    -[UITextView trailingAnchor](v5->_textLabel, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v22);

    -[SFPrivacyReportExplanationTableViewCell setBackgroundView:](v5, "setBackgroundView:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v23);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v5, sel_privacyProxyStateChanged_, *MEMORY[0x1E0D8B2B0], 0);

    v25 = v5;
  }

  return v5;
}

- (void)setExpanded:(BOOL)a3
{
  id v4;

  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    privacyReportTitleForCurrentStatus(a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextView setAttributedText:](self->_textLabel, "setAttributedText:", v4);

  }
}

- (void)_toggleExpanded:(id)a3
{
  id WeakRetained;

  -[SFPrivacyReportExplanationTableViewCell setExpanded:](self, "setExpanded:", !self->_expanded);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "cellDidToggleExpandDetailedExplanation:", self);

}

- (CGRect)_separatorFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)privacyProxyStateChanged:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__SFPrivacyReportExplanationTableViewCell_privacyProxyStateChanged___block_invoke;
  v3[3] = &unk_1E4ABFE00;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v3, 0);
}

uint64_t __68__SFPrivacyReportExplanationTableViewCell_privacyProxyStateChanged___block_invoke(uint64_t a1)
{
  void *v2;

  privacyReportTitleForCurrentStatus(*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1033));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setAttributedText:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  -[SFPrivacyReportExplanationTableViewCell _toggleExpanded:](self, "_toggleExpanded:", a3, a4, a5.location, a5.length, a6);
  return 0;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (SFPrivacyReportExplanationTableViewCellDelegate)delegate
{
  return (SFPrivacyReportExplanationTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
