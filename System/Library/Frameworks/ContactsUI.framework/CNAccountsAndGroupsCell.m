@implementation CNAccountsAndGroupsCell

- (void)prepareForDisplay
{
  -[CNAccountsAndGroupsCell resetTextFieldEnabled](self, "resetTextFieldEnabled");
  -[CNAccountsAndGroupsCell applyTextViewPlaceholderIfNeeded](self, "applyTextViewPlaceholderIfNeeded");
}

- (void)setupTextViewConstraints
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
  double v16;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[8];

  v46[6] = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutMarginsGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v40;
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "layoutMarginsGuide");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v34;
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "centerYAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v28;
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaLayoutGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v21;
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeAreaLayoutGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v9;
    -[CNAccountsAndGroupsCell separatorLayoutGuide](self, "separatorLayoutGuide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineFragmentPadding");
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, v16 + 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v23);
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  -[CNAccountsAndGroupsCell setNeedsLayout](self, "setNeedsLayout");
  -[CNAccountsAndGroupsCell layoutIfNeeded](self, "layoutIfNeeded");
  v18.receiver = self;
  v18.super_class = (Class)CNAccountsAndGroupsCell;
  -[CNAccountsAndGroupsCell preferredLayoutAttributesFittingAttributes:](&v18, sel_preferredLayoutAttributesFittingAttributes_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  -[CNAccountsAndGroupsCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutMargins");
  v11 = v8 - v10;
  -[CNAccountsAndGroupsCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutMargins");
  v14 = v11 - v13 + -1.0;
  v15 = floorf(v14);

  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsCell requiredHeightForTextView:fittingWidth:](self, "requiredHeightForTextView:fittingWidth:", v16, v15);

  objc_msgSend(v5, "size");
  objc_msgSend(v5, "setSize:");
  return v5;
}

- (void)setItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  if (v8)
  {
    objc_msgSend(v8, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  v7 = v8;
  if (v8)
  {

    v7 = v8;
  }

}

- (void)resetTextFieldEnabled
{
  id v3;

  -[CNAccountsAndGroupsCell delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsCell setTextViewEnabled:](self, "setTextViewEnabled:", objc_msgSend(v3, "isCollectionViewEditing"));

}

- (void)setTextViewEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CNAccountsAndGroupsCell item](self, "item");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "canRename") & v3;
  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v5);

}

- (CNAccountsAndGroupsCellTextView)titleTextView
{
  CNAccountsAndGroupsCellTextView *titleTextView;
  CNAccountsAndGroupsCellTextView *v4;
  CNAccountsAndGroupsCellTextView *v5;
  CNAccountsAndGroupsCellTextView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;

  titleTextView = self->_titleTextView;
  if (!titleTextView)
  {
    v4 = [CNAccountsAndGroupsCellTextView alloc];
    v5 = -[CNAccountsAndGroupsCellTextView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_titleTextView;
    self->_titleTextView = v5;

    -[CNAccountsAndGroupsCellTextView setDelegate:](self->_titleTextView, "setDelegate:", self);
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCellTextView setBackgroundColor:](self->_titleTextView, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCellTextView setFont:](self->_titleTextView, "setFont:", v9);

    -[CNAccountsAndGroupsCellTextView setTextAlignment:](self->_titleTextView, "setTextAlignment:", 4);
    -[CNAccountsAndGroupsCellTextView setBounces:](self->_titleTextView, "setBounces:", 0);
    -[CNAccountsAndGroupsCellTextView setAutocorrectionType:](self->_titleTextView, "setAutocorrectionType:", 1);
    -[CNAccountsAndGroupsCellTextView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAccountsAndGroupsCellTextView setScrollEnabled:](self->_titleTextView, "setScrollEnabled:", 0);
    -[CNAccountsAndGroupsCellTextView setReturnKeyType:](self->_titleTextView, "setReturnKeyType:", 9);
    -[CNAccountsAndGroupsCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "effectiveUserInterfaceLayoutDirection");

    if (v11 == 1)
      v12 = 0.0;
    else
      v12 = 1.0;
    if (v11 == 1)
      v13 = 1.0;
    else
      v13 = 0.0;
    -[CNAccountsAndGroupsCellTextView setTextContainerInset:](self->_titleTextView, "setTextContainerInset:", 11.0, v12, 11.0, v13);
    -[CNAccountsAndGroupsCell setupTextViewConstraints](self, "setupTextViewConstraints");
    titleTextView = self->_titleTextView;
  }
  return titleTextView;
}

- (double)requiredHeightForTextView:(id)a3 fittingWidth:(double)a4
{
  double v4;
  float v5;

  objc_msgSend(a3, "sizeThatFits:", a4, 1.79769313e308);
  v5 = v4;
  return ceilf(v5);
}

- (void)applyTextViewPlaceholderIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CNAccountsAndGroupsCell item](self, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NEW_GROUP_NAME_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:", v7);
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedPlaceholder:", v8);

  }
}

- (void)applyTextColor:(id)a3
{
  -[CNAccountsAndGroupsCellTextView setTextColor:](self->_titleTextView, "setTextColor:", a3);
}

- (void)applyTextViewTintColor:(id)a3
{
  -[CNAccountsAndGroupsCellTextView setTintColor:](self->_titleTextView, "setTintColor:", a3);
}

- (void)applyAccessoryTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[CNAccountsAndGroupsCell accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CNAccountsAndGroupsCell_applyAccessoryTintColor___block_invoke;
  v8[3] = &unk_1E204EE20;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "_cn_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsCell setAccessories:](self, "setAccessories:", v6);
}

- (void)beginEditingName
{
  id v3;

  -[CNAccountsAndGroupsCell setTextViewEnabled:](self, "setTextViewEnabled:", 1);
  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)endEditingName
{
  void *v3;
  int v4;
  id v5;

  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if (v4)
  {
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resignFirstResponder");

  }
}

- (BOOL)isCellEditing
{
  void *v2;
  char v3;

  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;

  v4 = a3;
  -[CNAccountsAndGroupsCell item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canRename");

  if (v6)
  {
    objc_msgSend(v4, "frame");
    -[CNAccountsAndGroupsCell requiredHeightForTextView:fittingWidth:](self, "requiredHeightForTextView:fittingWidth:", v4, v7);
    -[CNAccountsAndGroupsCell setTitleTextViewHeight:](self, "setTitleTextViewHeight:");
  }

  return v6;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CNAccountsAndGroupsCell_textViewDidBeginEditing___block_invoke;
  block[3] = &unk_1E204F648;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  length = a4.length;
  v7 = a5;
  v8 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("\n")))
  {
    objc_msgSend(v8, "resignFirstResponder");

    v9 = 0;
  }
  else
  {
    objc_msgSend(v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "length");
    v12 = v11 - length + objc_msgSend(v7, "length");

    v9 = v12 < 300;
  }

  return v9;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "frame");
  -[CNAccountsAndGroupsCell requiredHeightForTextView:fittingWidth:](self, "requiredHeightForTextView:fittingWidth:", v4, v5);
  v7 = v6;

  -[CNAccountsAndGroupsCell titleTextViewHeight](self, "titleTextViewHeight");
  if (v8 != v7)
  {
    -[CNAccountsAndGroupsCell setTitleTextViewHeight:](self, "setTitleTextViewHeight:", v7);
    -[CNAccountsAndGroupsCell delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cellTextViewDidChangeHeight");

  }
}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  objc_msgSend(a3, "text");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "length") < 0x12D)
  {
    v5 = v15;
  }
  else
  {
    objc_msgSend(v15, "substringToIndex:", 300);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  v16 = v5;
  if (!-[CNAccountsAndGroupsCell isValidTitle:](self, "isValidTitle:", v5))
  {
    -[CNAccountsAndGroupsCell item](self, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = objc_claimAutoreleasedReturnValue();

    -[CNAccountsAndGroupsCell item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    v16 = (id)v7;
  }
  -[CNAccountsAndGroupsCell delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CNAccountsAndGroupsCell delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsCell item](self, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "item:didEndEditingWithName:", v14, v16);

  }
  -[CNAccountsAndGroupsCell resetTextFieldEnabled](self, "resetTextFieldEnabled");

}

- (BOOL)isValidTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAccountsAndGroupsCell;
  -[CNAccountsAndGroupsCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CNAccountsAndGroupsCell titleTextView](self, "titleTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CNAccountsAndGroupsCell setTitleTextView:](self, "setTitleTextView:", 0);
  -[CNAccountsAndGroupsCell setNeedsLayout](self, "setNeedsLayout");
}

- (CNAccountsAndGroupsItem)item
{
  return self->_item;
}

- (CNAccountsAndGroupsCellDelegate)delegate
{
  return (CNAccountsAndGroupsCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setTitleTextView:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextView, a3);
}

- (double)titleTextViewHeight
{
  return self->_titleTextViewHeight;
}

- (void)setTitleTextViewHeight:(double)a3
{
  self->_titleTextViewHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
}

uint64_t __51__CNAccountsAndGroupsCell_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectAll:", 0);
}

id __51__CNAccountsAndGroupsCell_applyAccessoryTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    v5 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v7, "customView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTintColor:", v8);

      v5 = v7;
    }
    else
    {
      objc_msgSend(v5, "setTintColor:", v8);
    }
    v10 = v5;

  }
  return v3;
}

@end
