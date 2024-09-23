@implementation HKAxisLabelDimensionDisplayType

- (HKAxisLabelDimensionDisplayType)initWithDisplayType:(id)a3 unitPreferencesController:(id)a4
{
  id v7;
  id v8;
  HKAxisLabelDimensionDisplayType *v9;
  HKAxisLabelDimensionDisplayType *v10;
  void *v11;
  uint64_t v12;
  HKDisplayTypeValueFormatter *valueFormatter;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKAxisLabelDimensionDisplayType;
  v9 = -[HKAxisLabelDimensionDisplayType init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unitController, a4);
    objc_storeStrong((id *)&v10->_displayType, a3);
    -[HKUnitPreferenceController unitForDisplayType:](v10->_unitController, "unitForDisplayType:", v10->_displayType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType hk_valueFormatterForUnit:](v10->_displayType, "hk_valueFormatterForUnit:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    valueFormatter = v10->_valueFormatter;
    v10->_valueFormatter = (HKDisplayTypeValueFormatter *)v12;

  }
  return v10;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[HKAxisLabelDimensionDisplayType valueFormatter](self, "valueFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisLabelDimensionDisplayType displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisLabelDimensionDisplayType unitController](self, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromValue:displayType:unitController:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HKDisplayTypeValueFormatter)valueFormatter
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
