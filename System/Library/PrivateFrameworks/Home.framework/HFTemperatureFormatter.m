@implementation HFTemperatureFormatter

- (id)stringForObjectValue:(id)a3
{
  void *v4;
  void *v5;
  objc_super v7;

  -[HFTemperatureFormatter measurementForObjectValue:](self, "measurementForObjectValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)HFTemperatureFormatter;
    -[NSMeasurementFormatter stringForObjectValue:](&v7, sel_stringForObjectValue_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NSMeasurementFormatter locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "setInputIsCelsius:", -[HFTemperatureFormatter inputIsCelsius](self, "inputIsCelsius"));
  objc_msgSend(v4, "setOutputIsCelsius:", -[HFTemperatureFormatter outputIsCelsius](self, "outputIsCelsius"));
  objc_msgSend(v4, "setMaximumFractionDigits:", -[HFTemperatureFormatter maximumFractionDigits](self, "maximumFractionDigits"));
  objc_msgSend(v4, "setMinimumFractionDigits:", -[HFTemperatureFormatter minimumFractionDigits](self, "minimumFractionDigits"));
  objc_msgSend(v4, "setUnitOptions:", -[NSMeasurementFormatter unitOptions](self, "unitOptions"));
  -[HFTemperatureFormatter stepValue](self, "stepValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStepValue:", v6);

  -[HFTemperatureFormatter fallbackTemperatureString](self, "fallbackTemperatureString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFallbackTemperatureString:", v7);

  return v4;
}

- (void)setStepValue:(id)a3
{
  id v5;
  NSNumber *v6;
  NSNumber *v7;
  char v8;
  NSNumber *v9;
  void *v10;
  NSNumber *v11;

  v5 = a3;
  v6 = self->_stepValue;
  v7 = (NSNumber *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    v10 = v11;
  }
  else
  {
    if (v6)
    {
      v8 = -[NSNumber isEqual:](v6, "isEqual:", v7);

      v9 = v11;
      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_stepValue, a3);
    -[NSMeasurementFormatter numberFormatter](self, "numberFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRoundingIncrement:", v11);
  }

  v9 = v11;
LABEL_9:

}

- (void)setOutputIsCelsius:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;

  self->_outputIsCelsius = a3;
  v4 = a3;
  if (a3)
    v5 = &unk_1EA7CD870;
  else
    v5 = &unk_1EA7CD880;
  -[HFTemperatureFormatter setMaximumFractionDigits:](self, "setMaximumFractionDigits:", a3);
  -[HFTemperatureFormatter setMinimumFractionDigits:](self, "setMinimumFractionDigits:", v4);
  -[HFTemperatureFormatter setStepValue:](self, "setStepValue:", v5);
}

- (void)setMinimumFractionDigits:(unint64_t)a3
{
  id v4;

  -[NSMeasurementFormatter numberFormatter](self, "numberFormatter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumFractionDigits:", a3);

}

- (void)setMaximumFractionDigits:(unint64_t)a3
{
  id v4;

  -[NSMeasurementFormatter numberFormatter](self, "numberFormatter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumFractionDigits:", a3);

}

