@implementation HKSimpleDataEntryWeightItem

- (HKSimpleDataEntryWeightItem)initWithTitle:(id)a3 registrantModelKey:(id)a4 weightInKg:(id)a5 defaultWeightInKg:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKSimpleDataEntryWeightItem *v15;
  HKSimpleDataEntryWeightItem *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSNumber *kilogramValue;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKSimpleDataEntryWeightItem;
  v15 = -[HKSimpleDataEntryWeightItem init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    -[HKSimpleDataEntryWeightItem _updateLocaleDependentValues](v15, "_updateLocaleDependentValues");
    objc_storeStrong((id *)&v16->_title, a3);
    objc_storeStrong((id *)&v16->_registrantModelKey, a4);
    v17 = v14;
    if (!v14)
    {
      v18 = (void *)MEMORY[0x1E0CB37E8];
      -[HKSimpleDataEntryWeightItem _defaultKilogramValue](v16, "_defaultKilogramValue");
      objc_msgSend(v18, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v16->_defaultValue, v17);
    if (!v14)

    ClampedWeightLoggingOutOfBoundsValues(v13);
    v19 = objc_claimAutoreleasedReturnValue();
    kilogramValue = v16->_kilogramValue;
    v16->_kilogramValue = (NSNumber *)v19;

  }
  return v16;
}

- (id)formattedKeyAndValue
{
  NSNumber *kilogramValue;
  NSString *registrantModelKey;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  kilogramValue = self->_kilogramValue;
  registrantModelKey = self->_registrantModelKey;
  v5[0] = kilogramValue;
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
  NSNumber *kilogramValue;
  double v10;
  int64_t localWeightUnit;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

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
    kilogramValue = self->_kilogramValue;
    if (!kilogramValue)
      kilogramValue = self->_defaultValue;
    -[NSNumber doubleValue](kilogramValue, "doubleValue");
    localWeightUnit = self->_localWeightUnit;
    if (localWeightUnit == 1538)
    {
      v12 = v10 / 0.453592;
    }
    else if (localWeightUnit == 1539)
    {
      v12 = v10 / 6.35029 * 10.0;
    }
    else
    {
      v12 = v10 + v10;
    }
    -[UIPickerView selectRow:inComponent:animated:](self->_picker, "selectRow:inComponent:animated:", llround(v12), 0, 0);
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_picker);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInputView:", v13);

    -[HKSimpleDataEntryPlainTextCell inputTextField](self->_cell, "inputTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSimpleDataEntryItem accessoryToolbar](self, "accessoryToolbar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInputAccessoryView:", v16);

    -[HKSimpleDataEntryWeightItem _setupPlaceholder](self, "_setupPlaceholder");
    -[HKSimpleDataEntryWeightItem updateCellDisplay](self, "updateCellDisplay");
    cell = self->_cell;
  }
  return cell;
}

- (void)updateCellDisplay
{
  id v3;

  -[HKSimpleDataEntryWeightItem _formattedValueForDisplay](self, "_formattedValueForDisplay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSimpleDataEntryWeightItem _setTextForInputTextField:](self, "_setTextForInputTextField:", v3);

}

- (id)_formattedValueForDisplay
{
  void *v3;
  void *v4;

  if (self->_kilogramValue)
  {
    +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromWeightInKilograms:", self->_kilogramValue);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)beginEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSimpleDataEntryWeightItem;
  -[HKSimpleDataEntryItem beginEditing](&v3, sel_beginEditing);
  if (!self->_kilogramValue)
  {
    -[HKSimpleDataEntryWeightItem _setWeightValueForSelectedRow:](self, "_setWeightValueForSelectedRow:", -[UIPickerView selectedRowInComponent:](self->_picker, "selectedRowInComponent:", 0));
    -[HKSimpleDataEntryWeightItem _valueDidChange](self, "_valueDidChange");
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
  -[HKSimpleDataEntryWeightItem _setTextForInputTextField:](self, "_setTextForInputTextField:", 0);
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

  -[HKSimpleDataEntryWeightItem updateCellDisplay](self, "updateCellDisplay");
  -[HKSimpleDataEntryItem delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataEntryItemDidUpdateValue:", self);

}

- (double)_defaultKilogramValue
{
  return 60.0;
}

- (void)_updateLocaleDependentValues
{
  void *v3;
  int64_t localWeightUnit;
  uint64_t v5;
  BOOL v6;
  int64_t v7;

  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_localWeightUnit = objc_msgSend(v3, "localWeightUnit");

  localWeightUnit = self->_localWeightUnit;
  v5 = 1451;
  if (localWeightUnit == 14)
    v5 = 1316;
  v6 = localWeightUnit == 1539;
  v7 = 1036;
  if (!v6)
    v7 = v5;
  self->_numberOfRowsForPicker = v7;
}

- (void)localeDidChange:(id)a3
{
  -[HKSimpleDataEntryWeightItem _updateLocaleDependentValues](self, "_updateLocaleDependentValues", a3);
  -[HKSimpleDataEntryWeightItem updateCellDisplay](self, "updateCellDisplay");
}

- (void)_setWeightValueForSelectedRow:(int64_t)a3
{
  int64_t localWeightUnit;
  void *v5;
  double v6;
  double v7;
  NSNumber *v8;
  NSNumber *kilogramValue;
  id v10;

  localWeightUnit = self->_localWeightUnit;
  if (localWeightUnit == 1538)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    v6 = (double)a3;
    v7 = 0.453592;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    if (localWeightUnit == 1539)
    {
      v6 = (double)a3 / 10.0;
      v7 = 6.35029;
    }
    else
    {
      v6 = (double)a3;
      v7 = 0.5;
    }
  }
  objc_msgSend(v5, "numberWithDouble:", v6 * v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  ClampedWeightLoggingOutOfBoundsValues(v10);
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  kilogramValue = self->_kilogramValue;
  self->_kilogramValue = v8;

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return self->_numberOfRowsForPicker;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  double v6;
  int64_t localWeightUnit;
  void *v8;
  void *v9;

  v6 = (double)a4;
  localWeightUnit = self->_localWeightUnit;
  if (localWeightUnit == 14)
  {
    v6 = v6 * 0.5;
  }
  else if (localWeightUnit == 1539)
  {
    v6 = v6 / 10.0;
  }
  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromWeightValue:inUnit:", self->_localWeightUnit, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[HKSimpleDataEntryWeightItem _setWeightValueForSelectedRow:](self, "_setWeightValueForSelectedRow:", a4);
  -[HKSimpleDataEntryWeightItem _valueDidChange](self, "_valueDidChange");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kilogramValue, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_registrantModelKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
