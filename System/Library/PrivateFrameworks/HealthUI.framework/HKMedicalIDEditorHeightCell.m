@implementation HKMedicalIDEditorHeightCell

- (HKMedicalIDEditorHeightCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorHeightCell *v4;
  HKMedicalIDEditorHeightCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorHeightCell;
  v4 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKMedicalIDEditorHeightCell _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  id v3;

  +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_usesImperialUnits = objc_msgSend(v3, "usesImperialUnits");

}

- (void)_localeDidChange:(id)a3
{
  -[HKMedicalIDEditorHeightCell _commonInit](self, "_commonInit", a3);
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (id)formattedValue
{
  void *v3;
  void *v4;
  void *v5;

  +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorHeightCell centimeterValue](self, "centimeterValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringFromHeightInCentimeters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCentimeterValue:(id)a3
{
  objc_storeStrong((id *)&self->_centimeterValue, a3);
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (void)_showPicker
{
  void *v3;
  void *v4;
  void *v5;
  UIPickerView *picker;
  UIPickerView *v7;
  UIPickerView *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  UIPickerView *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  -[HKMedicalIDEditorHeightCell centimeterValue](self, "centimeterValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    +[HKMedicalIDHeightPickerDataProvider defaultCentimeterValue](HKMedicalIDHeightPickerDataProvider, "defaultCentimeterValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorHeightCell setCentimeterValue:](self, "setCentimeterValue:", v5);

  }
  picker = self->_picker;
  if (!picker)
  {
    v7 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    v8 = self->_picker;
    self->_picker = v7;

    -[UIPickerView setDataSource:](self->_picker, "setDataSource:", self);
    -[UIPickerView setDelegate:](self->_picker, "setDelegate:", self);
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_picker);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInputView:", v9);

    picker = self->_picker;
  }
  -[UIPickerView reloadAllComponents](picker, "reloadAllComponents");
  -[HKMedicalIDEditorHeightCell centimeterValue](self, "centimeterValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (self->_usesImperialUnits)
  {
    v19 = 0;
    v20 = 0;
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getFeet:inches:fromCentimeters:", &v20, &v19, v13);

    -[UIPickerView selectRow:inComponent:animated:](self->_picker, "selectRow:inComponent:animated:", v20, 0, 0);
    v15 = self->_picker;
    v16 = v19;
    v17 = 1;
  }
  else
  {
    v15 = self->_picker;
    v16 = (uint64_t)v13;
    v17 = 0;
  }
  -[UIPickerView selectRow:inComponent:animated:](v15, "selectRow:inComponent:animated:", v16, v17, 0);
  -[HKMedicalIDEditorHeightCell reloadInputViews](self, "reloadInputViews");
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "becomeFirstResponder");

}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDataSource:](self->_picker, "setDataSource:", 0);
  -[UIPickerView setDelegate:](self->_picker, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorHeightCell;
  -[HKMedicalIDEditorCell dealloc](&v3, sel_dealloc);
}

- (void)_hidePicker
{
  id v2;

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)beginEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorHeightCell;
  -[HKMedicalIDEditorCell beginEditing](&v3, sel_beginEditing);
  -[HKMedicalIDEditorHeightCell _showPicker](self, "_showPicker");
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return self->_usesImperialUnits + 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return +[HKMedicalIDHeightPickerDataProvider numberOfRowsInComponent:](HKMedicalIDHeightPickerDataProvider, "numberOfRowsInComponent:", a4);
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
  return +[HKMedicalIDHeightPickerDataProvider titleForRow:inComponent:](HKMedicalIDHeightPickerDataProvider, "titleForRow:inComponent:", a4, a5);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  NSNumber *centimeterValue;
  NSNumber *v14;
  id v15;

  v7 = a3;
  v15 = v7;
  if (self->_usesImperialUnits)
  {
    v8 = fmax((double)objc_msgSend(v7, "selectedRowInComponent:", 0), 0.0);
    v9 = fmax((double)objc_msgSend(v15, "selectedRowInComponent:", 1), 0.0);
    v10 = (void *)MEMORY[0x1E0CB37E8];
    +[HKPersonHeightFormatter sharedFormatter](HKPersonHeightFormatter, "sharedFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centimetersFromFeet:inches:", v8, v9);
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    centimeterValue = self->_centimeterValue;
    self->_centimeterValue = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v11 = self->_centimeterValue;
    self->_centimeterValue = v14;
  }

  -[HKMedicalIDEditorCell valueDidChange](self, "valueDidChange");
}

- (NSNumber)centimeterValue
{
  return self->_centimeterValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centimeterValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
