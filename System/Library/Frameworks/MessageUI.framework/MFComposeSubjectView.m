@implementation MFComposeSubjectView

- (MFComposeSubjectView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  MFComposeSubjectView *v5;
  void *v6;
  void *v7;
  void *v8;
  MFComposeSubjectTextView *v9;
  uint64_t v10;
  UITextView *textView;
  void *v12;
  void *v13;
  UITextView *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  v19.receiver = self;
  v19.super_class = (Class)MFComposeSubjectView;
  v5 = -[MFComposeSubjectView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUBJECT"), &stru_1E5A6A588, CFSTR("Main"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeSubjectView setLabel:](v5, "setLabel:", v7);

    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [MFComposeSubjectTextView alloc];
    v10 = -[MFComposeSubjectTextView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), width - *MEMORY[0x1E0C9D648], floor(height));
    textView = v5->_textView;
    v5->_textView = (UITextView *)v10;

    -[UITextView textContainer](v5->_textView, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

    -[UITextView setFont:](v5->_textView, "setFont:", v8);
    -[UITextView setDelegate:](v5->_textView, "setDelegate:", v5);
    -[UITextView layoutManager](v5->_textView, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v5);

    v14 = v5->_textView;
    objc_msgSend(MEMORY[0x1E0DC3658], "mailComposeTextViewBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UITextView setAccessibilityIdentifier:](v5->_textView, "setAccessibilityIdentifier:", CFSTR("subjectField"));
    -[UITextView setScrollsToTop:](v5->_textView, "setScrollsToTop:", 0);
    -[MFComposeSubjectView addSubview:](v5, "addSubview:", v5->_textView);
    v5->_needsExclusionPathUpdate = 1;
    -[MFComposeSubjectView _updateTextContainerInsets](v5, "_updateTextContainerInsets");
    -[MFComposeSubjectView inputAssistantItem](v5, "inputAssistantItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_setShowsBarButtonItemsInline:", 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel__textInputDidChange_, *MEMORY[0x1E0DC5528], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView dealloc](&v4, sel_dealloc);
}

- (void)_showNotifyButtonIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MFConfirmationButton *v7;
  MFConfirmationButton *notifyButton;
  void *v9;

  if (!self->_notifyButton)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTIFY_ME_CONFIRMATION"), &stru_1E5A6A588, CFSTR("Main"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOTIFY_ME"), &stru_1E5A6A588, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFConfirmationButton confirmationButtonWithMessage:confirmationLabel:handler:](MFConfirmationButton, "confirmationButtonWithMessage:confirmationLabel:handler:", v4, v6, 0);
    v7 = (MFConfirmationButton *)objc_claimAutoreleasedReturnValue();
    notifyButton = self->_notifyButton;
    self->_notifyButton = v7;

    -[MFConfirmationButton setAccessibilityIdentifier:](self->_notifyButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BB0]);
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("bell.fill"), 13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFConfirmationButton setConfirmationIcon:](self->_notifyButton, "setConfirmationIcon:", v9);

    -[MFConfirmationButton setConfirmationType:](self->_notifyButton, "setConfirmationType:", 1);
    -[MFConfirmationButton setConfirmationSelectionMode:](self->_notifyButton, "setConfirmationSelectionMode:", 1);
    -[MFDimmableButton setHidesWhenDimmedIfNotSelected:](self->_notifyButton, "setHidesWhenDimmedIfNotSelected:", 1);
    -[MFDimmableButton setDimmed:](self->_notifyButton, "setDimmed:", 1);
    -[MFConfirmationButton setContentMode:](self->_notifyButton, "setContentMode:", 4);
    -[MFComposeSubjectView _configureNotifyGlyphs](self, "_configureNotifyGlyphs");
    -[MFComposeSubjectView addSubview:](self, "addSubview:", self->_notifyButton);
    -[MFDimmableButton setHidden:](self->_notifyButton, "setHidden:", -[MFComposeSubjectView allowsNotifyOption](self, "allowsNotifyOption"));
  }
}

