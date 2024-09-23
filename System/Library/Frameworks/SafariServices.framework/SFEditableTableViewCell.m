@implementation SFEditableTableViewCell

- (SFEditableTableViewCell)initWithEnabledState:(BOOL)a3
{
  _BOOL8 v3;
  SFEditableTableViewCell *v4;
  SFEditableTableViewCell *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SFEditableTableViewCell *v9;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFEditableTableViewCell;
  v4 = -[SFEditableTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, 1000, CFSTR("editableTableViewCell"));
  v5 = v4;
  if (v4)
  {
    -[SFEditableTableViewCell editableTextField](v4, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SFEditableTableViewCell _sf_usesLeftToRightLayout](v5, "_sf_usesLeftToRightLayout"))
      v7 = 2;
    else
      v7 = 0;
    objc_msgSend(v6, "setTextAlignment:", v7);
    objc_msgSend(v6, "setAutocapitalizationType:", 0);
    objc_msgSend(v6, "setAutocorrectionType:", 1);
    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v8);

    -[SFEditableTableViewCell setEnabled:](v5, "setEnabled:", v3);
    v9 = v5;

  }
  return v5;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFEditableTableViewCell;
  -[SFEditableTableViewCell tintColorDidChange](&v3, sel_tintColorDidChange);
  -[SFEditableTableViewCell _updateTextFieldTextColor](self, "_updateTextFieldTextColor");
}

- (void)setEnabled:(BOOL)a3
{
  id v4;

  self->_enabled = a3;
  -[SFEditableTableViewCell editableTextField](self, "editableTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", self->_enabled);
  -[SFEditableTableViewCell _updateTextFieldTextColor](self, "_updateTextFieldTextColor");

}

- (void)setOverrideEditableTextFieldTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideEditableTextFieldTextColor, a3);
  -[SFEditableTableViewCell _updateTextFieldTextColor](self, "_updateTextFieldTextColor");
}

- (void)_updateTextFieldTextColor
{
  UIColor *overrideEditableTextFieldTextColor;
  void *v4;
  id v5;

  overrideEditableTextFieldTextColor = self->_overrideEditableTextFieldTextColor;
  if (overrideEditableTextFieldTextColor)
  {
    -[SFEditableTableViewCell editableTextField](self, "editableTextField");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", overrideEditableTextFieldTextColor);
  }
  else
  {
    if (self->_enabled)
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SFEditableTableViewCell editableTextField](self, "editableTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextColor:", v5);

  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (sel_copy_ == a3)
  {
    -[SFEditableTableViewCell editableTextField](self, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "length") != 0;

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFEditableTableViewCell;
    return -[SFEditableTableViewCell canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return v4;
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[SFEditableTableViewCell editableTextField](self, "editableTextField", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFEditableTableViewCell _tableView](self, "_tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEditing");

  if (v6)
  {
    objc_msgSend(v10, "selectedTextRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v10, "textInRange:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }

  }
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safari_setSensitiveString:", v4);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SFEditableTableViewCellDelegate)delegate
{
  return (SFEditableTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)overrideEditableTextFieldTextColor
{
  return self->_overrideEditableTextFieldTextColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideEditableTextFieldTextColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
