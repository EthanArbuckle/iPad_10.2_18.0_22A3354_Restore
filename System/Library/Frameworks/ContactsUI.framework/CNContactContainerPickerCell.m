@implementation CNContactContainerPickerCell

- (CNContactContainerPickerCell)init
{
  CNContactContainerPickerCell *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactContainerPickerCell;
  result = -[CNContactContainerPickerCell init](&v3, sel_init);
  if (result)
    result->_allowsDeselection = 1;
  return result;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNContactContainerPickerCell;
  -[CNContactContainerPickerCell updateConfigurationUsingState:](&v15, sel_updateConfigurationUsingState_, v4);
  -[CNContactContainerPickerCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerCell contentConfiguration](self, "contentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  if ((objc_msgSend(v4, "isHighlighted") & 1) != 0)
  {
    if (!-[CNContactContainerPickerCell allowsDeselection](self, "allowsDeselection"))
      goto LABEL_7;
  }
  else
  {
    v8 = objc_msgSend(v4, "isSelected");
    if (!-[CNContactContainerPickerCell allowsDeselection](self, "allowsDeselection"))
    {
LABEL_7:
      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("link.circle.fill");
      goto LABEL_9;
    }
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v11 = CFSTR("circle");
      goto LABEL_9;
    }
  }
  v9 = 0;
  v10 = 0;
  v11 = CFSTR("checkmark.circle.fill");
LABEL_9:
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v12);

  objc_msgSend(v5, "imageProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v9);

  objc_msgSend(v5, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColor:", v10);

  -[CNContactContainerPickerCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (BOOL)allowsDeselection
{
  return self->_allowsDeselection;
}

- (void)setAllowsDeselection:(BOOL)a3
{
  self->_allowsDeselection = a3;
}

@end
