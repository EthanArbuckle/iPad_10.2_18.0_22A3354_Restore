@implementation HFCharacteristicTriggerBuilderInterface

- (NSSet)characteristics
{
  void *v2;
  void *v3;

  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setCharacteristic:(id)a3 triggerValue:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  HFCharacteristicValueEventBuilder *v12;
  HFCharacteristicValueEventBuilder *v13;
  HFCharacteristicMultiValueEventBuilder *v14;
  HFCharacteristicValueEventBuilder *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = v17;
  v9 = v7;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFEventTriggerBuilder+LegacyInterfaces.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic"));

    v8 = 0;
  }
  -[HFCharacteristicTriggerBuilderInterface removeCharacteristic:](self, "removeCharacteristic:", v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CBA4D0], "hf_allTriggerValuesForCharacteristic:similarToValue:", v17, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v12 = (HFCharacteristicValueEventBuilder *)objc_claimAutoreleasedReturnValue();
    if (v11 == 1)
    {
      v13 = [HFCharacteristicValueEventBuilder alloc];
      objc_msgSend(v10, "anyObject");
      v14 = (HFCharacteristicMultiValueEventBuilder *)objc_claimAutoreleasedReturnValue();
      v15 = -[HFCharacteristicValueEventBuilder initWithCharacteristic:triggerValue:](v13, "initWithCharacteristic:triggerValue:", v17, v14);
      -[HFCharacteristicValueEventBuilder addEventBuilder:](v12, "addEventBuilder:", v15);

    }
    else
    {
      v14 = -[HFCharacteristicMultiValueEventBuilder initWithCharacteristic:values:]([HFCharacteristicMultiValueEventBuilder alloc], "initWithCharacteristic:values:", v17, v10);
      -[HFCharacteristicValueEventBuilder addEventBuilder:](v12, "addEventBuilder:", v14);
    }

  }
  else
  {
    -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFCharacteristicValueEventBuilder initWithCharacteristic:triggerValue:]([HFCharacteristicValueEventBuilder alloc], "initWithCharacteristic:triggerValue:", v17, 0);
    objc_msgSend(v10, "addEventBuilder:", v12);
  }

}

- (void)setCharacteristic:(id)a3 triggerValueRange:(id)a4
{
  id v7;
  void *v8;
  HFCharacteristicThresholdRangeEventBuilder *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFEventTriggerBuilder+LegacyInterfaces.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characteristic"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFEventTriggerBuilder+LegacyInterfaces.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerValueRange"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[HFCharacteristicTriggerBuilderInterface removeCharacteristic:](self, "removeCharacteristic:", v12);
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFCharacteristicThresholdRangeEventBuilder initWithCharacteristic:thresholdRange:]([HFCharacteristicThresholdRangeEventBuilder alloc], "initWithCharacteristic:thresholdRange:", v12, v7);
  objc_msgSend(v8, "addEventBuilder:", v9);

}

- (void)removeCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventBuilders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke;
  v12[3] = &unk_1EA731398;
  v13 = v4;
  v14 = v5;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v7, "na_each:", v12);

  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke_2;
  v11[3] = &unk_1EA729BE0;
  v11[4] = self;
  objc_msgSend(v9, "na_each:", v11);

}

void __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v3 = v8;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

void __64__HFCharacteristicTriggerBuilderInterface_removeCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventBuilder:", v3);

}

- (void)removeAllCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_205);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HFCharacteristicTriggerBuilderInterface_removeAllCharacteristics__block_invoke_2;
  v6[3] = &unk_1EA729BE0;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);

}

uint64_t __67__HFCharacteristicTriggerBuilderInterface_removeAllCharacteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1F03F70F0);
}

void __67__HFCharacteristicTriggerBuilderInterface_removeAllCharacteristics__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "triggerBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeEventBuilder:", v3);

}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventBuilders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__HFCharacteristicTriggerBuilderInterface_wouldFireForCharacteristic_value___block_invoke;
  v14[3] = &unk_1EA73DB10;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = objc_msgSend(v9, "na_any:", v14);

  return v12;
}

uint64_t __76__HFCharacteristicTriggerBuilderInterface_wouldFireForCharacteristic_value___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  v7 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    if (!v9)
      goto LABEL_15;
    goto LABEL_13;
  }
  objc_msgSend(v6, "triggerValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40));

  if ((v12 & 1) == 0)
  {
LABEL_10:
    if (!v9)
      goto LABEL_15;
LABEL_13:
    if ((objc_msgSend(v9, "hf_wouldFireForValue:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      goto LABEL_14;
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
LABEL_14:
  v13 = 1;
LABEL_16:

  return v13;
}

- (id)thresholdValueForCharacteristic:(id)a3 thresholdValueRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventBuilders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __95__HFCharacteristicTriggerBuilderInterface_thresholdValueForCharacteristic_thresholdValueRange___block_invoke;
  v22 = &unk_1EA73DB10;
  v10 = v7;
  v23 = v10;
  v11 = v6;
  v24 = v11;
  objc_msgSend(v9, "na_firstObjectPassingTest:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    objc_msgSend(v15, "thresholdRange", v19, v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hf_thresholdValueForRange:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

BOOL __95__HFCharacteristicTriggerBuilderInterface_thresholdValueForCharacteristic_thresholdValueRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "minValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_10;
  v8 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 32), "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hf_minimumTriggerValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (!v11)
  {
LABEL_10:
    if (v6)
    {
      objc_msgSend(v6, "thresholdRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "maxValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v6, "thresholdRange");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "maxValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "hf_maximumTriggerValue");
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v23 = (void *)v22;
        v17 = objc_msgSend(v21, "compare:", v22) == 0;

LABEL_19:
        goto LABEL_20;
      }
LABEL_18:
      v17 = 1;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "maxValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    if (v6)
      goto LABEL_14;
LABEL_17:
    v17 = 0;
    goto LABEL_20;
  }
  v13 = (void *)v12;
  objc_msgSend(*(id *)(a1 + 32), "maxValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "hf_maximumTriggerValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15);

  v17 = 0;
  if (!v16 && v6)
  {
LABEL_14:
    objc_msgSend(v6, "thresholdRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "minValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v6, "thresholdRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "minValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "hf_minimumTriggerValue");
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_20:

  return v17;
}

- (id)triggerValueForCharacteristic:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HFEventTriggerBuilderInterface triggerBuilder](self, "triggerBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_96);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __73__HFCharacteristicTriggerBuilderInterface_triggerValueForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  v6 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v5)
  {
    objc_msgSend(v5, "triggerValue");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v8)
    {
      v10 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v8, "thresholdRange");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_12:

  return v10;
}

@end
