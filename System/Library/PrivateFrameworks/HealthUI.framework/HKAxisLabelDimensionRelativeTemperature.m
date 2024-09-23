@implementation HKAxisLabelDimensionRelativeTemperature

- (HKAxisLabelDimensionRelativeTemperature)initWithDisplayType:(id)a3 unitPreferencesController:(id)a4
{
  id v7;
  id v8;
  HKAxisLabelDimensionRelativeTemperature *v9;
  HKAxisLabelDimensionRelativeTemperature *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HKQuantityDisplayTypeValueFormatter *valueFormatter;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKAxisLabelDimensionRelativeTemperature;
  v9 = -[HKAxisLabelDimensionRelativeTemperature init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unitController, a4);
    objc_storeStrong((id *)&v10->_displayType, a3);
    v11 = (void *)MEMORY[0x1E0CB6CD0];
    -[HKUnitPreferenceController unitForDisplayType:](v10->_unitController, "unitForDisplayType:", v10->_displayType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_changeInUnit:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKDisplayType hk_valueFormatterForUnit:](v10->_displayType, "hk_valueFormatterForUnit:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    valueFormatter = v10->_valueFormatter;
    v10->_valueFormatter = (HKQuantityDisplayTypeValueFormatter *)v14;

  }
  return v10;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "doubleValue");
  if (v6 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TEMPERATURE_BASELINE_SHORT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKAxisLabelDimensionRelativeTemperature valueFormatter](self, "valueFormatter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisLabelDimensionRelativeTemperature displayType](self, "displayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisLabelDimensionRelativeTemperature unitController](self, "unitController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TEMPERATURE_QUANTITY_AXIS_LABEL_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromValue:displayType:unitController:formatString:", v5, v9, v10, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (HKQuantityDisplayTypeValueFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (void)setValueFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_valueFormatter, a3);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
}

@end
