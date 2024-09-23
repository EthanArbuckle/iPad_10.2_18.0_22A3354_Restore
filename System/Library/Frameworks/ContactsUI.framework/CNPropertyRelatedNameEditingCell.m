@implementation CNPropertyRelatedNameEditingCell

- (CNPropertyRelatedNameEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyRelatedNameEditingCell *v4;
  CNPropertyRelatedNameEditingCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyRelatedNameEditingCell;
  v4 = -[CNPropertyEditingCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[CNPropertyRelatedNameEditingCell setEditingAccessoryType:](v4, "setEditingAccessoryType:", 2);
  return v5;
}

- (void)performAccessoryAction
{
  void *v3;
  void *v4;
  CNContactPickerViewController *v5;

  v5 = objc_alloc_init(CNContactPickerViewController);
  -[CNContactPickerViewController setDelegate:](v5, "setDelegate:", self);
  -[CNContactPickerViewController setMode:](v5, "setMode:", 2);
  -[CNPropertySimpleEditingCell textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sender:presentViewController:", self, v5);

}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__CNPropertyRelatedNameEditingCell_contactPickerDidCancel___block_invoke;
  v6[3] = &unk_1E204F648;
  v6[4] = self;
  objc_msgSend(v5, "sender:dismissViewController:completionHandler:", self, v4, v6);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v6 = (void *)MEMORY[0x1E0C97218];
  v7 = a3;
  objc_msgSend(v6, "stringFromContact:style:", a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForDisplayString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPropertyCell delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertyCell:didUpdateItem:withNewValue:", self, v12, v10);

  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__CNPropertyRelatedNameEditingCell_contactPicker_didSelectContact___block_invoke;
  v14[3] = &unk_1E204F648;
  v14[4] = self;
  objc_msgSend(v13, "sender:dismissViewController:completionHandler:", self, v7, v14);

}

uint64_t __67__CNPropertyRelatedNameEditingCell_contactPicker_didSelectContact___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

uint64_t __59__CNPropertyRelatedNameEditingCell_contactPickerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "regainFocus");
}

@end
