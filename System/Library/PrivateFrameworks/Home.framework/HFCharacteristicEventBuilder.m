@implementation HFCharacteristicEventBuilder

- (id)_initWithEvent:(id)a3
{
  id v5;
  void *v6;
  HFCharacteristicEventBuilder *v7;
  uint64_t v8;
  HMCharacteristic *characteristic;
  HFCharacteristicEventBuilder *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_1F03F70F0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicEventBuilder.m"), 29, CFSTR("Event must be characteristic event: %@"), v6);

    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HFCharacteristicEventBuilder;
    v7 = -[HFEventBuilder initWithEvent:](&v13, sel_initWithEvent_, v6);
    if (v7)
    {
      objc_msgSend(v6, "characteristic");
      v8 = objc_claimAutoreleasedReturnValue();
      characteristic = v7->_characteristic;
      v7->_characteristic = (HMCharacteristic *)v8;

    }
    self = v7;
    v10 = self;
  }

  return v10;
}

- (id)_initWithCharacteristic:(id)a3
{
  id v5;
  HFCharacteristicEventBuilder *v6;
  HFCharacteristicEventBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFCharacteristicEventBuilder;
  v6 = -[HFEventBuilder initWithEvent:](&v9, sel_initWithEvent_, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_characteristic, a3);

  return v7;
}

- (void)copyValuesFromCharacteristicEventBuilder:(id)a3
{
  HMCharacteristic *v4;
  HMCharacteristic *characteristic;

  objc_msgSend(a3, "characteristic");
  v4 = (HMCharacteristic *)objc_claimAutoreleasedReturnValue();
  characteristic = self->_characteristic;
  self->_characteristic = v4;

}

- (id)triggeringValues
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicEventBuilder.m"), 55, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFCharacteristicEventBuilder triggeringValues]", objc_opt_class());

  return 0;
}

- (BOOL)wouldFireForCharacteristic:(id)a3 value:(id)a4
{
  return 0;
}

- (id)eventType
{
  return CFSTR("HFEventTypeCharacteristic");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HFCharacteristicEventBuilder *v5;
  HFCharacteristicEventBuilder *v6;
  HFCharacteristicEventBuilder *v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  v5 = (HFCharacteristicEventBuilder *)v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v5 == self)
  {
    v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HFCharacteristicEventBuilder;
    v8 = 0;
    if (-[HFCharacteristicEventBuilder isEqual:](&v12, sel_isEqual_, v5) && v7)
    {
      -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicEventBuilder characteristic](v7, "characteristic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "isEqual:", v10);

    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HFCharacteristicEventBuilder characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

+ (id)characteristicEventBuildersForEvents:(id)a3 inHome:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_2;
  v10[3] = &unk_1EA727700;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "na_each:", v10);

  return v8;
}

id __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_3;
  v9[3] = &unk_1EA727670;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_4;
  v7[3] = &unk_1EA7276D8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "na_each:", v7);

}

id __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_3(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  HFCharacteristicThresholdRangeEventBuilder *v15;
  HFCharacteristicThresholdRangeEventBuilder *v16;

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

  if (v6)
  {
    v10 = (void *)MEMORY[0x1E0CBA4D0];
    objc_msgSend(v7, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_representativeTriggerValueForCharacteristic:similarToValue:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v9)
    {
      v13 = 0;
      goto LABEL_12;
    }
    v14 = *(void **)(a1 + 32);
    v15 = [HFCharacteristicThresholdRangeEventBuilder alloc];
    objc_msgSend(v7, "characteristic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "thresholdRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HFCharacteristicThresholdRangeEventBuilder initWithCharacteristic:thresholdRange:](v15, "initWithCharacteristic:thresholdRange:", v11, v12);
    objc_msgSend(v14, "addObject:", v16);

    v13 = 0;
  }

LABEL_12:
  return v13;
}

void __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  HFCharacteristicValueEventBuilder *v7;
  void *v8;
  HFCharacteristicValueEventBuilder *v9;
  void *v10;
  void *v11;
  HFCharacteristicMultiValueEventBuilder *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count") == 1)
  {
    v6 = *(void **)(a1 + 32);
    v7 = [HFCharacteristicValueEventBuilder alloc];
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[HFCharacteristicValueEventBuilder initWithEvent:](v7, "initWithEvent:", v8);
    objc_msgSend(v6, "addObject:", v9);
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "characteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "na_map:", &__block_literal_global_66);
    v9 = (HFCharacteristicValueEventBuilder *)objc_claimAutoreleasedReturnValue();

    v12 = -[HFCharacteristicMultiValueEventBuilder initWithCharacteristic:values:]([HFCharacteristicMultiValueEventBuilder alloc], "initWithCharacteristic:values:", v8, v9);
    -[HFCharacteristicMultiValueEventBuilder setRepresentativeTargetValue:](v12, "setRepresentativeTargetValue:", v13);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

  }
}

uint64_t __76__HFCharacteristicEventBuilder_characteristicEventBuildersForEvents_inHome___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerValue");
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end
