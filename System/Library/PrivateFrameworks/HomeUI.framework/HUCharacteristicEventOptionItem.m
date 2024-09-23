@implementation HUCharacteristicEventOptionItem

- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 triggerValue:(id)a4
{
  id v7;
  id v8;
  HUCharacteristicEventOptionItem *v9;
  HUCharacteristicEventOptionItem *v10;
  uint64_t v11;
  NSCopying *triggerValue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUCharacteristicEventOptionItem;
  v9 = -[HUCharacteristicEventOptionItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristics, a3);
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    triggerValue = v10->_triggerValue;
    v10->_triggerValue = (NSCopying *)v11;

  }
  return v10;
}

- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 triggerValueRange:(id)a4
{
  id v7;
  id v8;
  HUCharacteristicEventOptionItem *v9;
  HUCharacteristicEventOptionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCharacteristicEventOptionItem;
  v9 = -[HUCharacteristicEventOptionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristics, a3);
    objc_storeStrong((id *)&v10->_triggerValueRange, a4);
  }

  return v10;
}

- (HUCharacteristicEventOptionItem)initWithCharacteristics:(id)a3 thresholdValueRange:(id)a4
{
  id v7;
  id v8;
  HUCharacteristicEventOptionItem *v9;
  HUCharacteristicEventOptionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCharacteristicEventOptionItem;
  v9 = -[HUCharacteristicEventOptionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_characteristics, a3);
    objc_storeStrong((id *)&v10->_thresholdValueRange, a4);
  }

  return v10;
}

- (HUCharacteristicEventOptionItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCharacteristicEventOptionItem.m"), 56, CFSTR("Use -initWithCharacteristics:triggerValue:"));

  return 0;
}

- (void)setThresholdValue:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_thresholdValue, a3);
  -[HUCharacteristicEventOptionItem childItem](self, "childItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUCharacteristicEventOptionItem childItem](self, "childItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setThresholdValue:", v7);

  }
}

- (HMCharacteristic)mainCharacteristic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  HMCharacteristic *v10;
  _QWORD v12[4];
  id v13;

  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HUCharacteristicEventOptionItem_mainCharacteristic__block_invoke;
  v12[3] = &unk_1E6F4EE30;
  v13 = v5;
  v7 = v5;
  v8 = objc_msgSend(v6, "na_any:", v12);

  if (v8)
    v9 = 0;
  else
    v9 = v4;
  v10 = v9;

  return v10;
}

uint64_t __53__HUCharacteristicEventOptionItem_mainCharacteristic__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (NSArray)validTriggerValues
{
  void *v3;
  void *v4;
  void *v5;

  -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_triggerValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (NSArray)visibleTriggerValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;

  -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_visibleTriggerValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CBA4D0];
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__HUCharacteristicEventOptionItem_visibleTriggerValues__block_invoke;
    v12[3] = &unk_1E6F54A30;
    v13 = v7;
    v14 = v8;
    v9 = v8;
    objc_msgSend(v4, "na_filter:", v12);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }

  return (NSArray *)v4;
}

uint64_t __55__HUCharacteristicEventOptionItem_visibleTriggerValues__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;

  objc_msgSend(*(id *)(a1 + 32), "stringForObjectValue:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3);
  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  return v4 ^ 1u;
}

- (HMNumberRange)triggerValueRangeByApplyingThreshold
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;

  -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HUCharacteristicEventOptionItem thresholdValue](self, "thresholdValue");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "minValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "maxValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != v10)
      {
        -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "maxValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUCharacteristicEventOptionItem thresholdValue](self, "thresholdValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "hf_valueBeforeTriggerValue:", v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)MEMORY[0x1E0CBA718];
          -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hf_minimumTriggerValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v28;
          v22 = v20;
          v23 = v17;
          goto LABEL_11;
        }
        -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "minValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUCharacteristicEventOptionItem thresholdValue](self, "thresholdValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "hf_valueAfterTriggerValue:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = (void *)MEMORY[0x1E0CBA718];
          -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hf_maximumTriggerValue");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v18;
          v22 = v17;
          v23 = v20;
