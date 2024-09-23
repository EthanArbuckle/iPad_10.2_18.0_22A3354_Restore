@implementation CNContactListPrivacyTitleView

- (CNContactListPrivacyTitleView)initWithTitle:(id)a3 hasIcon:(BOOL)a4
{
  id v7;
  CNContactListPrivacyTitleView *v8;
  CNContactListPrivacyTitleView *v9;
  CNContactListPrivacyTitleView *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactListPrivacyTitleView;
  v8 = -[CNContactListPrivacyTitleView init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    v9->_hasIcon = a4;
    -[CNContactListPrivacyTitleView _setupTitleLabel](v9, "_setupTitleLabel");
    v10 = v9;
  }

  return v9;
}

- (void)setTitle:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[CNContactListPrivacyTitleView _updateTitleLabel](self, "_updateTitleLabel");
    v5 = v6;
  }

}

- (void)setHasIcon:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (self->_hasIcon != a3)
  {
    self->_hasIcon = a3;
    v4 = (void *)MEMORY[0x1E0DC3F10];
    -[CNContactListPrivacyTitleView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__CNContactListPrivacyTitleView_setHasIcon___block_invoke;
    v6[3] = &unk_1E204F648;
    v6[4] = self;
    objc_msgSend(v4, "transitionWithView:duration:options:animations:completion:", v5, 5308544, v6, 0, 0.25);

  }
}

- (void)_setupTitleLabel
{
  UILabel *v3;
  UILabel *titleLabel;
  UILabel *v5;
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
  id v19;

  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;
  v5 = v3;

  -[UILabel font](v5, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fontDescriptorWithSymbolicTraits:", 2);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v19, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v8);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNContactListPrivacyTitleView _updateTitleLabel](self, "_updateTitleLabel");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel widthAnchor](v5, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListPrivacyTitleView widthAnchor](self, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  -[UILabel centerXAnchor](v5, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListPrivacyTitleView centerXAnchor](self, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v15);

  -[UILabel centerYAnchor](v5, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListPrivacyTitleView centerYAnchor](self, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v18);

  -[CNContactListPrivacyTitleView addConstraints:](self, "addConstraints:", v9);
  -[CNContactListPrivacyTitleView addSubview:](self, "addSubview:", v5);

}

- (void)_updateTitleLabel
{
  uint64_t v3;
  id v4;

  if (-[CNContactListPrivacyTitleView hasIcon](self, "hasIcon"))
  {
    -[CNContactListPrivacyTitleView _titleTextWithIcon:](self, "_titleTextWithIcon:", self->_title);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", self->_title);
  }
  v4 = (id)v3;
  -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v3);

}

- (id)_titleTextWithIcon:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0DC3888];
  v4 = a3;
  objc_msgSend(v3, "configurationWithPointSize:", 24.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationWithPaletteColors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configurationByApplyingConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("hand.raised.square.fill"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v13);

  v14 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v15 = (void *)MEMORY[0x1E0CB3498];
  v22 = *MEMORY[0x1E0DC1108];
  v23 = &unk_1E20D2D28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributedStringWithAttachment:attributes:", v12, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendAttributedString:", v17);

  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v18, "initWithString:", v19);
  objc_msgSend(v14, "appendAttributedString:", v20);

  return v14;
}

- (BOOL)hasIcon
{
  return self->_hasIcon;
}

- (NSString)title
{
  return self->_title;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

uint64_t __44__CNContactListPrivacyTitleView_setHasIcon___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTitleLabel");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

@end
