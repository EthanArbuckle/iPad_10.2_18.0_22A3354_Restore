@implementation HKOrganDonationMoreAboutPrivacyViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UITextView *v9;
  UITextView *textView;
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)HKOrganDonationMoreAboutPrivacyViewController;
  -[HKOrganDonationMoreAboutPrivacyViewController viewDidLoad](&v26, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationMoreAboutPrivacyViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped_);
  -[HKOrganDonationMoreAboutPrivacyViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OD_PRIVACY_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationMoreAboutPrivacyViewController setTitle:](self, "setTitle:", v8);

  v9 = (UITextView *)objc_alloc_init(MEMORY[0x1E0DC3E50]);
  textView = self->_textView;
  self->_textView = v9;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_textView, "setSelectable:", 0);
  -[HKOrganDonationMoreAboutPrivacyViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", self->_textView);

  -[UITextView widthAnchor](self->_textView, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 308.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  -[UITextView centerXAnchor](self->_textView, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationMoreAboutPrivacyViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

  -[UITextView topAnchor](self->_textView, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationMoreAboutPrivacyViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[UITextView bottomAnchor](self->_textView, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationMoreAboutPrivacyViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HKOrganDonationMoreAboutPrivacyViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 22.0);
  v5 = v4;
  objc_msgSend(v3, "_scaledValueForValue:", 32.0);
  v7 = v6 - v5;
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setMinimumLineHeight:", v5);
  objc_msgSend(v9, "setParagraphSpacing:", v7);
  objc_msgSend(v9, "setParagraphSpacingBefore:", 0.0);
  objc_msgSend(v9, "setAlignment:", 4);
  v10 = *MEMORY[0x1E0DC1178];
  v17[0] = *MEMORY[0x1E0DC1138];
  v17[1] = v10;
  v18[0] = v3;
  v18[1] = v9;
  v17[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OD_MORE_ABOUT_PRIVACY_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithString:attributes:", v15, v12);

  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", v16);
}

- (void)viewWillAppear:(BOOL)a3
{
  UITextView *textView;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKOrganDonationMoreAboutPrivacyViewController;
  -[HKOrganDonationMoreAboutPrivacyViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  textView = self->_textView;
  -[UITextView contentInset](textView, "contentInset");
  -[UITextView setContentOffset:](textView, "setContentOffset:", 0.0, -v5);
}

- (void)doneButtonTapped:(id)a3
{
  -[HKOrganDonationMoreAboutPrivacyViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
  v9.super_class = (Class)HKOrganDonationMoreAboutPrivacyViewController;
  -[HKOrganDonationMoreAboutPrivacyViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKOrganDonationMoreAboutPrivacyViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKOrganDonationMoreAboutPrivacyViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
