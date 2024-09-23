@implementation FIUIHealthSettingsHeightPickerController

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  if (-[FIUIHealthSettingsPickerController isMetricLocale](self, "isMetricLocale", a3))
    return 1;
  else
    return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  _BOOL4 v5;
  int64_t v6;

  v5 = -[FIUIHealthSettingsPickerController isMetricLocale](self, "isMetricLocale", a3);
  v6 = 12;
  if (!a4)
    v6 = 9;
  if (v5)
    return 246;
  else
    return v6;
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v5;
  void *v6;

  -[FIUIHealthSettingsHeightPickerController _pickerDisplayStringForHeightForRow:forComponent:](self, "_pickerDisplayStringForHeightForRow:forComponent:", a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PickerStyledAttributedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHeightQuantity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  if (!v21)
  {
    v4 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quantityWithUnit:doubleValue:", v5, 162.0);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (-[FIUIHealthSettingsPickerController isMetricLocale](self, "isMetricLocale"))
  {
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValueForUnit:", v6);
    v8 = llround(v7);

    v9 = 30;
    if (v8 > 30)
      v9 = v8;
    v10 = v9 - 30;
    -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v10;
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD4048], "inchUnit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValueForUnit:", v15);
    v17 = llround(v16);

    v18 = (uint64_t)(double)(v17 / 12);
    v19 = (v17 - 12 * v18) & ~((v17 - 12 * v18) >> 63);
    -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectRow:inComponent:animated:", v18 - 1, 0, 0);

    -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = v19;
    v14 = 1;
  }
  objc_msgSend(v11, "selectRow:inComponent:animated:", v13, v14, 0);

}

- (void)_heightPickerUpdated
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  uint64_t v15;

  v3 = -[FIUIHealthSettingsPickerController isMetricLocale](self, "isMetricLocale");
  -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedRowInComponent:", 0);
  v6 = v5;
  if (v3)
  {
    v7 = v5 + 30;

    v8 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 5);
  }
  else
  {

    -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "selectedRowInComponent:", 1);

    v7 = v10 + 12 * v6 + 12;
    v8 = (void *)MEMORY[0x24BDD3E50];
    objc_msgSend(MEMORY[0x24BDD4048], "inchUnit");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quantityWithUnit:doubleValue:", v11, (double)v7);
  v15 = objc_claimAutoreleasedReturnValue();

  -[FIUIHealthSettingsHeightPickerController heightUpdateHandler](self, "heightUpdateHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)v15;
  if (v12)
  {
    -[FIUIHealthSettingsHeightPickerController heightUpdateHandler](self, "heightUpdateHandler");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15);

    v13 = (void *)v15;
  }

}

- (id)_pickerDisplayStringForHeightForRow:(int64_t)a3 forComponent:(int64_t)a4
{
  void *v7;
  _BOOL4 v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  _HeightFormatterMediumStyle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FIUIHealthSettingsPickerController isMetricLocale](self, "isMetricLocale");
  v9 = a3 + 30;
  if (a4)
    v10 = a3;
  else
    v10 = a3 + 1;
  v11 = 1281;
  if (!a4)
    v11 = 1282;
  if (v8)
  {
    v12 = 9;
  }
  else
  {
    v9 = v10;
    v12 = v11;
  }
  objc_msgSend(v7, "stringFromValue:unit:", v12, (double)(unint64_t)v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)heightUpdateHandler
{
  return self->_heightUpdateHandler;
}

- (void)setHeightUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_heightUpdateHandler, 0);
  objc_storeStrong((id *)&self->_heightFormatter, 0);
}

@end