- (MFConfirmationButton)notifyButton
{
  return self->_notifyButton;
}

- (void)_configureNotifyGlyphs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[MFComposeSubjectView notifyButton](self, "notifyButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke((uint64_t)v2, (uint64_t)CFSTR("bell.fill"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setImage:forState:", v3, 65540);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke((uint64_t)v4, (uint64_t)CFSTR("bell.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setImage:forState:", v5, 4);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke((uint64_t)v6, (uint64_t)CFSTR("bell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setImage:forState:", v7, 0);
}

id __46__MFComposeSubjectView__configureNotifyGlyphs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", a2, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithTintColor:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageWithRenderingMode:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setAllowsNotifyOption:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_allowsNotifyOption = a3;
  v3 = !a3;
  -[MFComposeSubjectView notifyButton](self, "notifyButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)isNotifyOptionSelected
{
  void *v2;
  char v3;

  -[MFComposeSubjectView notifyButton](self, "notifyButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSelected");

  return v3;
}

- (void)setNotifyOptionSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MFComposeSubjectView notifyButton](self, "notifyButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

}

- (void)setTrailingButtonMidlineInsetFromLayoutMargin:(double)a3
{
  if (self->_trailingButtonMidlineInsetFromLayoutMargin != a3)
  {
    self->_trailingButtonMidlineInsetFromLayoutMargin = a3;
    -[MFComposeSubjectView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSeparatorHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_separatorHidden != a3)
  {
    v3 = a3;
    self->_separatorHidden = a3;
    -[MFComposeSubjectView separator](self, "separator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (BOOL)separatorHidden
{
  void *v2;
  char v3;

  -[MFComposeSubjectView separator](self, "separator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setNeedsExclusionPathUpdate
{
  self->_needsExclusionPathUpdate = 1;
  -[MFComposeSubjectView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateExclusionPathsIfNeeded
{
  _BOOL4 IsAccessibilityCategory;
  uint64_t v4;
  void *v5;
  NSString *v6;
  id v7;
  id v8;

  if (self->_needsExclusionPathUpdate)
  {
    self->_needsExclusionPathUpdate = 0;
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    if (IsAccessibilityCategory)
    {
      -[MFComposeSubjectView notifyButton](self, "notifyButton");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MFComposeSubjectView _textContainerExclusionPathsWithNotifyButton:](self, "_textContainerExclusionPathsWithNotifyButton:", objc_msgSend(v7, "isHidden") ^ 1);
      v4 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v4;
    }
    else
    {
      v8 = (id)MEMORY[0x1E0C9AA60];
    }
    -[UITextView textContainer](self->_textView, "textContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExclusionPaths:", v8);

  }
}

- (BOOL)becomeFirstResponder
{
  return -[UITextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  id v5;

  -[MFComposeSubjectView notifyButton](self, "notifyButton", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimmed:", 1);

  -[MFComposeSubjectView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeSubjectViewTextFieldDidResignFirstResponder:", self);

}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  id v5;

  -[MFComposeSubjectView _showNotifyButtonIfNeeded](self, "_showNotifyButtonIfNeeded", a3);
  -[MFComposeSubjectView notifyButton](self, "notifyButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimmed:", 0);

  -[MFComposeSubjectView setNeedsExclusionPathUpdate](self, "setNeedsExclusionPathUpdate");
  -[MFComposeSubjectView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeSubjectViewTextFieldDidBecomeFirstResponder:", self);

}

- (void)refreshPreferredContentSize
{
  UITextView *textView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView refreshPreferredContentSize](&v5, sel_refreshPreferredContentSize);
  textView = self->_textView;
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](textView, "setFont:", v4);

  -[MFComposeSubjectView setNeedsExclusionPathUpdate](self, "setNeedsExclusionPathUpdate");
}

- (void)_updateTextContainerInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[MFComposeSubjectView _recipientViewEdgeInsets](self, "_recipientViewEdgeInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITextView textContainerInset](self->_textView, "textContainerInset");
  if (v6 != v14 || v4 != v11 || v10 != v13 || v8 != v12)
    -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", v4, v6, v8, v10);
}

- (id)_textContainerExclusionPathsWithNotifyButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  objc_super v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  v30.receiver = self;
  v30.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView layoutIfNeeded](&v30, sel_layoutIfNeeded);
  -[MFComposeSubjectView labelView](self, "labelView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 1)
    v8 = 8;
  else
    v8 = 2;
  -[MFComposeSubjectView _exclusionRectForView:alongEdge:](self, "_exclusionRectForView:alongEdge:", v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[MFComposeSubjectView convertRect:toView:](self, "convertRect:toView:", self->_textView, v10, v12, v14, v16);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);
  if (v3)
  {
    -[MFComposeSubjectView notifyButton](self, "notifyButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 1)
      v19 = 2;
    else
      v19 = 8;
    -[MFComposeSubjectView _exclusionRectForView:alongEdge:](self, "_exclusionRectForView:alongEdge:", v18, v19);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;

    -[MFComposeSubjectView convertRect:toView:](self, "convertRect:toView:", self->_textView, v21, v23, v25, v27);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v28);

  }
  return v5;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  -[MFComposeSubjectView frame](self, "frame");
  v9 = v8 - CGRectGetWidth(v11);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= 2.22044605e-16)
    self->_needsExclusionPathUpdate = 1;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeSubjectView;
  -[MFMailComposeHeaderView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[MFComposeSubjectView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[MFComposeSubjectView _configureNotifyGlyphs](self, "_configureNotifyGlyphs");
    self->_needsExclusionPathUpdate = 1;
  }

}

- (void)layoutSubviews
{
  void *v3;
  id *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double x;
  double y;
  double width;
  double height;
  double v27;
  NSString *v28;
  _BOOL4 v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  void *v39;
  uint64_t v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  NSString *v58;
  _BOOL4 v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  objc_super v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v70.receiver = self;
  v70.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView layoutSubviews](&v70, sel_layoutSubviews);
  -[UITextView layoutManager](self->_textView, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x1E0DC4730];
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  v7 = 0.0;
  v8 = 1.0;
  if (!IsAccessibilityCategory)
    v8 = 0.0;
  objc_msgSend(v3, "setHyphenationFactor:", v8);

  v9 = -[MFComposeSubjectView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (-[MFComposeSubjectView allowsNotifyOption](self, "allowsNotifyOption"))
  {
    -[MFComposeSubjectView notifyButton](self, "notifyButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 2.0;
    objc_msgSend(v10, "sizeToFit");
  }
  else
  {
    v10 = 0;
  }
  -[MFComposeSubjectView _contentRect](self, "_contentRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v67 = v11;
  v68 = v13;
  v66 = v15;
  v69 = v17;
  if (v10)
  {
    objc_msgSend(v10, "frame");
    v19 = v12;
    v20 = v14;
    v21 = v16;
    v22 = v18;
    if (v9 == 1)
      CGRectGetMinX(*(CGRect *)&v19);
    else
      CGRectGetMaxX(*(CGRect *)&v19);
    -[MFComposeSubjectView bounds](self, "bounds");
    objc_msgSend(*v4, "preferredContentSizeCategory");
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    v29 = UIContentSizeCategoryIsAccessibilityCategory(v28);

    if (v29)
    {
      -[MFComposeSubjectView labelView](self, "labelView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "frame");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v71.origin.x = v32;
      v71.origin.y = v34;
      v71.size.width = v36;
      v71.size.height = v38;
      CGRectGetMinY(v71);
      v72.origin.x = v32;
      v72.origin.y = v34;
      v72.size.width = v36;
      v72.size.height = v38;
      CGRectGetHeight(v72);
    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scale");
    v65 = v40;
    UIRectCenteredYInRectScale();
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;

    v73.origin.x = v42;
    v73.origin.y = v44;
    v73.size.width = v46;
    v73.size.height = v48;
    v74 = CGRectOffset(v73, 0.0, -v7);
    x = v74.origin.x;
    y = v74.origin.y;
    width = v74.size.width;
    height = v74.size.height;
    -[MFComposeSubjectView trailingButtonMidlineInsetFromLayoutMargin](self, "trailingButtonMidlineInsetFromLayoutMargin", v65);
    if (v49 == 0.0)
    {
      v27 = 0.0;
    }
    else
    {
      -[MFComposeSubjectView trailingButtonMidlineInsetFromLayoutMargin](self, "trailingButtonMidlineInsetFromLayoutMargin");
      v51 = v50;
      v75.origin.x = x;
      v75.origin.y = y;
      v75.size.width = width;
      v75.size.height = height;
      v27 = v51 + CGRectGetWidth(v75) * -0.5;
      v52 = -1.0;
      if (v9 == 1)
        v52 = 1.0;
      x = x + v27 * v52;
    }
    objc_msgSend(v10, "setFrame:", x, y, width, height);
  }
  else
  {
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v27 = 0.0;
  }
  -[MFComposeSubjectView bounds](self, "bounds");
  if (v53 >= v69)
    v54 = v53;
  else
    v54 = v69;
  -[MFComposeSubjectView labelView](self, "labelView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "frame");
  v56 = CGRectGetWidth(v76);

  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  v57 = CGRectGetWidth(v77);
  objc_msgSend(*v4, "preferredContentSizeCategory");
  v58 = (NSString *)objc_claimAutoreleasedReturnValue();
  v59 = UIContentSizeCategoryIsAccessibilityCategory(v58);
  v60 = v56 + 5.0;
  v61 = v27 + v57 + 5.0;

  if (v9 == 1)
    v62 = v61;
  else
    v62 = v60;
  if (v9 == 1)
    v63 = v60;
  else
    v63 = v61;
  if (v59)
    v64 = 0.0;
  else
    v64 = v62;
  if (v59)
    v63 = 0.0;
  -[UITextView setFrame:](self->_textView, "setFrame:", v67 + v64, v68, v66 - (v64 + v63), v54);
  -[MFComposeSubjectView _updateTextContainerInsets](self, "_updateTextContainerInsets");
  -[MFComposeSubjectView _updateExclusionPathsIfNeeded](self, "_updateExclusionPathsIfNeeded");

}

- (void)displayMetricsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeSubjectView;
  -[MFMailComposeHeaderView displayMetricsDidChange](&v4, sel_displayMetricsDidChange);
  -[MFMailComposeHeaderView displayMetrics](self, "displayMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingButtonMidlineOffset");
  -[MFComposeSubjectView setTrailingButtonMidlineInsetFromLayoutMargin:](self, "setTrailingButtonMidlineInsetFromLayoutMargin:");

}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  const char *v42;
  __int128 v43;
  __int128 v44;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    -[UITextView textContainerInset](self->_textView, "textContainerInset");
    v11 = v10;
    v13 = v12;
    v39 = 0;
    v40 = &v39;
    v41 = 0x4010000000;
    v42 = "";
    *(_QWORD *)&v14 = -1;
    *((_QWORD *)&v14 + 1) = -1;
    v43 = v14;
    v44 = v14;
    objc_msgSend(v8, "usedRectForTextContainer:", v9);
    *(_QWORD *)&v43 = v15;
    *((_QWORD *)&v43 + 1) = v16;
    *(_QWORD *)&v44 = v17;
    *((_QWORD *)&v44 + 1) = v18;
    v19 = v40;
    *((_OWORD *)v40 + 2) = *MEMORY[0x1E0C9D538];
    v19[7] = v11;
    -[UITextView bounds](self->_textView, "bounds");
    v40[6] = v20;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v21 = objc_msgSend(v8, "numberOfGlyphs");
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __78__MFComposeSubjectView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke;
    v34[3] = &unk_1E5A65718;
    v34[4] = &v35;
    v34[5] = &v39;
    objc_msgSend(v8, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v21, v34);
    if (v36[3])
    {
      v22 = (double *)v40;
      v23 = *((double *)v40 + 7);
    }
    else
    {
      objc_msgSend(v8, "usedRectForTextContainer:", v9);
      v22 = (double *)v40;
      v23 = v24 + *((double *)v40 + 7);
      *((double *)v40 + 7) = v23;
    }
    v22[7] = v13 + v23;
    -[UITextView bounds](self->_textView, "bounds");
    if (v22[6] != v26 || v22[7] != v25)
    {
      -[UITextView frame](self->_textView, "frame");
      v27 = v40;
      v40[4] = v28;
      v27[5] = v29;
      -[UITextView setFrame:](self->_textView, "setFrame:");
      -[MFComposeSubjectView bounds](self, "bounds");
      v31 = v30;
      v32 = *((double *)v40 + 7);
      -[MFComposeSubjectView delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "composeHeaderView:didChangeSize:", self, v31, v32);

    }
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }

}

double __78__MFComposeSubjectView_layoutManager_didCompleteLayoutForTextContainer_atEnd___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  double result;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = a9 + *(double *)(v9 + 56);
  *(double *)(v9 + 56) = result;
  return result;
}

- (NSString)text
{
  return -[UITextView text](self->_textView, "text");
}

- (void)setText:(id)a3
{
  -[UITextView setText:](self->_textView, "setText:", a3);
}

- (void)setDelegate:(id)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFComposeSubjectView;
  -[MFComposeSubjectView setDelegate:](&v6, sel_setDelegate_, a3);
  -[MFComposeSubjectView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)self + 560) = *((_BYTE *)self + 560) & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *((_BYTE *)self + 560) = *((_BYTE *)self + 560) & 0xFD | v5;

}

- (BOOL)enabled
{
  return -[UITextView isUserInteractionEnabled](self->_textView, "isUserInteractionEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  -[UITextView setUserInteractionEnabled:](self->_textView, "setUserInteractionEnabled:", a3);
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v8 = 0;
  -[UITextView text](self->_textView, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cleanupSubjectString(v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "setText:", v6);
  if ((*((_BYTE *)self + 560) & 1) != 0)
  {
    -[MFComposeSubjectView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "composeHeaderViewDidChangeValue:", self);

  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;

  length = a4.length;
  v8 = a3;
  v9 = a5;
  -[MFComposeSubjectView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFComposeSubjectView isEndEditingText:](self, "isEndEditingText:", v9);
  if (v11)
  {
    objc_msgSend(v10, "composeHeaderViewDidConfirmValue:", self);
  }
  else if ((*((_BYTE *)self + 560) & 2) != 0)
  {
    objc_msgSend(v8, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (length == v13)
      objc_msgSend(v10, "composeSubjectViewWillRemoveContent:", self);
  }

  return !v11;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  id v6;
  _BOOL4 v7;
  void *v8;

  v6 = a4;
  v7 = -[MFComposeSubjectView isEndEditingText:](self, "isEndEditingText:", v6);
  if (v7)
  {
    -[MFComposeSubjectView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "composeHeaderViewDidConfirmValue:", self);

  }
  return !v7;
}

- (BOOL)isEndEditingText:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("\n")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("\t"));

  return v4;
}

- (BOOL)endEditing:(BOOL)a3
{
  return -[UITextView endEditing:](self->_textView, "endEditing:", a3);
}

- (BOOL)_canBecomeFirstResponder
{
  return 1;
}

- (void)_textInputDidChange:(id)a3
{
  void *v4;
  uint64_t v5;

  -[UITextView text](self->_textView, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", -[UIResponder mf_textAlignmentForActiveInputLanguage](self, "mf_textAlignmentForActiveInputLanguage"));
}

- (UITextView)textView
{
  return self->_textView;
}

- (BOOL)allowsNotifyOption
{
  return self->_allowsNotifyOption;
}

- (double)trailingButtonMidlineInsetFromLayoutMargin
{
  return self->_trailingButtonMidlineInsetFromLayoutMargin;
}

- (BOOL)isSeparatorHidden
{
  return self->_separatorHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
