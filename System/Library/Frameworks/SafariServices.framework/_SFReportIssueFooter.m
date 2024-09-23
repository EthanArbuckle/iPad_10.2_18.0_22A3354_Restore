@implementation _SFReportIssueFooter

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("translationIssueSectionFooter");
}

- (_SFReportIssueFooter)initWithFrame:(CGRect)a3
{
  _SFReportIssueFooter *v3;
  _SFReportIssueFooter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFReportIssueFooter *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)_SFReportIssueFooter;
  v3 = -[_SFReportIssueFooter initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_SFReportIssueFooter createTextViewForFooter](v3, "createTextViewForFooter");
    -[_SFReportIssueFooter addSubview:](v4, "addSubview:", v4->_textView);
    v16 = (void *)MEMORY[0x1E0CB3718];
    -[UITextView topAnchor](v4->_textView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportIssueFooter topAnchor](v4, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    -[UITextView leadingAnchor](v4->_textView, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportIssueFooter leadingAnchor](v4, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v6;
    -[UITextView trailingAnchor](v4->_textView, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportIssueFooter trailingAnchor](v4, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -8.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v9;
    -[UITextView bottomAnchor](v4->_textView, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFReportIssueFooter bottomAnchor](v4, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v13);

    v14 = v4;
  }

  return v4;
}

- (void)createTextViewForFooter
{
  UITextView *v3;
  UITextView *textView;
  void *v5;
  void *v6;
  UITextView *v7;
  UITextView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!self->_textView)
  {
    v3 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    textView = self->_textView;
    self->_textView = v3;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](self->_textView, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](self->_textView, "setFont:", v6);

    v7 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
    v8 = self->_textView;
    self->_textView = v7;

    -[UITextView setDelegate:](self->_textView, "setDelegate:", self);
    -[UITextView setEditable:](self->_textView, "setEditable:", 0);
    -[UITextView setSelectable:](self->_textView, "setSelectable:", 1);
    -[UITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
    -[UITextView textContainer](self->_textView, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineFragmentPadding:", 0.0);

    -[UITextView _setInteractiveTextSelectionDisabled:](self->_textView, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](self->_textView, "setBackgroundColor:", v10);

    v13 = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setLinkTextAttributes:](self->_textView, "setLinkTextAttributes:", v12);

  }
}

- (void)setFooterText:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v13 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v13, "length");
  v8 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC32C0], v8, 0, v7);
  v9 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v9, v10, 0, v7);

  v11 = *MEMORY[0x1E0DC32A8];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v11, v12, 0, v7);

  objc_msgSend(v13, "safari_replaceOccurrenceOfString:withString:link:", CFSTR("%learn-more%"), v6, CFSTR("learn-more://"));
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v13);
  -[UITextView setAdjustsFontForContentSizeCategory:](self->_textView, "setAdjustsFontForContentSizeCategory:", 1);

}

- (NSString)footerText
{
  void *v2;
  void *v3;

  -[UITextView attributedText](self->_textView, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a3;
  v9 = a4;
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v13 = (void *)getOBWelcomeControllerClass_softClass;
  v33 = getOBWelcomeControllerClass_softClass;
  v14 = MEMORY[0x1E0C809B0];
  if (!getOBWelcomeControllerClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __getOBWelcomeControllerClass_block_invoke;
    location[3] = &unk_1E4ABFC78;
    location[4] = &v30;
    __getOBWelcomeControllerClass_block_invoke((uint64_t)location);
    v13 = (void *)v31[3];
  }
  v26 = v8;
  v15 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v30, 8);
  v16 = (void *)objc_msgSend([v15 alloc], "initWithTitle:detailText:icon:", v10, v11, v12);
  objc_msgSend(v16, "buttonTray");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPrivacyLinkForBundles:", &unk_1E4B26F80);

  objc_initWeak(location, v16);
  v18 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v19 = (void *)MEMORY[0x1E0DC3428];
  v27[0] = v14;
  v27[1] = 3221225472;
  v27[2] = __75___SFReportIssueFooter_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
  v27[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v28, location);
  objc_msgSend(v19, "actionWithTitle:image:identifier:handler:", &stru_1E4AC8470, 0, 0, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithBarButtonSystemItem:primaryAction:", 0, v20);
  objc_msgSend(v16, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRightBarButtonItem:", v21);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v16);
  -[_SFReportIssueFooter delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "presentLearnMoreViewController:", v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak(location);

  return 0;
}

- (_SFReportIssueFooterDelegate)delegate
{
  return (_SFReportIssueFooterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
