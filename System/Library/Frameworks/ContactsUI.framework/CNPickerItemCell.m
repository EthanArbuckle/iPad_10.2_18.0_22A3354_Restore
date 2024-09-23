@implementation CNPickerItemCell

- (CNPickerItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPickerItemCell *v4;
  id v5;
  uint64_t v6;
  UITextField *textField;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNPickerItemCell;
  v4 = -[CNPickerItemCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3DB8]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textField = v4->_textField;
    v4->_textField = (UITextField *)v6;

    -[UITextField setAutoresizingMask:](v4->_textField, "setAutoresizingMask:", 18);
    -[UITextField setClearButtonMode:](v4->_textField, "setClearButtonMode:", 1);
    -[UITextField setHidden:](v4->_textField, "setHidden:", 1);
    -[UITextField _cnui_applyContactStyle](v4->_textField, "_cnui_applyContactStyle");
    objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v4->_textField, "setFont:", v8);

    -[CNPickerItemCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_textField);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNPickerItemCell;
  -[CNPickerItemCell layoutSubviews](&v13, sel_layoutSubviews);
  -[CNPickerItemCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CNPickerItemCell textField](self, "textField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPickerItemCell;
  -[CNPickerItemCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CNPickerItemCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", &stru_1E20507A8);

  -[CNPickerItemCell setTextFieldHidden:](self, "setTextFieldHidden:", 1);
}

- (void)beginEditing
{
  id v3;

  -[CNPickerItemCell setTextFieldHidden:](self, "setTextFieldHidden:", 0);
  -[CNPickerItemCell textField](self, "textField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)endEditing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNPickerItemCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerItemCell setTextFieldHidden:](self, "setTextFieldHidden:", objc_msgSend(v4, "length") == 0);

  -[CNPickerItemCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isFirstResponder");

  if ((_DWORD)v4)
  {
    -[CNPickerItemCell textField](self, "textField");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
}

- (void)setTextFieldHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[CNPickerItemCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[CNPickerItemCell textLabel](self, "textLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3 ^ 1);

}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
