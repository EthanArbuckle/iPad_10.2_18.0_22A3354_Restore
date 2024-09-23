@implementation ABPostalNameContactEditingCell

- (ABPostalNameContactEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ABPostalNameContactEditingCell *v4;
  UITextField *v5;
  UITextField *editingTextField;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ABPostalNameContactEditingCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    editingTextField = v4->_editingTextField;
    v4->_editingTextField = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_textFieldDidChange_, *MEMORY[0x1E0DC54D0], v4->_editingTextField);

    -[ABPostalNameContactEditingCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_editingTextField);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], self->_editingTextField);

  v4.receiver = self;
  v4.super_class = (Class)ABPostalNameContactEditingCell;
  -[CNContactCell dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ABPostalNameContactEditingCell;
  -[ABPostalNameContactEditingCell layoutSubviews](&v14, sel_layoutSubviews);
  -[ABPostalNameContactEditingCell contentView](self, "contentView");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  LOBYTE(v3) = -[ABPostalNameContactEditingCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[ABPostalNameContactEditingCell separatorInset](self, "separatorInset");
  if ((v3 & 1) != 0)
  {
    v12 = v11;
    -[ABPostalNameContactEditingCell separatorInset](self, "separatorInset");
    v7 = v7 - v13 + -32.0;
    v10 = v12;
  }
  -[UITextField setFrame:](self->_editingTextField, "setFrame:", v10 + 16.0, v5, v7, v9);
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPostalNameContactEditingCell;
  -[CNContactCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UITextField setText:](self->_editingTextField, "setText:", 0);
}

- (id)firstResponderItem
{
  return self->_editingTextField;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  UITextField *editingTextField;
  id v6;
  void *v7;
  UITextField *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ABPostalNameContactEditingCell;
  -[CNContactCell setCardGroupItem:](&v10, sel_setCardGroupItem_, v4);
  editingTextField = self->_editingTextField;
  v6 = v4;
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](editingTextField, "setText:", v7);

  v8 = self->_editingTextField;
  objc_msgSend(v6, "placeholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextField setPlaceholder:](v8, "setPlaceholder:", v9);
}

- (void)textFieldDidChange:(id)a3
{
  UITextField *v4;
  UITextField *editingTextField;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "object");
  v4 = (UITextField *)objc_claimAutoreleasedReturnValue();
  editingTextField = self->_editingTextField;

  if (v4 == editingTextField)
  {
    -[CNContactCell cardGroupItem](self, "cardGroupItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const char *)objc_msgSend(v10, "setter");
    -[UITextField text](self->_editingTextField, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, v7, v8);

    -[UITextField text](self->_editingTextField, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:", v9);

  }
}

- (void)_cnui_applyContactStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABPostalNameContactEditingCell;
  -[UITableViewCell _cnui_applyContactStyle](&v3, sel__cnui_applyContactStyle);
  -[UITextField _cnui_applyContactStyle](self->_editingTextField, "_cnui_applyContactStyle");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingTextField, 0);
}

@end
