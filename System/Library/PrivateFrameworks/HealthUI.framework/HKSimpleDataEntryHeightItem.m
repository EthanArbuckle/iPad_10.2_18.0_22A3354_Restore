@implementation HKSimpleDataEntryHeightItem

- (HKSimpleDataEntryHeightItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 heightInCm:(id)a5 defaultHeightInCm:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKSimpleDataEntryHeightItem *v15;
  HKSimpleDataEntryHeightItem *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HKSimpleDataEntryHeightItem;
  v15 = -[HKSimpleDataEntryHeightItem init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    -[HKSimpleDataEntryHeightItem _updateLocaleDependentValues](v15, "_updateLocaleDependentValues");
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v16->_registrantModelKey, a4);
    v17 = v14;
    if (!v14)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[HKSimpleDataEntryHeightItem _defaultCentimeterValue](v16, "_defaultCentimeterValue");
      objc_msgSend(v18, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v16->_defaultValue, v17);
    if (!v14)

    objc_storeStrong((id *)&v16->_centimeterValue, a5);
  }

  return v16;
}

- (double)_defaultCentimeterValue
{
  double result;

  result = 167.64;
  if (!self->_usesImperialUnits)
    return 168.0;
  return result;
}

- (id)formattedKeyAndValue
{
  NSNumber *centimeterValue;
  NSString *registrantModelKey;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  centimeterValue = self->_centimeterValue;
  registrantModelKey = self->_registrantModelKey;
  v5[0] = centimeterValue;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &registrantModelKey, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cell
{
  HKSimpleDataEntryPlainTextCell *cell;
  HKSimpleDataEntryPlainTextCell *v4;
  HKSimpleDataEntryPlainTextCell *v5;
  void *v6;
  UIPickerView *v7;
  UIPickerView *picker;
  NSNumber *centimeterValue;
  double v10;
  double v11;
  void *v12;
  UIPickerView *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

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
    -[UIPickerView reloadAllComponents](self->_picker, "reloadAllComponents");
    centimeterValue = self->_centimeterValue;
    if (!centimeterValue)
      centimeterValue = self->_defaultValue;
    -[NSNumber doubleValue](centimeterValue, "doubleValue");
    v11 = v10;
    if (self->_usesImperialUnits)
    {
      v21 = 0;
      v22 = 0;
      +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "getFeet:inches:fromCentimeters:", &v22, &v21, v11);

      -[UIPickerView selectRow:inComponent:animated:](self->_picker, "selectRow:inComponent:animated:", v22, 0, 0);
      v13 = self->_picker;
      v14 = v21;
      v15 = 1;
    }
    else
    {
      v13 = self->_picker;
      v14 = (uint64_t)v10;
      v15 = 0;
    }
    -[UIPickerView selectRow:inComponent:animated:](v13, "selectRow:inComponent:animated:", v14, v15, 0);
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_picker);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInputView:", v16);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryItem accessoryToolbar](self, "accessoryToolbar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInputAccessoryView:", v19);

    -[HKSimpleDataEntryHeightItem _setupPlaceholder](self, "_setupPlaceholder");
    -[HKSimpleDataEntryHeightItem updateCellDisplay](self, "updateCellDisplay");
    cell = self->_cell;
  }
  return cell;
}

- (void)beginEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSimpleDataEntryHeightItem;
  -[HKSimpleDataEntryItem beginEditing](&v3, sel_beginEditing);
  if (!self->_centimeterValue)
  {
    -[HKSimpleDataEntryHeightItem _setHeightValueForPicker:selectedRow:](self, "_setHeightValueForPicker:selectedRow:", self->_picker, -[UIPickerView selectedRowInComponent:](self->_picker, "selectedRowInComponent:", 0));
    -[HKSimpleDataEntryHeightItem _valueDidChange](self, "_valueDidChange");
  }
}

- (void)updateCellDisplay
{
  id v3;

  -[HKSimpleDataEntryHeightItem _formattedValueForDisplay](self, "_formattedValueForDisplay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSimpleDataEntryHeightItem _setTextForInputTextField:](self, "_setTextForInputTextField:", v3);

}

- (id)_formattedValueForDisplay
{
  void *v3;
  void *v4;

  if (self->_centimeterValue)
  {
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringFromHeightInCentimeters:", self->_centimeterValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
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
  -[HKSimpleDataEntryHeightItem _setTextForInputTextField:](self, "_setTextForInputTextField:", 0);
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

- (void)_valueDidChange
{
  id v3;

  -[HKSimpleDataEntryHeightItem updateCellDisplay](self, "updateCellDisplay");
  -[HKSimpleDataEntryItem delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataEntryItemDidUpdateValue:", self);

}

- (void)_updateLocaleDependentValues
{
  id v3;

  +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_usesImperialUnits = objc_msgSend(v3, "usesImperialUnits");

}

- (void)localeDidChange:(id)a3
{
  -[HKSimpleDataEntryHeightItem _updateLocaleDependentValues](self, "_updateLocaleDependentValues", a3);
  -[HKSimpleDataEntryHeightItem updateCellDisplay](self, "updateCellDisplay");
}

- (void)doneButtonTapped:(id)a3
{
  id v3;

  -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)_setHeightValueForPicker:(id)a3 selectedRow:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  NSNumber *v11;
  NSNumber *centimeterValue;
  NSNumber *v13;
  id v14;

  v6 = a3;
  v14 = v6;
  if (self->_usesImperialUnits)
  {
    v7 = fmax((double)objc_msgSend(v6, "selectedRowInComponent:", 0), 0.0);
    v8 = fmax((double)objc_msgSend(v14, "selectedRowInComponent:", 1), 0.0);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "centimetersFromFeet:inches:", v7, v8);
    objc_msgSend(v9, "numberWithDouble:");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    centimeterValue = self->_centimeterValue;
    self->_centimeterValue = v11;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v10 = self->_centimeterValue;
    self->_centimeterValue = v13;
  }

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return self->_usesImperialUnits + 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  int64_t v4;

  v4 = 12;
  if (!a4)
    v4 = 10;
  if (self->_usesImperialUnits)
    return v4;
  else
    return 300;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double result;
  double v5;

  if (self->_usesImperialUnits)
  {
    +[HKPickerViewTitleMeasurer pickerView:maxWidthForComponent:](HKPickerViewTitleMeasurer, "pickerView:maxWidthForComponent:", a3, a4);
  }
  else
  {
    objc_msgSend(a3, "frame");
    return v5;
  }
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;

  v8 = a3;
  if (self->_usesImperialUnits)
  {
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = (double)a4;
    if (a5)
      objc_msgSend(v9, "formattedValueForInches:", v11);
    else
      objc_msgSend(v9, "formattedValueForFeet:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formattedValueForCentimeters:", (double)a4);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[HKSimpleDataEntryHeightItem _setHeightValueForPicker:selectedRow:](self, "_setHeightValueForPicker:selectedRow:", a3, a4, a5);
  -[HKSimpleDataEntryHeightItem _valueDidChange](self, "_valueDidChange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centimeterValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
