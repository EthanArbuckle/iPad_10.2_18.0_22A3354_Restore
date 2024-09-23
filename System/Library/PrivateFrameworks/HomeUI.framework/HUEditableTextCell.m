@implementation HUEditableTextCell

- (HUEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUEditableTextCell *v4;
  id v5;
  uint64_t v6;
  UITextField *textField;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUEditableTextCell;
  v4 = -[HUEditableTextCell initWithStyle:reuseIdentifier:](&v32, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEAAD0]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v4->_textField, "setFont:", v8);

    -[UITextField setAdjustsFontForContentSizeCategory:](v4->_textField, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setReturnKeyType:](v4->_textField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v4->_textField, "setClearButtonMode:", 3);
    -[HUEditableTextCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_textField);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v4->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField topAnchor](v4->_textField, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layoutMarginsGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

    -[UITextField bottomAnchor](v4->_textField, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

    -[UITextField leadingAnchor](v4->_textField, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v25);

    -[UITextField trailingAnchor](v4->_textField, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUEditableTextCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUEditableTextCell;
  -[HUEditableTextCell setSelected:animated:](&v7, sel_setSelected_animated_, a3, a4);
  if (v4)
  {
    -[HUEditableTextCell textField](self, "textField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = !a3;
  -[HUEditableTextCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  if (v4)
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUEditableTextCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

  -[HUEditableTextCell textField](self, "textField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClearButtonMode:", v4);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUEditableTextCell;
  -[HUEditableTextCell prepareForReuse](&v8, sel_prepareForReuse);
  -[HUEditableTextCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[HUEditableTextCell textField](self, "textField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", 0);

  -[HUEditableTextCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[HUEditableTextCell textField](self, "textField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[HUEditableTextCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endEditing:", 1);

}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
