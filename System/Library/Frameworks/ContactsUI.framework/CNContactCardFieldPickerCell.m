@implementation CNContactCardFieldPickerCell

- (CNContactCardFieldPickerCell)init
{
  CNContactCardFieldPickerCell *v2;
  CNContactCardFieldPickerCell *v3;
  CNContactCardFieldPickerCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNContactCardFieldPickerCell;
  v2 = -[CNContactCardFieldPickerCell init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_displaysValue = 1;
    v4 = v2;
  }

  return v3;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactCardFieldPickerCell;
  -[CNContactCardFieldPickerCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[CNContactCardFieldPickerCell setConfiguration](self, "setConfiguration");
}

- (void)setConfiguration
{
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNContactCardFieldPickerCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CNContactCardFieldPickerCell isSelected](self, "isSelected"))
    v3 = CFSTR("checkmark.circle.fill");
  else
    v3 = CFSTR("circle");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v4);

  -[CNContactCardFieldPickerCell attributedDisplayText](self, "attributedDisplayText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

  -[CNContactCardFieldPickerCell setContentConfiguration:](self, "setContentConfiguration:", v6);
}

- (id)attributedDisplayText
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC1140];
  v31[0] = *MEMORY[0x1E0DC1138];
  v31[1] = v6;
  v32[0] = v4;
  v32[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D13850];
  -[CNContactCardFieldPickerCell item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v10);

  if ((v11 & 1) == 0)
  {
    CNUILogContactCard();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
LABEL_6:
    -[CNContactCardFieldPickerCell item](self, "item");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543362;
    v30 = v24;
    _os_log_error_impl(&dword_18AC56000, v18, OS_LOG_TYPE_ERROR, "Contact card field picker failed to display item %{public}@", (uint8_t *)&v29, 0xCu);

    goto LABEL_9;
  }
  if (!-[CNContactCardFieldPickerCell displaysValue](self, "displaysValue"))
  {
    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[CNContactCardFieldPickerCell item](self, "item");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v25, "initWithString:attributes:", v27, MEMORY[0x1E0C9AA70]);

    objc_msgSend(v3, "appendAttributedString:", v18);
    goto LABEL_9;
  }
  -[CNContactCardFieldPickerCell item](self, "item");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v13);

  if ((v14 & 1) == 0)
  {
    CNUILogContactCard();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    goto LABEL_6;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[CNContactCardFieldPickerCell item](self, "item");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "initWithString:attributes:", v17, v7);

  objc_msgSend(v3, "appendAttributedString:", v18);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v7);
  objc_msgSend(v3, "appendAttributedString:", v19);
  v20 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[CNContactCardFieldPickerCell item](self, "item");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "displayValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithString:attributes:", v22, MEMORY[0x1E0C9AA70]);

  objc_msgSend(v3, "appendAttributedString:", v23);
LABEL_9:

  return v3;
}

- (BOOL)displaysValue
{
  return self->_displaysValue;
}

- (void)setDisplaysValue:(BOOL)a3
{
  self->_displaysValue = a3;
}

- (CNContactCardFieldItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

+ (double)estimatedHeightDisplayingValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v7 = ceil(v6);
  objc_msgSend(v5, "directionalLayoutMargins");
  v9 = v7 + v8;
  objc_msgSend(v5, "directionalLayoutMargins");
  v11 = v9 + v10;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    v11 = v11 + ceil(v13);

  }
  return v11;
}

@end
