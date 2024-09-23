@implementation FIUIHealthSettingsWeightPickerController

- (void)forceUpdate
{
  void *v3;
  id v4;

  -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsWeightPickerController _weightQuantityForRow:](self, "_weightQuantityForRow:", objc_msgSend(v4, "selectedRowInComponent:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsWeightPickerController _updateWithWeightQuantity:](self, "_updateWithWeightQuantity:", v3);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)numberOfRows
{
  void *v2;
  void *v3;
  void *v4;
  double v5;

  v2 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "poundUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, 1000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = round(_WeightInLocaleUnit(v4));
  return (uint64_t)(v5 - _RoundedMinWeightInLocaleUnit() + 1.0);
}

- (void)_setDefaultValuesOnWeightPickerIfRequiredWithWeight:(id)a3
{
  void *v4;
  double v5;
  uint64_t v6;
  id v7;

  if (!a3)
  {
    _AvgWeightQuantity();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = round(_WeightInLocaleUnit(v4));

    v6 = (uint64_t)((double)(uint64_t)v5 - _RoundedMinWeightInLocaleUnit());
    -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectRow:inComponent:animated:", v6, 0, 0);

  }
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v5;
  void *v6;

  -[FIUIHealthSettingsWeightPickerController _weightDisplayStringForRow:](self, "_weightDisplayStringForRow:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _PickerStyledAttributedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_weightDisplayStringForRow:(int64_t)a3
{
  void *v5;
  double v6;
  void *v7;

  _MassFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsWeightPickerController _weightInLocaleUnitForRow:](self, "_weightInLocaleUnitForRow:", a3);
  objc_msgSend(v5, "stringFromValue:unit:", _LocaleWeightMassFormatterUnit(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)_weightInLocaleUnitForRow:(int64_t)a3
{
  return _RoundedMinWeightInLocaleUnit() + (double)a3;
}

- (id)_weightQuantityForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD3E50];
  objc_msgSend(MEMORY[0x24BDD4048], "unitFromMassFormatterUnit:", _LocaleWeightMassFormatterUnit());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsWeightPickerController _weightInLocaleUnitForRow:](self, "_weightInLocaleUnitForRow:", a3);
  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;

  -[FIUIHealthSettingsWeightPickerController _weightQuantityForRow:](self, "_weightQuantityForRow:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIHealthSettingsWeightPickerController _updateWithWeightQuantity:](self, "_updateWithWeightQuantity:", v6);

}

- (void)setWeightQuantity:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  if (!v4)
  {
    _AvgWeightQuantity();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v4;
  objc_msgSend(MEMORY[0x24BDD4048], "unitFromMassFormatterUnit:", _LocaleWeightMassFormatterUnit());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", v5);
  v7 = round(v6);

  v8 = (uint64_t)((double)(uint64_t)v7 - _RoundedMinWeightInLocaleUnit());
  if ((v8 & 0x8000000000000000) == 0
    && -[FIUIHealthSettingsWeightPickerController numberOfRows](self, "numberOfRows") > v8)
  {
    -[FIUIHealthSettingsPickerController pickerView](self, "pickerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectRow:inComponent:animated:", v8, 0, 0);

  }
}

- (void)_updateWithWeightQuantity:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[FIUIHealthSettingsWeightPickerController weightUpdateHandler](self, "weightUpdateHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FIUIHealthSettingsWeightPickerController weightUpdateHandler](self, "weightUpdateHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)weightUpdateHandler
{
  return self->_weightUpdateHandler;
}

- (void)setWeightUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_weightUpdateHandler, 0);
}

@end
