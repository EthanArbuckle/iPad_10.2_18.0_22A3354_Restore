@implementation CNContactViewFooterView

- (CNContactViewFooterView)init
{
  CNContactViewFooterView *v2;
  CNContactViewFooterView *v3;
  CNContactViewFooterView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactViewFooterView;
  v2 = -[CNContactViewFooterView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[CNContactViewFooterView setupSubviews](v2, "setupSubviews");
    v4 = v3;
  }

  return v3;
}

- (void)setupSubviews
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
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  -[CNContactViewFooterView setLabel:](self, "setLabel:", v3);
  -[CNContactViewFooterView updateLabelText](self, "updateLabelText");
  -[CNContactViewFooterView addSubview:](self, "addSubview:", v3);
  v15 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewFooterView layoutMarginsGuide](self, "layoutMarginsGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(v3, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewFooterView layoutMarginsGuide](self, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(v3, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewFooterView layoutMarginsGuide](self, "layoutMarginsGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 8.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (void)setContact:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[CNContact isEqual:](self->_contact, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    -[CNContactViewFooterView updateLabelText](self, "updateLabelText");
  }

}

- (void)updateLabelText
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNContactViewFooterView contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "contactType");

  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v4 == 1)
    v6 = CFSTR("ORGANIZATION_PRONUNCIATION_UPDATED_MESSAGE");
  else
    v6 = CFSTR("CONTACT_PRONUNCIATION_UPDATED_MESSAGE");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactViewFooterView label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
