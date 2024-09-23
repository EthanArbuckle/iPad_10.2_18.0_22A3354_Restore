@implementation HFTemperatureThresholdControlItem

- (HFTemperatureThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HFTemperatureThresholdControlItem *v23;
  objc_super v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  v9 = (void *)*MEMORY[0x1E0CB8B08];
  if (objc_msgSend(v8, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB8B08], v6))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;
  if (!v11)
  {
    HFLogForCategory(0x29uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "This thermostat doesn't have a writable HMCharacteristicTypeTargetTemperature characteristic, which is required in the spec", buf, 2u);
    }

  }
  v13 = (void *)objc_opt_class();
  v14 = (void *)*MEMORY[0x1E0CB88D8];
  if (objc_msgSend(v13, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB88D8], v6))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;
  v17 = (void *)objc_opt_class();
  v18 = (void *)*MEMORY[0x1E0CB8828];
  if (objc_msgSend(v17, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB8828], v6))
    v19 = v18;
  else
    v19 = 0;
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = v19;
  objc_msgSend(v20, "na_setWithSafeObject:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25.receiver = self;
  v25.super_class = (Class)HFTemperatureThresholdControlItem;
  v23 = -[HFRangeControlItem initWithValueSource:targetCharacteristicTypes:minimumCharacteristicType:maximumCharacteristicType:displayResults:](&v25, sel_initWithValueSource_targetCharacteristicTypes_minimumCharacteristicType_maximumCharacteristicType_displayResults_, v6, v22, v16, v21, v7);

  return v23;
}

+ (id)readOnlyCharacteristicTypes
{
  if (_MergedGlobals_4 != -1)
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_76_0);
  return (id)qword_1F03ED2B0;
}

- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3
{
  void *v3;
  void *v4;

  -[HFRangeControlItem targetCharacteristicTypes](self, "targetCharacteristicTypes", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AC0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    if (objc_msgSend(v7, "integerValue") == 3
      && (-[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType"),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = (void *)v8;
      -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v11 = 2;
      else
        v11 = 1;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)numberValueFormatter
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

void __64__HFTemperatureThresholdControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8890];
  v5[0] = *MEMORY[0x1E0CB8AC0];
  v5[1] = v1;
  v5[2] = *MEMORY[0x1E0CB8848];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1F03ED2B0;
  qword_1F03ED2B0 = v3;

}

@end
