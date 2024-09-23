@implementation SCATCameraPointPickerEditableTableCellWithStepper

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCATCameraPointPickerEditableTableCellWithStepper;
  v4 = a3;
  -[AXUISettingsEditableTableCellWithStepper textFieldDidEndEditing:](&v5, sel_textFieldDidEndEditing_, v4);
  -[SCATCameraPointPickerEditableTableCellWithStepper _updateTextFieldWidth:](self, "_updateTextFieldWidth:", v4, v5.receiver, v5.super_class);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCATCameraPointPickerEditableTableCellWithStepper;
  v4 = a3;
  -[AXUISettingsEditableTableCellWithStepper textFieldDidEndEditing:](&v5, sel_textFieldDidEndEditing_, v4);
  -[SCATCameraPointPickerEditableTableCellWithStepper _updateTextFieldWidth:](self, "_updateTextFieldWidth:", v4, v5.receiver, v5.super_class);

}

- (void)_updateTextFieldWidth:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");

}

@end
