@implementation CNPropertyAlertCell

- (CNPropertyAlertCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CNPropertyAlertCell *v4;
  CNPropertyAlertCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNPropertyAlertCell;
  v4 = -[CNPropertyCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CNPropertySimpleCell valueLabel](v4, "valueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

  }
  return v5;
}

- (id)alertGroup
{
  void *v2;
  void *v3;

  -[CNPropertyCell propertyItem](self, "propertyItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCardGroupItem:(id)a3
{
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPropertyAlertCell;
  -[CNPropertyCell setCardGroupItem:](&v7, sel_setCardGroupItem_);
  if (a3)
  {
    -[CNPropertyAlertCell alertGroup](self, "alertGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsDisplayModePickerActions");

    if (v6)
      -[CNLabeledCell addChevron](self, "addChevron");
    else
      -[CNLabeledCell removeChevron](self, "removeChevron");
  }
}

- (BOOL)allowsCellSelection
{
  void *v2;
  char v3;

  -[CNPropertyAlertCell alertGroup](self, "alertGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsDisplayModePickerActions");

  return v3;
}

- (BOOL)shouldPerformDefaultAction
{
  return 1;
}

- (void)performDefaultAction
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CNTonePickerController *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C96680]);

  if (v9)
    v10 = 1;
  else
    v10 = 2;
  -[CNPropertyAlertCell alertItem](self, "alertItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "labeledValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "value");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v13 = -[CNTonePickerController initWithAlertType:activityAlert:]([CNTonePickerController alloc], "initWithAlertType:activityAlert:", v10, v15);
  -[CNTonePickerController setDelegate:](v13, "setDelegate:", self);
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sender:presentViewController:", self, v13);

}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  -[CNPropertyCell delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyCell propertyItem](self, "propertyItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyCell:didUpdateItem:withNewValue:", self, v9, v6);

  if ((-[CNPropertyAlertCell isEditing](self, "isEditing") & 1) == 0)
  {
    -[CNPropertyCell propertyItem](self, "propertyItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveChangesImmediately:", 1);

  }
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender:dismissViewController:", self, v7);

}

- (void)pickerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPropertyCell presentingDelegate](self, "presentingDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

}

+ (BOOL)wantsChevron
{
  return 1;
}

+ (BOOL)shouldIndentWhileEditing
{
  return 0;
}

@end
