@implementation HFTemperatureStatusItem

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleTemperature"), CFSTR("HFStatusTitleTemperature"), 1);
}

+ (id)sensorServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9AF8], 0);
}

+ (id)controllableServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9B00], *MEMORY[0x1E0CB9A30], 0);
}

+ (BOOL)shouldShowAverageForRange:(id)a3
{
  return 0;
}

+ (id)currentValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB8890];
}

+ (id)targetValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB8B08];
}

+ (id)targetModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8AC0], *MEMORY[0x1E0CB8AB8], 0);
}

+ (unint64_t)statusItemCategory
{
  return 2;
}

+ (id)overrideValueDisplayRange
{
  return +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", &unk_1EA7CD5D0, &unk_1EA7CD5E8);
}

+ (id)minimumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB88D8];
}

+ (id)maximumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB8828];
}

+ (id)customValueFormatter
{
  void *v2;
  void *v3;

  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temperatureFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setInputIsCelsius:", 1);
  return v3;
}

+ (id)currentModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8848], *MEMORY[0x1E0CB8840], 0);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  return -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("thermometer"));
}

+ (id)unknownValueDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTemperatureStateUnknown"), CFSTR("HFStatusTemperatureStateUnknown"), 1);
}

+ (id)displayValueComparator
{
  return &__block_literal_global_227;
}

uint64_t __49__HFTemperatureStatusItem_displayValueComparator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__HFTemperatureStatusItem_displayValueComparator__block_invoke_2;
  v4[3] = &unk_1EA72F480;
  v4[4] = a2;
  v4[5] = a3;
  if (a2)
    result = -1;
  else
    result = a3 != 0;
  if (a2)
  {
    if (a3)
      return __49__HFTemperatureStatusItem_displayValueComparator__block_invoke_2((uint64_t)v4);
  }
  return result;
}

uint64_t __49__HFTemperatureStatusItem_displayValueComparator__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  +[HFTemperatureUnitCoordinator sharedCoordinator](HFTemperatureUnitCoordinator, "sharedCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCelsius");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(*(id *)(a1 + 32), "doubleValue");
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithDoubleValue:unit:", v9, v8);

    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "measurementByConvertingToUnit:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    objc_msgSend(v11, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB3758]);
    objc_msgSend(*(id *)(a1 + 40), "doubleValue");
    v17 = v16;
    objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithDoubleValue:unit:", v18, v17);

    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "measurementByConvertingToUnit:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v20, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v24 = objc_msgSend(v4, "compare:", v5);

  return v24;
}

+ (BOOL)isPercentRange
{
  return 0;
}

+ (id)titleStringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  _HFLocalizedStringWithDefaultValue(off_1EA7400F0[a3], off_1EA7400F0[a3], 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)abstractTargetModeInResponse:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[HFTemperatureItemUtilities targetHeatingCoolingModeValueInResponse:](HFThermostatItemUtilities, "targetHeatingCoolingModeValueInResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", objc_msgSend(v3, "integerValue"));
  else
    v5 = 0;

  return v5;
}

+ (unint64_t)abstractCurrentModeInResponse:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[HFTemperatureItemUtilities currentHeatingCoolingModeValueInResponse:](HFThermostatItemUtilities, "currentHeatingCoolingModeValueInResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", objc_msgSend(v3, "integerValue"));
  else
    v5 = 0;

  return v5;
}

@end
