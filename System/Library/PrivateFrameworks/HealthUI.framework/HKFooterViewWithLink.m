@implementation HKFooterViewWithLink

- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 fullText:(id)a4 linkRange:(_NSRange)a5 link:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  HKFooterViewWithLink *v13;
  HKFooterViewWithLink *v14;
  objc_super v16;

  length = a5.length;
  location = a5.location;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKFooterViewWithLink;
  v13 = -[HKFooterViewWithLink initWithReuseIdentifier:](&v16, sel_initWithReuseIdentifier_, a3);
  v14 = v13;
  if (v13)
  {
    -[HKFooterViewWithLink _setUpFooterTextViewWithFullText:linkRange:link:](v13, "_setUpFooterTextViewWithFullText:linkRange:link:", v11, location, length, v12);
    -[HKFooterViewWithLink _setupConstraints](v14, "_setupConstraints");
  }

  return v14;
}

- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 bodyText:(id)a4 linkText:(id)a5 link:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKFooterViewWithLink *v13;
  HKFooterViewWithLink *v14;
  objc_super v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HKFooterViewWithLink;
  v13 = -[HKFooterViewWithLink initWithReuseIdentifier:](&v16, sel_initWithReuseIdentifier_, a3);
  v14 = v13;
  if (v13)
  {
    -[HKFooterViewWithLink _setUpFooterTextViewWithBodyText:linkText:link:](v13, "_setUpFooterTextViewWithBodyText:linkText:link:", v10, v11, v12);
    -[HKFooterViewWithLink _setupConstraints](v14, "_setupConstraints");
  }

  return v14;
}

- (HKFooterViewWithLink)initWithReuseIdentifier:(id)a3 markdown:(id)a4
{
  id v6;
  HKFooterViewWithLink *v7;
  HKFooterViewWithLink *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKFooterViewWithLink;
  v7 = -[HKFooterViewWithLink initWithReuseIdentifier:](&v12, sel_initWithReuseIdentifier_, a3);
  v8 = v7;
  if (v7)
  {
    -[HKFooterViewWithLink _setUpTextView](v7, "_setUpTextView");
    -[HKFooterViewWithLink _createAttributedMarkdown:](v8, "_createAttributedMarkdown:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKFooterViewWithLink footerTextView](v8, "footerTextView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributedText:", v9);

    -[HKFooterViewWithLink _setupConstraints](v8, "_setupConstraints");
  }

  return v8;
}

- (void)updateWithMarkdown:(id)a3
{
  void *v4;
  id v5;

  -[HKFooterViewWithLink _createAttributedMarkdown:](self, "_createAttributedMarkdown:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v5);

}

- (void)_setUpFooterTextViewWithBodyText:(id)a3 linkText:(id)a4 link:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "localizedStringWithFormat:", CFSTR("%@ %@"), v10, a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") + 1;
  v12 = objc_msgSend(v14, "length");
  v13 = objc_msgSend(v10, "length");

  -[HKFooterViewWithLink _setUpFooterTextViewWithFullText:linkRange:link:](self, "_setUpFooterTextViewWithFullText:linkRange:link:", v14, v11, v12 + ~v13, v9);
}

- (void)_setUpTextView
{
  id v3;
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
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKFooterViewWithLink setFooterTextView:](self, "setFooterTextView:", v4);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEnabled:", 0);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", 1);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditable:", 0);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setInteractiveTextSelectionDisabled:", 1);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDataDetectorTypes:", 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v20 = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLinkTextAttributes:", v16);

  -[HKFooterViewWithLink contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

}

- (void)_setUpFooterTextViewWithFullText:(id)a3 linkRange:(_NSRange)a4 link:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  -[HKFooterViewWithLink _setUpTextView](self, "_setUpTextView");
  -[HKFooterViewWithLink _createAttributedTextWithFullText:linkRange:link:](self, "_createAttributedTextWithFullText:linkRange:link:", v10, location, length, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v12);

}

- (id)_createAttributedMarkdown:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMarkdownString:options:baseURL:error:", v5, 0, 0, 0);

  -[HKFooterViewWithLink defaultContentConfiguration](self, "defaultContentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = *MEMORY[0x1E0DC1138];
  v10 = v32;
  v11 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0DC1140];
  v13 = v33;
  v34[0] = v12;
  v34[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v32, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  v31[0] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0DC1160];
  v19 = objc_msgSend(v6, "length");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __50__HKFooterViewWithLink__createAttributedMarkdown___block_invoke;
  v26[3] = &unk_1E9C423B8;
  v20 = v6;
  v27 = v20;
  v28 = v17;
  v29 = v14;
  v21 = v14;
  v22 = v17;
  objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v19, 0, v26);
  v23 = v29;
  v24 = v20;

  return v24;
}

uint64_t __50__HKFooterViewWithLink__createAttributedMarkdown___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = 40;
  if (!a2)
    v4 = 48;
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", *(_QWORD *)(a1 + v4), a3, a4);
}

- (id)_createAttributedTextWithFullText:(id)a3 linkRange:(_NSRange)a4 link:(id)a5
{
  NSUInteger location;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSUInteger length;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[3];

  length = a4.length;
  location = a4.location;
  v27[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[HKFooterViewWithLink defaultContentConfiguration](self, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0DC1138];
  v26[0] = *MEMORY[0x1E0DC1138];
  v14 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC1140];
  v26[1] = *MEMORY[0x1E0DC1140];
  v27[0] = v15;
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v9, v17);
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v19;
    v24[1] = v16;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = *MEMORY[0x1E0DC1160];
    v25[1] = v20;
    v25[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addAttributes:range:", v21, location, length);
  }

  return v18;
}

- (void)_setupConstraints
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
  id v23;

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstBaselineAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutMarginsGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7, 12.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v12, 2.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[HKFooterViewWithLink contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v17, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[HKFooterViewWithLink contentView](self, "contentView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v21, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

}

- (void)setTextViewDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)getTextViewDelegate
{
  void *v2;
  void *v3;

  -[HKFooterViewWithLink footerTextView](self, "footerTextView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v7 = a4;
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("bridge")) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v7, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isEqualToString:", CFSTR("prefs"));

  }
  if (!a6 && v9)
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "openSensitiveURL:withOptions:", v7, 0);

  }
  return v9 ^ 1;
}

- (UITextViewDelegate)textViewDelegate
{
  return (UITextViewDelegate *)objc_loadWeakRetained((id *)&self->_textViewDelegate);
}

- (UITextView)footerTextView
{
  return self->_footerTextView;
}

- (void)setFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_footerTextView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTextView, 0);
  objc_destroyWeak((id *)&self->_textViewDelegate);
}

@end
