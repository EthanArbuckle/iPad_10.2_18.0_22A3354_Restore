@implementation AXUISettingsEditableTextCell

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (AXUISettingsEditableTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7;
  AXUISettingsEditableTextCell *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXUISettingsEditableTextCell;
  v7 = a5;
  v8 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v7);
  -[PSTableCell setSpecifier:](v8, "setSpecifier:", v7, v10.receiver, v10.super_class);

  if (v8)
    -[AXUISettingsEditableTextCell initializeView](v8, "initializeView");
  return v8;
}

- (void)markNameTextFieldAccessible
{
  -[UITextField setIsAccessibilityElement:](self->_nameTextField, "setIsAccessibilityElement:", 1);
  -[UITextField setAccessibilityRespondsToUserInteraction:](self->_nameTextField, "setAccessibilityRespondsToUserInteraction:", 1);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsEditableTextCell;
  -[AXUISettingsEditableTextCell _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[AXUISettingsEditableTextCell markNameTextFieldAccessible](self, "markNameTextFieldAccessible");
}

- (void)initializeView
{
  UITextField *v3;
  UITextField *nameTextField;
  UITextField *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
  nameTextField = self->_nameTextField;
  self->_nameTextField = v3;

  -[UITextField setDelegate:](self->_nameTextField, "setDelegate:", self);
  -[UITextField setReturnKeyType:](self->_nameTextField, "setReturnKeyType:", 9);
  v5 = self->_nameTextField;
  -[PSTableCell specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell textFieldValue:](self, "textFieldValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](v5, "setText:", v7);

  -[AXUISettingsEditableTextCell markNameTextFieldAccessible](self, "markNameTextFieldAccessible");
  -[PSTableCell specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("ShouldDisableTextFieldWhenNotEditing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell setShouldDisableTextFieldWhenNotEditing:](self, "setShouldDisableTextFieldWhenNotEditing:", objc_msgSend(v9, "BOOLValue"));

  if (-[AXUISettingsEditableTextCell shouldDisableTextFieldWhenNotEditing](self, "shouldDisableTextFieldWhenNotEditing"))
  {
    -[UITextField setEnabled:](self->_nameTextField, "setEnabled:", 0);
  }
  -[PSTableCell specifier](self, "specifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForKey:", CFSTR("ShouldAllowSelection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell setShouldAllowSelection:](self, "setShouldAllowSelection:", objc_msgSend(v11, "BOOLValue"));

  if (-[AXUISettingsEditableTextCell shouldAllowSelection](self, "shouldAllowSelection"))
  {
    -[AXUISettingsEditableTextCell setAccessoryType:](self, "setAccessoryType:", 1);
    -[AXUISettingsEditableTextCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
  }
  else
  {
    -[AXUISettingsEditableTextCell setSelectionStyle:](self, "setSelectionStyle:", 0);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsEditableTextCell;
  -[AXUISettingsEditableTextCell setEditing:animated:](&v6, sel_setEditing_animated_, a3, a4);
  if (-[AXUISettingsEditableTextCell shouldDisableTextFieldWhenNotEditing](self, "shouldDisableTextFieldWhenNotEditing"))
  {
    -[UITextField setEnabled:](self->_nameTextField, "setEnabled:", v4);
    if (!v4)
      -[UITextField resignFirstResponder](self->_nameTextField, "resignFirstResponder");
  }
}

- (void)setSelectionStyle:(int64_t)a3
{
  objc_super v5;

  if (!-[AXUISettingsEditableTextCell shouldAllowSelection](self, "shouldAllowSelection"))
  {
    v5.receiver = self;
    v5.super_class = (Class)AXUISettingsEditableTextCell;
    -[AXUISettingsEditableTextCell setSelectionStyle:](&v5, sel_setSelectionStyle_, a3);
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITextField *nameTextField;
  void *v8;
  UITextField *v9;
  void *v10;
  UITextField *v11;
  UITextField *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXUISettingsEditableTextCell;
  -[PSTableCell layoutSubviews](&v15, sel_layoutSubviews);
  -[AXUISettingsEditableTextCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
    objc_msgSend(v4, "removeFromSuperview");
  -[UITextField superview](self->_nameTextField, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v3)
    objc_msgSend(v3, "addSubview:", self->_nameTextField);
  nameTextField = self->_nameTextField;
  objc_msgSend(v3, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setBackgroundColor:](nameTextField, "setBackgroundColor:", v8);

  v9 = self->_nameTextField;
  objc_msgSend(v4, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setFont:](v9, "setFont:", v10);

  v11 = self->_nameTextField;
  objc_msgSend(v4, "frame");
  -[UITextField setFrame:](v11, "setFrame:");
  v12 = self->_nameTextField;
  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](v12, "setTextColor:", v14);

}

- (void)updateText
{
  void *v3;
  id v4;

  -[PSTableCell specifier](self, "specifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXUISettingsEditableTextCell textFieldValue:](self, "textFieldValue:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_nameTextField, "setText:", v3);

}

- (id)textFieldValue:(id)a3
{
  char *v3;
  char *v4;
  void *v5;
  int *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (char *)a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int *)MEMORY[0x1E0D805C0];
    if (!v5 || (v7 = *(_QWORD *)&v4[*MEMORY[0x1E0D805C0]], v5, !v7))
      _AXAssert();
    objc_msgSend(v4, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performSelector:withObject:", *(_QWORD *)&v4[*v6], v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setTextFieldValue:(id)a3 specifier:(id)a4
{
  char *v5;
  char *v6;
  void *v7;
  int *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (char *)a4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (int *)MEMORY[0x1E0D805C8];
    if (!v7 || (v9 = *(_QWORD *)&v6[*MEMORY[0x1E0D805C8]], v7, !v9))
      _AXAssert();
    objc_msgSend(v6, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performSelector:withObject:withObject:", *(_QWORD *)&v6[*v8], v11, v6);

  }
  else
  {
    _AXAssert();
  }

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (self->_nameTextField == a3)
    objc_msgSend(a3, "resignFirstResponder");
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[UITextField text](self->_nameTextField, "text", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSTableCell specifier](self, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXUISettingsEditableTextCell textFieldValue:](self, "textFieldValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v7);

    if ((v6 & 1) == 0)
      -[AXUISettingsEditableTextCell setTextFieldValue:specifier:](self, "setTextFieldValue:specifier:", v7, v4);
  }

}

- (UITextField)nameTextField
{
  return self->_nameTextField;
}

- (void)setNameTextField:(id)a3
{
  objc_storeStrong((id *)&self->_nameTextField, a3);
}

- (BOOL)shouldDisableTextFieldWhenNotEditing
{
  return self->_shouldDisableTextFieldWhenNotEditing;
}

- (void)setShouldDisableTextFieldWhenNotEditing:(BOOL)a3
{
  self->_shouldDisableTextFieldWhenNotEditing = a3;
}

- (BOOL)shouldAllowSelection
{
  return self->_shouldAllowSelection;
}

- (void)setShouldAllowSelection:(BOOL)a3
{
  self->_shouldAllowSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameTextField, 0);
}

@end
