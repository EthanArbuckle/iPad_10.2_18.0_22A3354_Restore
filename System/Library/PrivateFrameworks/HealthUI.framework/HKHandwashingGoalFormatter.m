@implementation HKHandwashingGoalFormatter

- (HKHandwashingGoalFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4
{
  id v6;
  id v7;
  HKHandwashingGoalFormatter *v8;
  HKHandwashingGoalFormatter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKHandwashingGoalFormatter;
  v8 = -[HKHandwashingGoalFormatter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HKHandwashingGoalFormatter setDisplayType:](v8, "setDisplayType:", v6);
    -[HKHandwashingGoalFormatter setUnitPreferenceController:](v9, "setUnitPreferenceController:", v7);
  }

  return v9;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[HKHandwashingGoalFormatter unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHandwashingGoalFormatter displayType](self, "displayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitForDisplayType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHandwashingGoalFormatter displayType](self, "displayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_valueFormatterForUnit:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHandwashingGoalFormatter displayType](self, "displayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHandwashingGoalFormatter unitPreferenceController](self, "unitPreferenceController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromValue:displayType:unitController:", v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end
