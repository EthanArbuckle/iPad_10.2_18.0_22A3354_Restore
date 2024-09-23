@implementation FIUIHealthSettingsSexPickerController

- (void)forceUpdate
{
  id v3;

  -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsSexPickerController _updateWithBiologicalSex:](self, "_updateWithBiologicalSex:", -[FIUIHealthSettingsSexPickerController _biologicalSexForRow:](self, "_biologicalSexForRow:", objc_msgSend(v3, "selectedRowInComponent:", 0)));

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 4;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[FIUIHealthSettingsSexPickerController _updateWithBiologicalSex:](self, "_updateWithBiologicalSex:", -[FIUIHealthSettingsSexPickerController _biologicalSexForRow:](self, "_biologicalSexForRow:", a4));
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v5;
  void *v6;

  FIUIBiologicalSexDisplayString(-[FIUIHealthSettingsSexPickerController _biologicalSexForRow:](self, "_biologicalSexForRow:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PickerStyledAttributedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_updateWithBiologicalSex:(int64_t)a3
{
  void *v5;
  void (**v6)(id, int64_t);

  -[FIUIHealthSettingsSexPickerController sexUpdateHandler](self, "sexUpdateHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FIUIHealthSettingsSexPickerController sexUpdateHandler](self, "sexUpdateHandler");
    v6 = (void (**)(id, int64_t))objc_claimAutoreleasedReturnValue();
    v6[2](v6, a3);

  }
}

- (int64_t)_biologicalSexForRow:(int64_t)a3
{
  return a3;
}

- (void)setBiologicalSex:(int64_t)a3
{
  id v4;

  -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectRow:inComponent:animated:", a3, 0, 0);

}

- (id)sexUpdateHandler
{
  return self->_sexUpdateHandler;
}

- (void)setSexUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sexUpdateHandler, 0);
}

@end
