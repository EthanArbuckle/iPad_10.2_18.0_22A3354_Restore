@implementation HFHeaterCoolerThresholdControlItem

- (HFHeaterCoolerThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  HFHeaterCoolerThresholdControlItem *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_class();
  v10 = (void *)*MEMORY[0x1E0CB88D8];
  v11 = objc_msgSend(v9, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB88D8], v6);
  v12 = (void *)objc_opt_class();
  v13 = (void *)*MEMORY[0x1E0CB8828];
  v14 = objc_msgSend(v12, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB8828], v6);
  if (v11)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (v15)
  {
    if (v11)
    {
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = v10;
    }
    else
    {
      if (!v14)
      {
        v18 = 0;
        v19 = 0;
        goto LABEL_12;
      }
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = v13;
    }
    objc_msgSend(v16, "setWithObject:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
  }
  else
  {
    v18 = v10;
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v18, v19, 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }

  v8 = (void *)v20;
LABEL_12:
  v23.receiver = self;
  v23.super_class = (Class)HFHeaterCoolerThresholdControlItem;
  v21 = -[HFRangeControlItem initWithValueSource:targetCharacteristicTypes:minimumCharacteristicType:maximumCharacteristicType:displayResults:](&v23, sel_initWithValueSource_targetCharacteristicTypes_minimumCharacteristicType_maximumCharacteristicType_displayResults_, v6, v8, v18, v19, v7);

  return v21;
}

+ (id)readOnlyCharacteristicTypes
{
  if (qword_1F03ED2B8 != -1)
    dispatch_once(&qword_1F03ED2B8, &__block_literal_global_84_0);
  return (id)qword_1F03ED2C0;
}

void __65__HFHeaterCoolerThresholdControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8790];
  v6[0] = *MEMORY[0x1E0CB8AB8];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CB8840];
  v6[2] = *MEMORY[0x1E0CB8890];
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1F03ED2C0;
  qword_1F03ED2C0 = v4;

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

- (unint64_t)rangeModeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    if (objc_msgSend(v7, "integerValue")
      || (-[HFRangeControlItem minimumCharacteristicType](self, "minimumCharacteristicType"),
          (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = 1;
    }
    else
    {
      v10 = (void *)v9;
      -[HFRangeControlItem maximumCharacteristicType](self, "maximumCharacteristicType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v8 = 2;
      else
        v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)targetCharacteristicTypeWithCharacteristicValuesKeyedByType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int16 v26;
  __int16 v27;
  uint8_t v28[16];
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    goto LABEL_20;
  v8 = (void *)objc_opt_class();
  v9 = (void *)*MEMORY[0x1E0CB88D8];
  -[HFControlItem valueSource](self, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "_hasWritableCharacteristicsOfType:valueSource:", v9, v10);

  v12 = (void *)objc_opt_class();
  v13 = (void *)*MEMORY[0x1E0CB8828];
  -[HFControlItem valueSource](self, "valueSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "_hasWritableCharacteristicsOfType:valueSource:", v13, v14);

  v16 = objc_msgSend(v7, "integerValue");
  if (v16 == 1)
  {
    if (!v11)
    {
      HFLogForCategory(0x29uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_19:

        goto LABEL_20;
      }
      v27 = 0;
      v19 = "Heater/Cooler service is in the state HMCharacteristicValueTargetHeaterCoolerStateHeat, but has no heating t"
            "hreshold characteristic";
      v20 = (uint8_t *)&v27;
LABEL_30:
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
      goto LABEL_19;
    }
LABEL_17:
    v17 = v9;
    goto LABEL_27;
  }
  if (v16 == 2)
  {
    if (v15)
    {
      v17 = v13;
LABEL_27:
      v22 = v17;
      goto LABEL_28;
    }
    HFLogForCategory(0x29uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v26 = 0;
    v19 = "Heater/Cooler service is in the state HMCharacteristicValueTargetHeaterCoolerStateCool, but has no cooling thr"
          "eshold characteristic";
    v20 = (uint8_t *)&v26;
    goto LABEL_30;
  }
  if ((v11 & 1) == 0)
  {
    HFLogForCategory(0x29uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_ERROR, "A heater/cooler is in Auto mode, but it doesn't have a HeatingThreshold characteristic. This is not supported in the spec.", buf, 2u);
    }

    if (v15)
      v24 = v13;
    else
      v24 = 0;
    v17 = v24;
    goto LABEL_27;
  }
  if ((v15 & 1) == 0)
  {
    HFLogForCategory(0x29uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_error_impl(&dword_1DD34E000, v21, OS_LOG_TYPE_ERROR, "A heater/cooler is in Auto mode, but it doesn't have a CoolingThreshold characteristic. This is not supported in the spec.", v28, 2u);
    }

    goto LABEL_17;
  }
LABEL_20:
  v22 = 0;
LABEL_28:

  return v22;
}

@end