- (id)measurementForObjectValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_opt_class();
    v8 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (-[HFTemperatureFormatter inputIsCelsius](self, "inputIsCelsius"))
      objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
    else
      objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HFTemperatureFormatter outputIsCelsius](self, "outputIsCelsius"))
      objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
    else
      objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v10, "unit");
      v13 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(v14, "numberWithDouble:");
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v15;
      v11 = (void *)v13;
    }
    v16 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(v7, "doubleValue");
    v17 = (void *)objc_msgSend(v16, "initWithDoubleValue:unit:", v11);
    objc_msgSend(v17, "measurementByConvertingToUnit:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_stepValue)
    {
      objc_msgSend(v18, "doubleValue");
      v20 = v19;
      -[NSNumber doubleValue](self->_stepValue, "doubleValue");
      v22 = round(v20 / v21);
      -[NSNumber doubleValue](self->_stepValue, "doubleValue");
      v24 = v22 * v23;
      v25 = fabs(v24);
      if (v24 == 0.0)
        v26 = v25;
      else
        v26 = v24;
      v27 = objc_alloc(MEMORY[0x1E0CB3758]);
      objc_msgSend(v18, "unit");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithDoubleValue:unit:", v28, v26);

      v18 = (void *)v29;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)outputIsCelsius
{
  return self->_outputIsCelsius;
}

- (BOOL)inputIsCelsius
{
  return self->_inputIsCelsius;
}

- (HFTemperatureFormatter)init
{
  HFTemperatureFormatter *v2;
  HFTemperatureFormatter *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFTemperatureFormatter;
  v2 = -[NSMeasurementFormatter init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HFTemperatureFormatter setStepValue:](v2, "setStepValue:", 0);
    -[HFTemperatureFormatter setInputIsCelsius:](v3, "setInputIsCelsius:", 1);
    +[HFTemperatureUnitCoordinator sharedCoordinator](HFTemperatureUnitCoordinator, "sharedCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTemperatureFormatter setOutputIsCelsius:](v3, "setOutputIsCelsius:", objc_msgSend(v4, "isCelsius"));

    -[NSMeasurementFormatter setUnitOptions:](v3, "setUnitOptions:", 4);
    _HFLocalizedStringWithDefaultValue(CFSTR("HFTemperatureFormatterFallbackTemperatureString"), CFSTR("HFTemperatureFormatterFallbackTemperatureString"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTemperatureFormatter setFallbackTemperatureString:](v3, "setFallbackTemperatureString:", v5);

    +[HFTemperatureUnitCoordinator sharedCoordinator](HFTemperatureUnitCoordinator, "sharedCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerObserver:", v3);

  }
  return v3;
}

- (void)setInputIsCelsius:(BOOL)a3
{
  self->_inputIsCelsius = a3;
}

- (void)setFallbackTemperatureString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (unint64_t)minimumFractionDigits
{
  void *v2;
  unint64_t v3;

  -[NSMeasurementFormatter numberFormatter](self, "numberFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimumFractionDigits");

  return v3;
}

- (unint64_t)maximumFractionDigits
{
  void *v2;
  unint64_t v3;

  -[NSMeasurementFormatter numberFormatter](self, "numberFormatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maximumFractionDigits");

  return v3;
}

- (NSString)fallbackTemperatureString
{
  return self->_fallbackTemperatureString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTemperatureString, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
}

- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnit:(BOOL)a4
{
  -[HFTemperatureFormatter setOutputIsCelsius:](self, "setOutputIsCelsius:", objc_msgSend(a3, "isCelsius"));
}

- (NSString)unitDescription
{
  return (NSString *)_HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerValueRangePickerUnitSuffix_Temperature"), CFSTR("HFCharacteristicTriggerValueRangePickerUnitSuffix_Temperature"), 1);
}

- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4
{
  void *v6;
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  -[HFTemperatureFormatter measurementForObjectValue:](self, "measurementForObjectValue:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
    v10 = objc_alloc(MEMORY[0x1E0CB3A50]);
    if (_MergedGlobals_4_1 != -1)
      dispatch_once(&_MergedGlobals_4_1, &__block_literal_global_10_7);
    v11 = (id)qword_1F03ED310;
    v12 = (void *)objc_msgSend(v10, "initWithSymbol:", v11);
    v13 = objc_msgSend(v7, "initWithDoubleValue:unit:", v12, v9);

    v6 = (void *)v13;
  }
  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)HFTemperatureFormatter;
    -[NSMeasurementFormatter stringForObjectValue:](&v16, sel_stringForObjectValue_, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __56__HFTemperatureFormatter_stringForObjectValue_withUnit___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1F03ED310;
  qword_1F03ED310 = (uint64_t)&stru_1EA741FF8;

}

@end
