@implementation HKMedicalIDEditorWeightCell

- (HKMedicalIDEditorWeightCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorWeightCell *v4;
  HKMedicalIDEditorWeightCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKMedicalIDEditorWeightCell;
  v4 = -[HKMedicalIDEditorCell initWithStyle:reuseIdentifier:](&v7, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKMedicalIDEditorWeightCell _commonInit](v4, "_commonInit");
  return v5;
}

- (void)_commonInit
{
  self->_numberOfRowsForPicker = +[HKMedicalIDWeightPickerDataProvider numberOfRows](HKMedicalIDWeightPickerDataProvider, "numberOfRows");
}

- (void)_localeDidChange:(id)a3
{
  -[HKMedicalIDEditorWeightCell _commonInit](self, "_commonInit", a3);
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (void)setKilogramValue:(id)a3
{
  objc_storeStrong((id *)&self->_kilogramValue, a3);
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (id)formattedValue
{
  void *v3;
  void *v4;
  void *v5;

  +[HKPersonWeightFormatter sharedFormatter](HKPersonWeightFormatter, "sharedFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDEditorWeightCell kilogramValue](self, "kilogramValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromWeightInKilograms:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  int64_t v12;
  id v13;

  -[HKMedicalIDEditorWeightCell kilogramValue](self, "kilogramValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend((id)objc_opt_class(), "defaultKilogramValue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorWeightCell setKilogramValue:](self, "setKilogramValue:", v5);

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
  -[HKMedicalIDEditorWeightCell kilogramValue](self, "kilogramValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v12 = +[HKMedicalIDWeightPickerDataProvider rowForWeightInKilograms:](HKMedicalIDWeightPickerDataProvider, "rowForWeightInKilograms:");

  -[UIPickerView selectRow:inComponent:animated:](self->_picker, "selectRow:inComponent:animated:", v12, 0, 0);
  -[HKMedicalIDEditorWeightCell reloadInputViews](self, "reloadInputViews");
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "becomeFirstResponder");

}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDataSource:](self->_picker, "setDataSource:", 0);
  -[UIPickerView setDelegate:](self->_picker, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorWeightCell;
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
  v3.super_class = (Class)HKMedicalIDEditorWeightCell;
  -[HKMedicalIDEditorCell beginEditing](&v3, sel_beginEditing);
  -[HKMedicalIDEditorWeightCell _showPicker](self, "_showPicker");
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
  return +[HKMedicalIDWeightPickerDataProvider titleForRow:](HKMedicalIDWeightPickerDataProvider, "titleForRow:", a4);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  void *v6;
  NSNumber *v7;
  NSNumber *kilogramValue;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  +[HKMedicalIDWeightPickerDataProvider getWeightInKilogramsForRow:](HKMedicalIDWeightPickerDataProvider, "getWeightInKilogramsForRow:", a4);
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  kilogramValue = self->_kilogramValue;
  self->_kilogramValue = v7;

  -[HKMedicalIDEditorCell valueDidChange](self, "valueDidChange");
}

- (NSNumber)kilogramValue
{
  return self->_kilogramValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kilogramValue, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
