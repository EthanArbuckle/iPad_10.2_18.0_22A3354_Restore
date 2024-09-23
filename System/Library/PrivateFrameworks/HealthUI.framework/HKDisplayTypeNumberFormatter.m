@implementation HKDisplayTypeNumberFormatter

- (HKDisplayTypeNumberFormatter)initWithDisplayType:(id)a3 unitController:(id)a4
{
  id v7;
  id v8;
  HKDisplayTypeNumberFormatter *v9;
  HKDisplayTypeNumberFormatter *v10;
  void *v11;
  uint64_t v12;
  HKDisplayTypeValueFormatter *valueFormatter;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKDisplayTypeNumberFormatter;
  v9 = -[HKDisplayTypeNumberFormatter init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_storeStrong((id *)&v10->_unitController, a4);
    -[HKUnitPreferenceController unitForDisplayType:](v10->_unitController, "unitForDisplayType:", v10->_displayType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType hk_valueFormatterForUnit:](v10->_displayType, "hk_valueFormatterForUnit:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    valueFormatter = v10->_valueFormatter;
    v10->_valueFormatter = (HKDisplayTypeValueFormatter *)v12;

  }
  return v10;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  void *displayType;
  void *unitController;
  HKDisplayTypeValueFormatter *valueFormatter;
  id v11;
  id v12;
  id v13;
  void *v14;

  displayType = a4;
  if (!a4)
    displayType = self->_displayType;
  unitController = a5;
  if (!a5)
    unitController = self->_unitController;
  valueFormatter = self->_valueFormatter;
  v11 = displayType;
  v12 = a5;
  v13 = a4;
  -[HKDisplayTypeValueFormatter stringFromValue:displayType:unitController:](valueFormatter, "stringFromValue:displayType:unitController:", a3, v11, unitController);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end
