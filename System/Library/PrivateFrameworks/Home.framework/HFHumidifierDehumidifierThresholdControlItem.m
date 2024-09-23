@implementation HFHumidifierDehumidifierThresholdControlItem

- (HFHumidifierDehumidifierThresholdControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  HFHumidifierDehumidifierThresholdControlItem *v21;
  objc_super v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  v9 = (void *)*MEMORY[0x1E0CB88F0];
  v10 = objc_msgSend(v8, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB88F0], v6);
  v11 = (void *)objc_opt_class();
  v12 = (void *)*MEMORY[0x1E0CB88A8];
  v13 = objc_msgSend(v11, "_hasWritableCharacteristicsOfType:valueSource:", *MEMORY[0x1E0CB88A8], v6);
  if (v10)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (v10)
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = v9;
    }
    else
    {
      if (!v13)
      {
        HFLogForCategory(0x29uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, "A humidifier/dehumidifier service has neither a humidify threshold nor a dehumidify threshold characteristic. We can't do anything with that.", buf, 2u);
        }

        v19 = 0;
        goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = v12;
    }
    objc_msgSend(v15, "setWithObject:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
    v17 = 0;
    v18 = 0;
    goto LABEL_15;
  }
  v17 = v9;
  v18 = v12;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v17, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v23.receiver = self;
  v23.super_class = (Class)HFHumidifierDehumidifierThresholdControlItem;
  v21 = -[HFRangeControlItem initWithValueSource:targetCharacteristicTypes:minimumCharacteristicType:maximumCharacteristicType:displayResults:](&v23, sel_initWithValueSource_targetCharacteristicTypes_minimumCharacteristicType_maximumCharacteristicType_displayResults_, v6, v19, v17, v18, v7);

  return v21;
}

+ (id)readOnlyCharacteristicTypes
{
  if (qword_1F03ED2C8 != -1)
    dispatch_once(&qword_1F03ED2C8, &__block_literal_global_88);
  return (id)qword_1F03ED2D0;
}

void __75__HFHumidifierDehumidifierThresholdControlItem_readOnlyCharacteristicTypes__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB8880];
  v5[0] = *MEMORY[0x1E0CB8AD0];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1F03ED2D0;
  qword_1F03ED2D0 = v3;

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
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AD0]);
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
  void *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint8_t *v22;
  __int16 v24;
  uint8_t v25[2];
  __int16 v26;
  uint8_t buf[16];

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8AD0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    goto LABEL_23;
  v8 = (void *)objc_opt_class();
  v9 = (void *)*MEMORY[0x1E0CB88F0];
  -[HFControlItem valueSource](self, "valueSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "_hasWritableCharacteristicsOfType:valueSource:", v9, v10);

  v12 = (void *)objc_opt_class();
  v13 = (void *)*MEMORY[0x1E0CB88A8];
  -[HFControlItem valueSource](self, "valueSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "_hasWritableCharacteristicsOfType:valueSource:", v13, v14);

  v16 = objc_msgSend(v7, "integerValue");
  if (v16 == 1)
  {
    if (v11)
    {
      v17 = v9;
      goto LABEL_11;
    }
    HFLogForCategory(0x29uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_WORD *)v25 = 0;
    v21 = "Humidifer service is in the state HMCharacteristicValueTargetHumidifierDehumidifierStateHumidify, but has no h"
          "umidify threshold characteristic";
    v22 = v25;
    goto LABEL_26;
  }
  if (v16 != 2)
  {
    if ((v11 & 1) == 0)
    {
      HFLogForCategory(0x29uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "A humidifier/dehumidifier is in Auto mode, but it doesn't have a HumidifierThreshold characteristic. This is not supported in the spec.", buf, 2u);
      }

    }
    if ((v15 & 1) != 0)
      goto LABEL_23;
    HFLogForCategory(0x29uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v26 = 0;
    v21 = "A humidifier/dehumidifier is in Auto mode, but it doesn't have a DehumidifierThreshold characteristic. This is"
          " not supported in the spec.";
    v22 = (uint8_t *)&v26;
    goto LABEL_26;
  }
  if (!v15)
  {
    HFLogForCategory(0x29uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_22:

LABEL_23:
      v18 = 0;
      goto LABEL_24;
    }
    v24 = 0;
    v21 = "Dehumidifier service is in the state HMCharacteristicValueTargetHumidifierDehumidifierStateDehumidify, but has"
          " no dehumidify threshold characteristic";
    v22 = (uint8_t *)&v24;
LABEL_26:
    _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
    goto LABEL_22;
  }
  v17 = v13;
LABEL_11:
  v18 = v17;
LABEL_24:

  return v18;
}

- (id)numberValueFormatter
{
  void *v2;
  void *v3;

  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "percentFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
