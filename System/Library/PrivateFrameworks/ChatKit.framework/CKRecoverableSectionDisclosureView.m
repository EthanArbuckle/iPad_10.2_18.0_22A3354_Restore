@implementation CKRecoverableSectionDisclosureView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (CKRecoverableSectionDisclosureView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKRecoverableSectionDisclosureView *v7;
  CKRecoverableSectionDisclosureView *v8;
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
  objc_super v34;
  _QWORD v35[6];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35[4] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)CKRecoverableSectionDisclosureView;
  v7 = -[CKRecoverableSectionDisclosureView initWithFrame:](&v34, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[CKRecoverableSectionDisclosureView disclosureView](v7, "disclosureView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecoverableSectionDisclosureView addSubview:](v8, "addSubview:", v9);

    -[CKRecoverableSectionDisclosureView disclosureView](v8, "disclosureView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", x, y, width, height);

    v24 = (void *)MEMORY[0x1E0CB3718];
    -[CKRecoverableSectionDisclosureView disclosureView](v8, "disclosureView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecoverableSectionDisclosureView layoutMarginsGuide](v8, "layoutMarginsGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v29;
    -[CKRecoverableSectionDisclosureView disclosureView](v8, "disclosureView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecoverableSectionDisclosureView layoutMarginsGuide](v8, "layoutMarginsGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v23;
    -[CKRecoverableSectionDisclosureView disclosureView](v8, "disclosureView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecoverableSectionDisclosureView layoutMarginsGuide](v8, "layoutMarginsGuide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v13;
    -[CKRecoverableSectionDisclosureView disclosureView](v8, "disclosureView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecoverableSectionDisclosureView layoutMarginsGuide](v8, "layoutMarginsGuide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -10.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "activateConstraints:", v19);

  }
  return v8;
}

- (UITextView)disclosureView
{
  UITextView *disclosureView;
  id v4;
  UITextView *v5;
  void *v6;
  void *v7;
  UITextView *v8;

  disclosureView = self->_disclosureView;
  if (!disclosureView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEAB18]);
    v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITextView _setInteractiveTextSelectionDisabled:](v5, "_setInteractiveTextSelectionDisabled:", 1);
    -[UITextView setScrollEnabled:](v5, "setScrollEnabled:", 0);
    -[UITextView setEditable:](v5, "setEditable:", 0);
    -[UITextView setSelectable:](v5, "setSelectable:", 1);
    -[UITextView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    -[UITextView textDragInteraction](v5, "textDragInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[UITextView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[UITextView setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextView setBackgroundColor:](v5, "setBackgroundColor:", 0);
    -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextView textContainer](v5, "textContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLineBreakMode:", 0);

    v8 = self->_disclosureView;
    self->_disclosureView = v5;

    disclosureView = self->_disclosureView;
  }
  return disclosureView;
}

- (id)_disclosureAttributedText:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3778];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setAlignment:", 1);
  objc_msgSend(v6, "setLineBreakStrategy:", 2);
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v6, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v7, 0, objc_msgSend(v5, "length"));
  v8 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:value:range:", v8, v9, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (id)_recentlyDeletedDisclosureAttributedText
{
  void *v3;
  void *v4;
  void *v5;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_DISCLOSURE_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecoverableSectionDisclosureView _disclosureAttributedText:](self, "_disclosureAttributedText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_junkFilteringDisclosureAttributedText
{
  void *v3;
  void *v4;
  void *v5;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("OSCAR_DISCLOSURE_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecoverableSectionDisclosureView _disclosureAttributedText:](self, "_disclosureAttributedText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)configureForRecentlyDeleted
{
  void *v3;
  void *v4;

  -[CKRecoverableSectionDisclosureView _recentlyDeletedDisclosureAttributedText](self, "_recentlyDeletedDisclosureAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecoverableSectionDisclosureView disclosureView](self, "disclosureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v3);

  -[CKRecoverableSectionDisclosureView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)configureForJunkFiltering
{
  void *v3;
  void *v4;

  -[CKRecoverableSectionDisclosureView _junkFilteringDisclosureAttributedText](self, "_junkFilteringDisclosureAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecoverableSectionDisclosureView disclosureView](self, "disclosureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v3);

  -[CKRecoverableSectionDisclosureView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setDisclosureView:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureView, 0);
}

@end
