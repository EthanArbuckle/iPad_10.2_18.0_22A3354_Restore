@implementation CNPropertyPostalAddressEditingCell

- (id)variableConstraints
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
  objc_super v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v15.receiver = self;
  v15.super_class = (Class)CNPropertyPostalAddressEditingCell;
  -[CNPropertyEditingCell variableConstraints](&v15, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = CFSTR("labelButton");
  -[CNPropertyEditingCell labelButton](self, "labelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("addressEditor");
  v17[0] = v6;
  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[labelButton]-0-[addressEditor]-0-|"), 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[addressEditor]-0-|"), 0, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    v11 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertyEditingCell labelButton](self, "labelButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyPostalAddressEditingCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 10, 0, v12, 10, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  return v5;
}

- (double)leftValueMargin
{
  return 0.0;
}

- (CNPostalAddressEditorView)addressEditor
{
  CNPostalAddressEditorView *addressEditor;
  CNPostalAddressEditorView *v4;
  CNPostalAddressEditorView *v5;
  CNPostalAddressEditorView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;

  addressEditor = self->_addressEditor;
  if (!addressEditor)
  {
    v4 = [CNPostalAddressEditorView alloc];
    v5 = -[CNPostalAddressEditorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_addressEditor;
    self->_addressEditor = v5;

    -[CNPostalAddressEditorView setTranslatesAutoresizingMaskIntoConstraints:](self->_addressEditor, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNPostalAddressEditorView addTarget:action:forControlEvents:](self->_addressEditor, "addTarget:action:forControlEvents:", self, sel_valueChanged_, 4096);
    -[CNPostalAddressEditorView addTarget:action:forControlEvents:](self->_addressEditor, "addTarget:action:forControlEvents:", self, sel_layoutChanged_, 0x1000000);
    -[CNPropertyPostalAddressEditingCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_addressEditor);

    -[CNPropertyCell propertyItem](self, "propertyItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labeledValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPostalAddressEditorView setAddress:](self->_addressEditor, "setAddress:", v10);

    v11 = -[CNPostalAddressEditorView lineCount](self->_addressEditor, "lineCount");
    -[CNPropertyEditingCell vseparator](self, "vseparator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLineCount:", v11);

    addressEditor = self->_addressEditor;
  }
  return addressEditor;
}

- (void)setPresentingDelegate:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPropertyPostalAddressEditingCell;
  v4 = a3;
  -[CNPropertyCell setPresentingDelegate:](&v6, sel_setPresentingDelegate_, v4);
  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)updateWithPropertyItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNPropertyPostalAddressEditingCell;
  -[CNPropertyEditingCell updateWithPropertyItem:](&v12, sel_updateWithPropertyItem_, v4);
  objc_msgSend(v4, "labeledValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAddress:", v6);

  if ((objc_msgSend(v4, "isReadonly") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v4, "isSuggested") ^ 1;
  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v8);

  v10 = -[CNPostalAddressEditorView lineCount](self->_addressEditor, "lineCount");
  -[CNPropertyEditingCell vseparator](self, "vseparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineCount:", v10);

}

- (void)valueChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateLabeledValueWithValue:", v6);

  -[CNPropertyCell delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "propertyCell:didUpdateItem:withNewValue:", self, v7, v8);
}

- (void)layoutChanged:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[CNPropertyCell delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyCellDidChangeLayout:", self);

  v6 = objc_msgSend(v4, "lineCount");
  -[CNPropertyEditingCell vseparator](self, "vseparator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineCount:", v6);

}

- (void)setEditorSeparatorColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorColor:", v4);

}

- (UIColor)editorSeparatorColor
{
  void *v2;
  void *v3;

  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPropertyPostalAddressEditingCell;
  v4 = a3;
  -[CNPropertyPostalAddressEditingCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[CNPropertyPostalAddressEditingCell addressEditor](self, "addressEditor", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  -[CNPropertyPostalAddressEditingCell layoutMargins](self, "layoutMargins");
  -[CNPostalAddressEditorView setLayoutMargins:](self->_addressEditor, "setLayoutMargins:");
  v3.receiver = self;
  v3.super_class = (Class)CNPropertyPostalAddressEditingCell;
  -[CNPropertyPostalAddressEditingCell layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
}

- (void)setAddressEditor:(id)a3
{
  objc_storeStrong((id *)&self->_addressEditor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressEditor, 0);
}

@end
