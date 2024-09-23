@implementation HKSimpleDataEntryPlainTextItem

- (HKSimpleDataEntryPlainTextItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 defaultText:(id)a5 intention:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  HKSimpleDataEntryPlainTextItem *v14;
  HKSimpleDataEntryPlainTextItem *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKSimpleDataEntryPlainTextItem;
  v14 = -[HKSimpleDataEntryPlainTextItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_title, a3);
    objc_storeStrong((id *)&v15->_registrantModelKey, a4);
    objc_storeStrong((id *)&v15->_text, a5);
    v15->_intention = a6;
  }

  return v15;
}

- (id)formattedKeyAndValue
{
  const __CFString *text;
  NSString *registrantModelKey;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_text)
    text = (const __CFString *)self->_text;
  else
    text = &stru_1E9C4C428;
  registrantModelKey = self->_registrantModelKey;
  v5[0] = text;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &registrantModelKey, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cell
{
  HKSimpleDataEntryPlainTextCell *cell;
  HKSimpleDataEntryPlainTextCell *v4;
  HKSimpleDataEntryPlainTextCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  cell = self->_cell;
  if (!cell)
  {
    v4 = -[HKSimpleDataEntryPlainTextCell initWithIntention:reuseIdentifier:]([HKSimpleDataEntryPlainTextCell alloc], "initWithIntention:reuseIdentifier:", self->_intention, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKSimpleDataEntryPlainTextCell titleLabel](self->_cell, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_title);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", self->_text);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

    -[HKSimpleDataEntryPlainTextCell setDelegate:](self->_cell, "setDelegate:", self);
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryItem accessoryToolbar](self, "accessoryToolbar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputAccessoryView:", v11);

    v12 = -[HKSimpleDataEntryItem placeholderType](self, "placeholderType");
    if (v12 == 1)
    {
      -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_REQUIRED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0DC1140];
      HKHealthKeyColor();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v19);
      objc_msgSend(v13, "setAttributedPlaceholder:", v20);

    }
    else
    {
      if (v12)
      {
LABEL_7:
        -[HKSimpleDataEntryPlainTextItem updateCellDisplay](self, "updateCellDisplay");
        cell = self->_cell;
        return cell;
      }
      -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_OPTIONAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPlaceholder:", v15);

    }
    goto LABEL_7;
  }
  return cell;
}

- (void)updateCellDisplay
{
  id v3;

  -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", self->_text);

}

- (void)doneButtonTapped:(id)a3
{
  id v3;

  -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)textFieldDidChangeValue:(id)a3 forCell:(id)a4
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *text;
  void *v9;
  id v10;

  v10 = a3;
  -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (v5 == v10)
  {
    objc_msgSend(v10, "text");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    text = self->_text;
    self->_text = v7;

    -[HKSimpleDataEntryItem delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataEntryItemDidUpdateValue:", self);

    v6 = v10;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
