@implementation HKSimpleDataEntryMultipleChoiceItem

- (HKSimpleDataEntryMultipleChoiceItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 choices:(id)a5 choiceDisplayNames:(id)a6 defaultChoice:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKSimpleDataEntryMultipleChoiceItem *v17;
  HKSimpleDataEntryMultipleChoiceItem *v18;
  uint64_t v19;
  uint64_t v20;
  NSNumber *chosenIndex;
  id v23;
  objc_super v24;

  v23 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKSimpleDataEntryMultipleChoiceItem;
  v17 = -[HKSimpleDataEntryMultipleChoiceItem init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_registrantModelKey, a4);
    v19 = objc_msgSend(v14, "indexOfObject:", v16);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      chosenIndex = v18->_chosenIndex;
      v18->_chosenIndex = (NSNumber *)v20;

    }
    objc_storeStrong((id *)&v18->_choices, a5);
    objc_storeStrong((id *)&v18->_choiceDisplayValues, a6);
  }

  return v18;
}

- (id)formattedKeyAndValue
{
  void *v2;
  void *v3;
  NSString *registrantModelKey;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  registrantModelKey = self->_registrantModelKey;
  -[NSArray objectAtIndexedSubscript:](self->_choices, "objectAtIndexedSubscript:", -[NSNumber integerValue](self->_chosenIndex, "integerValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &registrantModelKey, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cell
{
  HKSimpleDataEntryPlainTextCell *cell;
  HKSimpleDataEntryPlainTextCell *v4;
  HKSimpleDataEntryPlainTextCell *v5;
  void *v6;
  UIPickerView *v7;
  UIPickerView *picker;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  cell = self->_cell;
  if (!cell)
  {
    v4 = -[HKSimpleDataEntryPlainTextCell initWithIntention:reuseIdentifier:]([HKSimpleDataEntryPlainTextCell alloc], "initWithIntention:reuseIdentifier:", 9, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKSimpleDataEntryPlainTextCell titleLabel](self->_cell, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_title);

    v7 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    picker = self->_picker;
    self->_picker = v7;

    -[UIPickerView setDelegate:](self->_picker, "setDelegate:", self);
    -[UIPickerView setDataSource:](self->_picker, "setDataSource:", self);
    -[UIPickerView selectRow:inComponent:animated:](self->_picker, "selectRow:inComponent:animated:", -[NSNumber integerValue](self->_chosenIndex, "integerValue"), 0, 0);
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_picker);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputView:", v9);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryItem accessoryToolbar](self, "accessoryToolbar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInputAccessoryView:", v12);

    -[HKSimpleDataEntryMultipleChoiceItem _setupPlaceholder](self, "_setupPlaceholder");
    -[HKSimpleDataEntryMultipleChoiceItem updateCellDisplay](self, "updateCellDisplay");
    cell = self->_cell;
  }
  return cell;
}

- (void)updateCellDisplay
{
  NSNumber *chosenIndex;
  unint64_t v4;
  id v5;

  chosenIndex = self->_chosenIndex;
  if (chosenIndex)
  {
    v4 = -[NSNumber integerValue](chosenIndex, "integerValue");
    if (v4 < -[NSArray count](self->_choiceDisplayValues, "count"))
    {
      -[NSArray objectAtIndexedSubscript:](self->_choiceDisplayValues, "objectAtIndexedSubscript:", -[NSNumber integerValue](self->_chosenIndex, "integerValue"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[HKSimpleDataEntryMultipleChoiceItem _setTextForInputTextField:](self, "_setTextForInputTextField:", v5);

    }
  }
}

- (void)_setupPlaceholder
{
  void *v3;
  void *v4;
  void *v5;

  if (!-[HKSimpleDataEntryItem placeholderType](self, "placeholderType"))
  {
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("OD_PLACEHOLDER_OPTIONAL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlaceholder:", v5);

  }
  -[HKSimpleDataEntryMultipleChoiceItem _setTextForInputTextField:](self, "_setTextForInputTextField:", 0);
}

- (void)_setTextForInputTextField:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[HKSimpleDataEntryItem placeholderType](self, "placeholderType") == 1 && !objc_msgSend(v11, "length"))
  {
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OD_PICKER_CHOOSE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthKeyColor();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v11);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v6;
  objc_msgSend(v5, "setTextColor:", v6);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_choices, "count", a3, a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[NSArray objectAtIndex:](self->_choiceDisplayValues, "objectAtIndex:", a4);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  NSNumber *v6;
  NSNumber *chosenIndex;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  chosenIndex = self->_chosenIndex;
  self->_chosenIndex = v6;

  -[HKSimpleDataEntryMultipleChoiceItem updateCellDisplay](self, "updateCellDisplay");
  -[HKSimpleDataEntryItem delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataEntryItemDidUpdateValue:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_choiceDisplayValues, 0);
  objc_storeStrong((id *)&self->_chosenIndex, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
