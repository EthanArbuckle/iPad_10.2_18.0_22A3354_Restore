@implementation HFCharacteristicEventBuilderItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFCharacteristicEventBuilderItem;
  -[HFEventBuilderItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1EA7289C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString **v10;
  __CFString *v11;
  HFImageIconDescriptor *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_sensingCharacteristicTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke_2;
  v18[3] = &unk_1EA72BB50;
  v19 = v7;
  v9 = v7;
  LODWORD(v7) = objc_msgSend(v8, "na_any:", v18);

  v10 = HFImageIconIdentifierTriggerCharacteristic;
  if ((_DWORD)v7)
    v10 = HFImageIconIdentifierTriggerSensor;
  v11 = *v10;
  v12 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", v11);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("icon"));

  v13 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setResults:", v13);

  v14 = (void *)MEMORY[0x1E0D519C0];
  v15 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v14, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __64__HFCharacteristicEventBuilderItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (NSSet)characteristics
{
  void *v2;
  void *v3;

  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_46_7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

uint64_t __51__HFCharacteristicEventBuilderItem_characteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristic");
}

- (id)setCharacteristics:(id)a3 triggerValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  _QWORD v27[4];
  id v28;
  HFCharacteristicEventBuilderItem *v29;
  id v30;

  v6 = a4;
  v7 = a3;
  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_48_4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_2;
  v27[3] = &unk_1EA73DCE0;
  v10 = v9;
  v28 = v10;
  v29 = self;
  v11 = v6;
  v30 = v11;
  objc_msgSend(v7, "na_map:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFEventBuilderItem representativeEventBuilder](self, "representativeEventBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v12, "copy");
  -[HFEventBuilderItem setEventBuilders:](self, "setEventBuilders:", v18);

  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20 == 1)
  {
    -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "anyObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventBuilderItem setRepresentativeEventBuilder:](self, "setRepresentativeEventBuilder:", v22);

  }
  else if (v15)
  {
    -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFEventBuilderItem representativeEventBuilder](self, "representativeEventBuilder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "containsObject:", v24);

    if ((v25 & 1) == 0)
      -[HFEventBuilderItem setRepresentativeEventBuilder:](self, "setRepresentativeEventBuilder:", 0);
  }

  return v17;
}

id __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)();
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_characteristicEventBuilderForCharacteristic:triggerValue:", v4, *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_3;
  v20[3] = &unk_1EA73DCB8;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v15 = v8;
    v16 = 3221225472;
    v17 = __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_4;
    v18 = &unk_1EA73DCB8;
    v11 = v9;
    v19 = v11;
    objc_msgSend(v6, "na_firstObjectPassingTest:", &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "copyValuesFromCharacteristicEventBuilder:", v11, v15, v16, v17, v18);

  }
  if (v10)
    v12 = v10;
  else
    v12 = v9;
  v13 = v12;

  return v13;
}

uint64_t __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

uint64_t __68__HFCharacteristicEventBuilderItem_setCharacteristics_triggerValue___block_invoke_4()
{
  void *v0;

  v0 = (void *)objc_opt_class();
  return objc_msgSend(v0, "isEqual:", objc_opt_class());
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HFEventBuilderItem eventBuilders](self, "eventBuilders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__HFCharacteristicEventBuilderItem_wouldFireForCharacteristic_value___block_invoke;
  v13[3] = &unk_1EA73DD08;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = objc_msgSend(v8, "na_any:", v13);

  return v11;
}

uint64_t __69__HFCharacteristicEventBuilderItem_wouldFireForCharacteristic_value___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wouldFireForCharacteristic:value:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)_characteristicEventBuilderForCharacteristic:(id)a3 triggerValue:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  HFCharacteristicThresholdRangeEventBuilder *v10;
  HFCharacteristicMultiValueEventBuilder *v11;
  void *v12;
  HFCharacteristicValueEventBuilder *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = -[HFCharacteristicThresholdRangeEventBuilder initWithCharacteristic:thresholdRange:]([HFCharacteristicThresholdRangeEventBuilder alloc], "initWithCharacteristic:thresholdRange:", v5, v9);
LABEL_6:
    v11 = (HFCharacteristicMultiValueEventBuilder *)v10;
    goto LABEL_13;
  }
  if (!v7)
  {
    v10 = -[HFCharacteristicValueEventBuilder initWithCharacteristic:triggerValue:]([HFCharacteristicValueEventBuilder alloc], "initWithCharacteristic:triggerValue:", v5, 0);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CBA4D0], "hf_allTriggerValuesForCharacteristic:similarToValue:", v5, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 1)
  {
    v13 = [HFCharacteristicValueEventBuilder alloc];
    objc_msgSend(v12, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFCharacteristicValueEventBuilder initWithCharacteristic:triggerValue:](v13, "initWithCharacteristic:triggerValue:", v5, v14);

  }
  else
  {
    v11 = -[HFCharacteristicMultiValueEventBuilder initWithCharacteristic:values:]([HFCharacteristicMultiValueEventBuilder alloc], "initWithCharacteristic:values:", v5, v12);
  }

LABEL_13:
  return v11;
}

@end
