@implementation CNContactSuggestionsViewSectionHeader

- (CNContactSuggestionsViewSectionHeader)initWithFrame:(CGRect)a3
{
  CNContactSuggestionsViewSectionHeader *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  CNContactSuggestionsViewSectionHeader *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionsViewSectionHeader;
  v3 = -[CNContactSuggestionsViewSectionHeader initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    +[CNUIColorRepository contactSuggestionsTextLabelColor](CNUIColorRepository, "contactSuggestionsTextLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v6);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[CNUIFontRepository contactSuggestionsHeaderTitleFont](CNUIFontRepository, "contactSuggestionsHeaderTitleFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[CNContactSuggestionsViewSectionHeader addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[CNContactSuggestionsViewSectionHeader setupConstraints](v3, "setupConstraints");
    v8 = v3;
  }

  return v3;
}

- (void)setupConstraints
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
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[CNContactSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewSectionHeader layoutMarginsGuide](self, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  -[CNContactSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewSectionHeader layoutMarginsGuide](self, "layoutMarginsGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  -[CNContactSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewSectionHeader topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 15.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  -[CNContactSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactSuggestionsViewSectionHeader bottomAnchor](self, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -5.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactSuggestionsViewSectionHeader;
  -[CNContactSuggestionsViewSectionHeader prepareForReuse](&v4, sel_prepareForReuse);
  -[CNContactSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("CNContactSuggestionsViewSectionHeader");
}

@end
