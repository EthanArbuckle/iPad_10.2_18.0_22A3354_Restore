@implementation CNAutocompleteSuggestionsViewSectionHeader

+ (id)reuseIdentifier
{
  return CFSTR("CNAutocompleteSuggestionsViewSectionHeader");
}

+ (id)preferredFontForTitleLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
}

+ (id)preferredColorForTitleLabel
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

- (CNAutocompleteSuggestionsViewSectionHeader)initWithFrame:(CGRect)a3
{
  CNAutocompleteSuggestionsViewSectionHeader *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  CNAutocompleteSuggestionsViewSectionHeader *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteSuggestionsViewSectionHeader;
  v3 = -[CNAutocompleteSuggestionsViewSectionHeader initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    objc_msgSend((id)objc_opt_class(), "preferredColorForTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v6);

    objc_msgSend((id)objc_opt_class(), "preferredFontForTitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_titleLabel, "setFont:", v7);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[CNAutocompleteSuggestionsViewSectionHeader addSubview:](v3, "addSubview:", v3->_titleLabel);
    -[CNAutocompleteSuggestionsViewSectionHeader setupConstraints](v3, "setupConstraints");
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
  -[CNAutocompleteSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewSectionHeader topAnchor](self, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, 15.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewSectionHeader layoutMarginsGuide](self, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v19, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  -[CNAutocompleteSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewSectionHeader layoutMarginsGuide](self, "layoutMarginsGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  v23[2] = v17;
  -[CNAutocompleteSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsViewSectionHeader bottomAnchor](self, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, 5.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v15);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSuggestionsViewSectionHeader;
  -[CNAutocompleteSuggestionsViewSectionHeader prepareForReuse](&v4, sel_prepareForReuse);
  -[CNAutocompleteSuggestionsViewSectionHeader titleLabel](self, "titleLabel");
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

@end
