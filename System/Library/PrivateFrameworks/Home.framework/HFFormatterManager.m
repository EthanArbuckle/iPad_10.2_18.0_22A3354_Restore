@implementation HFFormatterManager

- (HFTemperatureFormatter)temperatureFormatter
{
  HFTemperatureFormatter *temperatureFormatter;

  temperatureFormatter = self->_temperatureFormatter;
  if (!temperatureFormatter)
  {
    NSLog(CFSTR("No temperature formatter has been registered!"), a2);
    temperatureFormatter = self->_temperatureFormatter;
  }
  return (HFTemperatureFormatter *)-[HFTemperatureFormatter copyWithZone:](temperatureFormatter, "copyWithZone:", MEMORY[0x1DF0DA77C]());
}

+ (id)sharedInstance
{
  if (qword_1ED379110 != -1)
    dispatch_once(&qword_1ED379110, &__block_literal_global_94);
  return (id)_MergedGlobals_254;
}

- (HFPercentFormatter)percentFormatter
{
  HFPercentFormatter *percentFormatter;

  percentFormatter = self->_percentFormatter;
  if (!percentFormatter)
  {
    NSLog(CFSTR("No Percent formatter has been registered!"), a2);
    percentFormatter = self->_percentFormatter;
  }
  return (HFPercentFormatter *)-[HFPercentFormatter copyWithZone:](percentFormatter, "copyWithZone:", MEMORY[0x1DF0DA77C]());
}

void __36__HFFormatterManager_sharedInstance__block_invoke()
{
  HFFormatterManager *v0;
  void *v1;

  v0 = objc_alloc_init(HFFormatterManager);
  v1 = (void *)_MergedGlobals_254;
  _MergedGlobals_254 = (uint64_t)v0;

}

- (HFFormatterManager)init
{
  HFFormatterManager *v2;
  HFTemperatureFormatter *v3;
  HFTemperatureFormatter *temperatureFormatter;
  HFPercentFormatter *v5;
  HFPercentFormatter *percentFormatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFFormatterManager;
  v2 = -[HFFormatterManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HFTemperatureFormatter);
    temperatureFormatter = v2->_temperatureFormatter;
    v2->_temperatureFormatter = v3;

    v5 = objc_alloc_init(HFPercentFormatter);
    percentFormatter = v2->_percentFormatter;
    v2->_percentFormatter = v5;

    -[HFPercentFormatter setNumberStyle:](v2->_percentFormatter, "setNumberStyle:", 3);
    -[HFPercentFormatter setMaximumFractionDigits:](v2->_percentFormatter, "setMaximumFractionDigits:", 0);
  }
  return v2;
}

- (void)registerTemperatureFormatter:(id)a3
{
  id v4;
  HFTemperatureFormatter *v5;
  HFTemperatureFormatter *temperatureFormatter;

  v4 = a3;
  v5 = (HFTemperatureFormatter *)objc_msgSend(v4, "copyWithZone:", MEMORY[0x1DF0DA77C]());

  temperatureFormatter = self->_temperatureFormatter;
  self->_temperatureFormatter = v5;

}

- (id)timeIntervalFormatter
{
  HFTimeIntervalFormatter *v2;

  v2 = objc_alloc_init(HFTimeIntervalFormatter);
  -[NSDateComponentsFormatter setUnitsStyle:](v2, "setUnitsStyle:", 3);
  -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2, "setZeroFormattingBehavior:", 14);
  return v2;
}

- (id)arcDegreeFormatter
{
  return -[HFMeasurementFormatter initWithMeasurementBlock:]([HFMeasurementFormatter alloc], "initWithMeasurementBlock:", &__block_literal_global_9_7);
}

id __40__HFFormatterManager_arcDegreeFormatter__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CB3758];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithDoubleValue:unit:", v7, v6);

  return v8;
}

- (id)luxFormatter
{
  HFMeasurementFormatter *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = -[HFMeasurementFormatter initWithMeasurementBlock:]([HFMeasurementFormatter alloc], "initWithMeasurementBlock:", &__block_literal_global_12_6);
  -[NSMeasurementFormatter setUnitStyle:](v2, "setUnitStyle:", 3);
  -[NSMeasurementFormatter numberFormatter](v2, "numberFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMaximumSignificantDigits:", 3);

  -[NSMeasurementFormatter numberFormatter](v2, "numberFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumFractionDigits:", 1);

  -[NSMeasurementFormatter numberFormatter](v2, "numberFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsesSignificantDigits:", 1);

  return v2;
}

id __34__HFFormatterManager_luxFormatter__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CB3758];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "doubleValue");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0CB3AC8], "lux");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithDoubleValue:unit:", v7, v6);

  return v8;
}

- (id)BOOLeanFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", &__block_literal_global_16_2);
}

id __38__HFFormatterManager_BOOLeanFormatter__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;

  if (objc_msgSend(a2, "BOOLValue"))
    v2 = CFSTR("HFCharacteristicValueTrue");
  else
    v2 = CFSTR("HFCharacteristicValueFalse");
  _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)identityFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", &__block_literal_global_21_6);
}

id __39__HFFormatterManager_identityFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)emptyStringFormatter
{
  return +[HFValueSetFormatter formatterWithStringProvider:](HFValueSetFormatter, "formatterWithStringProvider:", &__block_literal_global_23_1);
}

const __CFString *__42__HFFormatterManager_emptyStringFormatter__block_invoke()
{
  return &stru_1EA741FF8;
}

- (id)relativeDateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateStyle:", 3);
  objc_msgSend(v2, "setTimeStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDoesRelativeDateFormatting:", 1);
  return v2;
}

- (id)timeFormatter
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateStyle:", 0);
  objc_msgSend(v2, "setTimeStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v4);

  return v2;
}

- (void)setTemperatureFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureFormatter, a3);
}

- (void)setPercentFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_percentFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentFormatter, 0);
  objc_storeStrong((id *)&self->_temperatureFormatter, 0);
}

@end
