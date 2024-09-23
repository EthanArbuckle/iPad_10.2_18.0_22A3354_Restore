@implementation HKUnitlessNumberFormatter

- (HKUnitlessNumberFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4
{
  return -[HKUnitlessNumberFormatter initWithDisplayType:unitPreferenceController:forceUnitlessForAllTypes:](self, "initWithDisplayType:unitPreferenceController:forceUnitlessForAllTypes:", a3, a4, 0);
}

- (HKUnitlessNumberFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4 forceUnitlessForAllTypes:(BOOL)a5
{
  id v9;
  id v10;
  HKUnitlessNumberFormatter *v11;
  HKUnitlessNumberFormatter *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKUnitlessNumberFormatter;
  v11 = -[HKUnitlessNumberFormatter init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_displayType, a3);
    objc_storeStrong((id *)&v12->_unitPreferenceController, a4);
    v12->_forceUnitlessForAllTypes = a5;
  }

  return v12;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  _BOOL4 forceUnitlessForAllTypes;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  forceUnitlessForAllTypes = self->_forceUnitlessForAllTypes;
  v7 = a3;
  -[HKUnitlessNumberFormatter displayType](self, "displayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitlessNumberFormatter unitPreferenceController](self, "unitPreferenceController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (forceUnitlessForAllTypes)
    objc_msgSend(v8, "hk_defaultChartAxisBoundStringFromValue:defaultNumberFormatter:unitController:", v7, 0, v9);
  else
    objc_msgSend(v8, "hk_interactiveChartAxisStringFromValue:defaultNumberFormatter:unitController:", v7, 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (BOOL)forceUnitlessForAllTypes
{
  return self->_forceUnitlessForAllTypes;
}

- (void)setForceUnitlessForAllTypes:(BOOL)a3
{
  self->_forceUnitlessForAllTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end
