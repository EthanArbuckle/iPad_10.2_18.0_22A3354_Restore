@implementation CNPropertyNameCell

- (CNPropertyNameCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyNameCell *v4;
  CNPropertyNameCell *v5;
  CNTextField *v6;
  uint64_t v7;
  UITextField *textField;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CNPropertyNameCell;
  v4 = -[CNContactCell initWithStyle:reuseIdentifier:](&v25, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNContactCell setShowSeparator:](v4, "setShowSeparator:", 0);
    v6 = [CNTextField alloc];
    v7 = -[CNTextField initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    textField = v5->_textField;
    v5->_textField = (UITextField *)v7;

    -[CNPropertyNameCell textField](v5, "textField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[CNPropertyNameCell textField](v5, "textField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAutocapitalizationType:", 0);

    -[CNPropertyNameCell textField](v5, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutocorrectionType:", 1);

    -[CNPropertyNameCell textField](v5, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClearButtonMode:", 1);

    -[CNPropertyNameCell textField](v5, "textField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textInputTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setReturnKeyGoesToNextResponder:", 1);

    -[CNPropertyNameCell textField](v5, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1148846080;
    objc_msgSend(v15, "setContentHuggingPriority:forAxis:", 1, v16);

    -[CNPropertyNameCell textField](v5, "textField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_cnui_applyContactStyle");

    -[CNPropertyNameCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyNameCell textField](v5, "textField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

    -[CNPropertyNameCell setNeedsUpdateConstraints](v5, "setNeedsUpdateConstraints");
    v5->_firstResponderItem = &v5->_textField->super.super.super;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0DC54D0];
    -[CNPropertyNameCell textField](v5, "textField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, sel_textFieldChanged_, v21, v22);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v5, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyNameCell;
  -[CNContactCell dealloc](&v4, sel_dealloc);
}

- (void)textFieldChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "object");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell propertyItem](self, "propertyItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForDisplayString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "markedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || objc_msgSend(v7, "isEmpty"))
  {
    -[CNPropertyNameCell propertyItem](self, "propertyItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateLabeledValueWithValue:", v6);

    -[CNPropertyNameCell delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyNameCell propertyItem](self, "propertyItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyCell:didUpdateItem:withNewValue:", self, v11, v6);

  }
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
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  objc_super v37;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v37.receiver = self;
  v37.super_class = (Class)CNPropertyNameCell;
  -[CNContactCell constantConstraints](&v37, sel_constantConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyNameCell textField](self, "textField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v8, 10, 1.0, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v9);

  objc_msgSend(v5, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1148796928;
  objc_msgSend(v10, "setPriority:", v11);

  v12 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyNameCell textField](self, "textField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 5, 0, v14, 17, 1.0, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyNameCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell textField](self, "textField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 18, 0, v18, 6, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyNameCell textField](self, "textField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 6, 0, v22, 18, 1.0, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v23);

  v24 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyNameCell textField](self, "textField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 3, 0, v26, 15, 1.0, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v27);

  objc_msgSend(v5, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 1148813312;
  objc_msgSend(v28, "setPriority:", v29);

  v30 = (void *)MEMORY[0x1E0CB3718];
  -[CNPropertyNameCell textField](self, "textField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyNameCell contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, 4, 0, v32, 16, 1.0, 0.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v33);

  objc_msgSend(v5, "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = 1148813312;
  objc_msgSend(v34, "setPriority:", v35);

  return v5;
}

- (void)setCardGroupItem:(id)a3
{
  id v4;
  id v5;
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
  id v17;
  int64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  int64_t v22;
  void *v23;
  objc_super v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CNPropertyNameCell;
  -[CNContactCell cardGroupItem](&v25, sel_cardGroupItem);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)CNPropertyNameCell;
    -[CNContactCell setCardGroupItem:](&v24, sel_setCardGroupItem_, v4);
    -[CNPropertyNameCell propertyItem](self, "propertyItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNPropertyNameCell placeholderString](self, "placeholderString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyNameCell textField](self, "textField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPlaceholder:", v7);

      -[CNPropertyNameCell propertyItem](self, "propertyItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "labeledValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyNameCell displayStringForValue:](self, "displayStringForValue:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPropertyNameCell textField](self, "textField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);

    }
    else
    {
      -[CNPropertyNameCell textField](self, "textField");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", &stru_1E20507A8);

      -[CNPropertyNameCell textField](self, "textField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPlaceholder:", 0);
    }

    -[CNPropertyNameCell textField](self, "textField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cnui_applyContactStyle");

    objc_msgSend(v4, "property");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = +[CNKeyboardSettings newKeyboardSettingsForProperty:](CNKeyboardSettings, "newKeyboardSettingsForProperty:", v16);

    v18 = +[CNKeyboardSettings keyboardTypeFromDictionary:](CNKeyboardSettings, "keyboardTypeFromDictionary:", v17);
    -[CNPropertyNameCell textField](self, "textField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setKeyboardType:", v18);

    v20 = +[CNKeyboardSettings autocapitalizationTypeFromDictionary:](CNKeyboardSettings, "autocapitalizationTypeFromDictionary:", v17);
    -[CNPropertyNameCell textField](self, "textField");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAutocapitalizationType:", v20);

    v22 = +[CNKeyboardSettings autocorrectionTypeFromDictionary:](CNKeyboardSettings, "autocorrectionTypeFromDictionary:", v17);
    -[CNPropertyNameCell textField](self, "textField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAutocorrectionType:", v22);

  }
}

- (id)placeholderString
{
  void *v2;
  void *v3;

  -[CNPropertyNameCell propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)displayStringForValue:(id)a3
{
  return a3;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  -[CNPropertyNameCell traitCollection](self, "traitCollection", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 2 * (objc_msgSend(v6, "layoutDirection") == 1);
  -[CNPropertyNameCell textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextAlignment:", v4);

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyNameCell;
  v4 = a3;
  -[CNPropertyNameCell setBackgroundColor:](&v7, sel_setBackgroundColor_, v4);
  -[CNPropertyNameCell textField](self, "textField", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[CNPropertyNameCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  -[CNPropertyNameCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (double)minCellHeight
{
  return 44.0;
}

- (UITextField)textField
{
  return self->_textField;
}

- (UIResponder)firstResponderItem
{
  return self->_firstResponderItem;
}

- (CNPropertyCellDelegate)delegate
{
  return (CNPropertyCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textField, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
