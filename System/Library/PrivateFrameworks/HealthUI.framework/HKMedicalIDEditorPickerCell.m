@implementation HKMedicalIDEditorPickerCell

- (id)formattedValue
{
  unint64_t chosenValueIndex;
  void *v4;

  chosenValueIndex = self->_chosenValueIndex;
  if (chosenValueIndex >= -[NSArray count](self->_possibleValues, "count"))
  {
    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_possibleValues, "objectAtIndexedSubscript:", self->_chosenValueIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setChosenValueIndex:(int64_t)a3
{
  self->_chosenValueIndex = a3;
  -[HKMedicalIDEditorCell updateValueLabel](self, "updateValueLabel");
}

- (void)_showPicker
{
  UIPickerView *picker;
  UIPickerView *v4;
  UIPickerView *v5;
  void *v6;
  void *v7;
  id v8;

  picker = self->_picker;
  if (!picker)
  {
    v4 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    v5 = self->_picker;
    self->_picker = v4;

    -[UIPickerView setDataSource:](self->_picker, "setDataSource:", self);
    -[UIPickerView setDelegate:](self->_picker, "setDelegate:", self);
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_picker);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInputView:", v6);

    picker = self->_picker;
  }
  -[UIPickerView reloadAllComponents](picker, "reloadAllComponents");
  -[UIPickerView selectRow:inComponent:animated:](self->_picker, "selectRow:inComponent:animated:", self->_chosenValueIndex, 0, 0);
  -[HKMedicalIDEditorPickerCell reloadInputViews](self, "reloadInputViews");
  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "becomeFirstResponder");

}

- (void)_hidePicker
{
  id v2;

  -[HKMedicalIDEditorCell inputTextField](self, "inputTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDataSource:](self->_picker, "setDataSource:", 0);
  -[UIPickerView setDelegate:](self->_picker, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorPickerCell;
  -[HKMedicalIDEditorCell dealloc](&v3, sel_dealloc);
}

- (void)beginEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKMedicalIDEditorPickerCell;
  -[HKMedicalIDEditorCell beginEditing](&v3, sel_beginEditing);
  -[HKMedicalIDEditorPickerCell _showPicker](self, "_showPicker");
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_possibleValues, "count", a3, a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[NSArray objectAtIndexedSubscript:](self->_possibleValues, "objectAtIndexedSubscript:", a4);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  self->_chosenValueIndex = -[UIPickerView selectedRowInComponent:](self->_picker, "selectedRowInComponent:", 0, a4, a5);
  -[HKMedicalIDEditorCell valueDidChange](self, "valueDidChange");
}

- (int64_t)chosenValueIndex
{
  return self->_chosenValueIndex;
}

- (NSArray)possibleValues
{
  return self->_possibleValues;
}

- (void)setPossibleValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleValues, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
