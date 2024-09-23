@implementation _SFTableLinkableFooterView

- (_SFTableLinkableFooterView)initWithReuseIdentifier:(id)a3
{
  _SFTableLinkableFooterView *v3;
  _SFTableLinkableFooterView *v4;
  _SFTableLinkableFooterView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFTableLinkableFooterView;
  v3 = -[_SFTableLinkableFooterView initWithReuseIdentifier:](&v7, sel_initWithReuseIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    -[_SFTableLinkableFooterView _configureSubviewsAndConstraints](v3, "_configureSubviewsAndConstraints");
    v5 = v4;
  }

  return v4;
}

- (void)_configureSubviewsAndConstraints
{
  void *v3;
  UITextView *v4;
  UITextView *textView;
  void *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *textViewLeadingConstraint;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *textViewTrailingConstraint;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  -[_SFTableLinkableFooterView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
  textView = self->_textView;
  self->_textView = v4;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v6);

  -[UITextView setShowsVerticalScrollIndicator:](self->_textView, "setShowsVerticalScrollIndicator:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 1);
  -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  -[UITextView textContainer](self->_textView, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineFragmentPadding:", 0.0);

  -[UITextView _setInteractiveTextSelectionDisabled:](self->_textView, "_setInteractiveTextSelectionDisabled:", 1);
  -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_textView, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "addSubview:", self->_textView);
  PreferencesTableViewCellLeftPad();
  v9 = v8;
  -[UITextView leadingAnchor](self->_textView, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, v9);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textViewLeadingConstraint = self->_textViewLeadingConstraint;
  self->_textViewLeadingConstraint = v13;

  objc_msgSend(v3, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView trailingAnchor](self->_textView, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, v9);
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textViewTrailingConstraint = self->_textViewTrailingConstraint;
  self->_textViewTrailingConstraint = v18;

  v20 = (void *)MEMORY[0x1E0CB3718];
  v21 = self->_textViewTrailingConstraint;
  v29[0] = self->_textViewLeadingConstraint;
  v29[1] = v21;
  -[UITextView topAnchor](self->_textView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v24;
  -[UITextView bottomAnchor](self->_textView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v28);

}

- (void)setText:(id)a3 linkPlaceholderString:(id)a4 linkReplacementString:(id)a5
{
  id v8;
  id v9;
  NSString *v10;
  NSString *text;
  NSString *v12;
  NSString *linkPlaceholderString;
  NSString *v14;
  NSString *linkReplacementString;

  v8 = a5;
  v9 = a4;
  v10 = (NSString *)objc_msgSend(a3, "copy");
  text = self->_text;
  self->_text = v10;

  v12 = (NSString *)objc_msgSend(v9, "copy");
  linkPlaceholderString = self->_linkPlaceholderString;
  self->_linkPlaceholderString = v12;

  v14 = (NSString *)objc_msgSend(v8, "copy");
  linkReplacementString = self->_linkReplacementString;
  self->_linkReplacementString = v14;

  -[_SFTableLinkableFooterView _updateAttributedString](self, "_updateAttributedString");
}

- (void)_updateAttributedString
{
  id v3;
  NSString *text;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  id v13;
  double v14;
  id v15;
  NSString *linkReplacementString;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  text = self->_text;
  v5 = *MEMORY[0x1E0DC32A0];
  v27[0] = *MEMORY[0x1E0DC32A0];
  v6 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  v27[1] = *MEMORY[0x1E0DC32A8];
  -[_SFTableLinkableFooterView _attributedStringTextColor](self, "_attributedStringTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithString:attributes:", text, v9);

  -[_SFTableLinkableFooterView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSizeCategory");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = UIContentSizeCategoryIsAccessibilityCategory(v12);

  if ((_DWORD)v8)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
    LODWORD(v14) = 1055286886;
    objc_msgSend(v13, "setHyphenationFactor:", v14);
    objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x1E0DC32C0], v13, 0, objc_msgSend(v10, "length"));

  }
  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  linkReplacementString = self->_linkReplacementString;
  v25[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0DC3320];
  v26[0] = v17;
  v26[1] = MEMORY[0x1E0C9AAA0];
  v19 = *MEMORY[0x1E0DC32B8];
  v25[1] = v18;
  v25[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E4AC8470);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v15, "initWithString:attributes:", linkReplacementString, v21);

  v23 = -[NSString rangeOfString:](self->_text, "rangeOfString:", self->_linkPlaceholderString);
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", v23, v24, v22);
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v10);

}

- (id)_attributedStringTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "linkableFooterViewDidInteractWithLink:", self);

  return 0;
}

- (_SFTableLinkableFooterViewDelegate)delegate
{
  return (_SFTableLinkableFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkReplacementString, 0);
  objc_storeStrong((id *)&self->_linkPlaceholderString, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
