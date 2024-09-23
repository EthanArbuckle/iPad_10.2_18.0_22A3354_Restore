@implementation CNPropertySimpleEditingCell

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleEditingCell;
  -[CNPropertyEditingCell dealloc](&v4, sel_dealloc);
}

- (id)valueView
{
  UITextField *textField;
  CNTextField *v4;
  UITextField *v5;
  UITextField *v6;
  void *v7;
  double v8;
  void *v9;

  textField = self->_textField;
  if (!textField)
  {
    v4 = [CNTextField alloc];
    v5 = -[CNTextField initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_textField;
    self->_textField = v5;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", 1);
    -[UITextField setClearButtonMode:](self->_textField, "setClearButtonMode:", 1);
    -[UITextField textInputTraits](self->_textField, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReturnKeyGoesToNextResponder:", 1);

    LODWORD(v8) = 1148846080;
    -[UITextField setContentHuggingPriority:forAxis:](self->_textField, "setContentHuggingPriority:forAxis:", 1, v8);
    -[UITextField _cnui_applyContactStyle](self->_textField, "_cnui_applyContactStyle");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_textFieldChanged_, *MEMORY[0x1E0DC54D0], self->_textField);

    textField = self->_textField;
  }
  return textField;
}

- (id)constantConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v13.receiver = self;
  v13.super_class = (Class)CNPropertySimpleEditingCell;
  -[CNPropertyEditingCell constantConstraints](&v13, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertySimpleEditingCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleEditingCell valueView](self, "valueView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 16, 0, v8, 4, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  objc_msgSend(v5, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148813312;
  objc_msgSend(v10, "setPriority:", v11);

  return v5;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v23.receiver = self;
  v23.super_class = (Class)CNPropertySimpleEditingCell;
  -[CNPropertyEditingCell variableConstraints](&v23, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v7 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertySimpleEditingCell valueView](self, "valueView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CNPropertyEditingCell labelView](self, "labelView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v9, 4, 1.0, 4.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    objc_msgSend(v5, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 1148846080;
  }
  else
  {
    -[CNPropertySimpleEditingCell contentView](self, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 10, 0, v14, 10, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

    objc_msgSend(v5, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1148796928;
    objc_msgSend(v16, "setPriority:", v17);

    v18 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleEditingCell valueView](self, "valueView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertySimpleEditingCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v19, 3, 0, v20, 15, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

    objc_msgSend(v5, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    LODWORD(v13) = 1148813312;
  }
  objc_msgSend(v11, "setPriority:", v13);

  return v5;
}

- (void)updateValueWithPropertyItem:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  if ((-[UITextField isFirstResponder](self->_textField, "isFirstResponder") & 1) == 0)
  {
    if (v9)
    {
      objc_msgSend(v9, "editingStringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setText:](self->_textField, "setText:", v4);

      if ((objc_msgSend(v9, "isReadonly") & 1) != 0 || (objc_msgSend(v9, "isSuggested") & 1) != 0)
        v5 = 0;
      else
        v5 = objc_msgSend(v9, "showValueWithLabelStyle") ^ 1;
      -[UITextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", v5);
      objc_msgSend(v9, "placeholderString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextField setPlaceholder:](self->_textField, "setPlaceholder:", v6);

    }
    else
    {
      -[UITextField setText:](self->_textField, "setText:", &stru_1E20507A8);
      -[UITextField setPlaceholder:](self->_textField, "setPlaceholder:", 0);
    }
    -[UITextField _cnui_applyContactStyle](self->_textField, "_cnui_applyContactStyle");
    objc_msgSend(v9, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CNKeyboardSettings newKeyboardSettingsForProperty:](CNKeyboardSettings, "newKeyboardSettingsForProperty:", v7);

    -[UITextField setKeyboardType:](self->_textField, "setKeyboardType:", +[CNKeyboardSettings keyboardTypeFromDictionary:](CNKeyboardSettings, "keyboardTypeFromDictionary:", v8));
    -[UITextField setAutocapitalizationType:](self->_textField, "setAutocapitalizationType:", +[CNKeyboardSettings autocapitalizationTypeFromDictionary:](CNKeyboardSettings, "autocapitalizationTypeFromDictionary:", v8));
    -[UITextField setAutocorrectionType:](self->_textField, "setAutocorrectionType:", +[CNKeyboardSettings autocorrectionTypeFromDictionary:](CNKeyboardSettings, "autocorrectionTypeFromDictionary:", v8));

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[CNPropertySimpleEditingCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleEditingCell;
  -[CNContactCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (id)firstResponderItem
{
  return self->_textField;
}

- (void)textFieldChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForDisplayString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyCell:didUpdateItem:withNewValue:", self, v8, v6);

}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