LABEL_11:
          objc_msgSend(v21, "numberRangeWithMinValue:maxValue:", v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          return (HMNumberRange *)v24;
        }
      }
    }
    else
    {

    }
  }
  -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  return (HMNumberRange *)v24;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    NSLog(CFSTR("Must have characteristics"));
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CBA718];
      -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberRangeWithMinValue:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "maxValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v24 = (void *)MEMORY[0x1E0CBA718];
      -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "maxValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberRangeWithMaxValue:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v14;

LABEL_12:
    v25 = (void *)MEMORY[0x1E0CBA4D0];
    -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValueRange:thresholdValue:", v26, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0CBA4D0];
    -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCharacteristicEventOptionItem thresholdValue](self, "thresholdValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringForObjectValue:", v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v29;
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EF3480F0))
      v31 = v19;
    else
      v31 = 0;
    v32 = v31;

    if (v32
      && (objc_msgSend(v32, "unitDescription"), v33 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v33,
                                                v33))
    {
      objc_msgSend(v32, "unitDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D30D30]);
    }
    else
    {
      -[HUCharacteristicEventOptionItem mainCharacteristic](self, "mainCharacteristic");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "characteristicType");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0CB8860]))
      {
        HFLocalizedString();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D30D30]);

      }
    }

    goto LABEL_21;
  }
  v17 = (void *)MEMORY[0x1E0CBA4D0];
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCharacteristicEventOptionItem representativeTriggerValue](self, "representativeTriggerValue");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
LABEL_21:

  if (v20)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30D18]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v20);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D30BA0]);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  -[HUCharacteristicEventOptionItem childItem](self, "childItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)MEMORY[0x1E0C99E60];
    -[HUCharacteristicEventOptionItem childItem](self, "childItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithObject:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30B58]);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D30B58]);
  }

  -[HUCharacteristicEventOptionItem visibleTriggerValues](self, "visibleTriggerValues");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D30EF8]);

  objc_msgSend(v7, "na_safeSetObject:forKey:", v21, *MEMORY[0x1E0D30C08]);
  v43 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "futureWithResult:", v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  return v16;
}

- (BOOL)isValidThresholdValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v4, "compare:", v6) == -1)
  {
    v9 = 0;
  }
  else if (v8)
  {
    v9 = objc_msgSend(v4, "compare:", v8) != 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)localizedDescriptionForThresholdValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CBA4D0];
  v5 = a3;
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)localizedListDescriptionForThresholdValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;

  v4 = a3;
  -[HUCharacteristicEventOptionItem latestResults](self, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)MEMORY[0x1E0CBA4D0];
  -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v10, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:visibleTriggerValues:", v11, v4, v9);
  else
    objc_msgSend(v10, "hf_triggerValueNaturalLanguageDescriptionWithCharacteristics:triggerValue:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCharacteristicEventOptionItem latestResults](self, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D30]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CBA4D0];
    -[HUCharacteristicEventOptionItem characteristics](self, "characteristics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF3480F0))
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    if (v20)
    {
      objc_msgSend(v20, "stringForObjectValue:withUnit:", v4, 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
    }

  }
  return v12;
}

- (id)representativeTriggerValue
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      -[HUCharacteristicEventOptionItem thresholdValueRange](self, "thresholdValueRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minValue");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[HUCharacteristicEventOptionItem triggerValue](self, "triggerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v4 = v8;
      v7 = v4;
    }
    else
    {
      -[HUCharacteristicEventOptionItem triggerValueRange](self, "triggerValueRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_representativeValue");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v4 = 0;
    }
  }

  return v7;
}

- (NSSet)characteristics
{
  return self->_characteristics;
}

- (NSCopying)triggerValue
{
  return self->_triggerValue;
}

- (HMNumberRange)triggerValueRange
{
  return self->_triggerValueRange;
}

- (HMNumberRange)thresholdValueRange
{
  return self->_thresholdValueRange;
}

- (HUCharacteristicEventOptionItem)childItem
{
  return self->_childItem;
}

- (void)setChildItem:(id)a3
{
  objc_storeStrong((id *)&self->_childItem, a3);
}

- (NSNumber)thresholdValue
{
  return self->_thresholdValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdValue, 0);
  objc_storeStrong((id *)&self->_childItem, 0);
  objc_storeStrong((id *)&self->_thresholdValueRange, 0);
  objc_storeStrong((id *)&self->_triggerValueRange, 0);
  objc_storeStrong((id *)&self->_triggerValue, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end
