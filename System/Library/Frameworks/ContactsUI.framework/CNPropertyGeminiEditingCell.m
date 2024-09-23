@implementation CNPropertyGeminiEditingCell

- (CNPropertyGeminiEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyGeminiEditingCell *v4;
  CNPropertyGeminiEditingCell *v5;
  void *v6;
  CNPropertyGeminiEditingCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNPropertyGeminiEditingCell;
  v4 = -[CNPropertyCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNPropertySimpleCell valueLabel](v4, "valueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    v7 = v5;
  }

  return v5;
}

- (double)minCellHeight
{
  return 44.0;
}

- (id)variableConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyGeminiEditingCell;
  -[CNLabeledCell variableConstraints](&v11, sel_variableConstraints);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0CB3718];
    -[CNPropertySimpleCell labelView](self, "labelView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGeminiEditingCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v8, 10, 1.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  void *v3;
  CNGeminiPickerController *v4;
  void *v5;
  void *v6;
  id v7;

  -[CNPropertyGeminiEditingCell geminiItem](self, "geminiItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geminiResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[CNGeminiPickerController initWithGeminiResult:]([CNGeminiPickerController alloc], "initWithGeminiResult:", v7);
  -[CNPropertyGeminiEditingCell setGeminiPicker:](self, "setGeminiPicker:", v4);
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeminiUpdateDelegate:", self);
  -[CNGeminiPickerController setDelegate:](v4, "setDelegate:", self);
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender:presentViewController:", self, v4);

}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0C97310];
  v7 = a3;
  objc_msgSend(v6, "channelStringFromSenderIdentity:", a4);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E20507A8;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  -[CNPropertyCell delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "propertyCell:didUpdateItem:withNewValue:", self, v13, v11);

  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sender:dismissViewController:", self, v7);

  -[CNPropertyGeminiEditingCell setGeminiPicker:](self, "setGeminiPicker:", 0);
}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

  -[CNPropertyGeminiEditingCell setGeminiPicker:](self, "setGeminiPicker:", 0);
}

- (void)geminiDataSourceDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNPropertyGeminiEditingCell geminiPicker](self, "geminiPicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "geminiResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGeminiResult:", v5);
}

- (CNGeminiPickerController)geminiPicker
{
  return self->_geminiPicker;
}

- (void)setGeminiPicker:(id)a3
{
  objc_storeStrong((id *)&self->_geminiPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geminiPicker, 0);
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

+ (BOOL)wantsChevron
{
  return 1;
}

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end
