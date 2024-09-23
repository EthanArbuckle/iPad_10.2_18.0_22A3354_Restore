@implementation HFHumidityStatusItem

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleHumidity"), CFSTR("HFStatusTitleHumidity"), 1);
}

+ (id)sensorServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A40], 0);
}

+ (id)controllableServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB9A38], *MEMORY[0x1E0CB9B00], 0);
}

+ (BOOL)shouldShowAverageForRange:(id)a3
{
  return 0;
}

+ (id)currentValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB8880];
}

+ (id)targetValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB8AF8];
}

+ (id)targetModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8AD0], 0);
}

+ (unint64_t)statusItemCategory
{
  return 2;
}

+ (id)overrideValueDisplayRange
{
  return +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", &unk_1EA7CCAA8, &unk_1EA7CCAC0);
}

+ (id)minimumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB88F0];
}

+ (id)maximumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x1E0CB88A8];
}

+ (BOOL)isPercentRange
{
  return 1;
}

+ (id)currentModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8858], 0);
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  return -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", CFSTR("humidity.fill"));
}

+ (id)unknownValueDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusHumidityStateUnknown"), CFSTR("HFStatusHumidityStateUnknown"), 1);
}

+ (id)displayValueComparator
{
  return &__block_literal_global_153;
}

uint64_t __46__HFHumidityStatusItem_displayValueComparator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__HFHumidityStatusItem_displayValueComparator__block_invoke_2;
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
      return __46__HFHumidityStatusItem_displayValueComparator__block_invoke_2((uint64_t)v4);
  }
  return result;
}

uint64_t __46__HFHumidityStatusItem_displayValueComparator__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3);

  return v4;
}

+ (id)titleStringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  _HFLocalizedStringWithDefaultValue(off_1EA738D98[a3], off_1EA738D98[a3], 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)abstractTargetModeInResponse:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;

  v3 = *MEMORY[0x1E0CB8790];
  v4 = a3;
  objc_msgSend(v4, "responseForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8AD0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "BOOLValue"))
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = +[HFTargetRangeUtilities rangeModeForTargetHumidifierDehumidifierState:](HFTargetRangeUtilities, "rangeModeForTargetHumidifierDehumidifierState:", objc_msgSend(v8, "integerValue"));

  return v10;
}

+ (unint64_t)abstractCurrentModeInResponse:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;

  v3 = *MEMORY[0x1E0CB8858];
  v4 = a3;
  objc_msgSend(v4, "responseForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueWithExpectedClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "responseForCharacteristicType:", *MEMORY[0x1E0CB8790]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "BOOLValue"))
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_msgSend(v6, "integerValue");
    if (v11 == 3)
      v10 = 2;
    else
      v10 = v11 == 2;
  }

  return v10;
}

@end
