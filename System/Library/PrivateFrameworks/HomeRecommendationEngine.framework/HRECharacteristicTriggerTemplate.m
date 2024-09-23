@implementation HRECharacteristicTriggerTemplate

- (HRECharacteristicTriggerTemplate)init
{
  HRECharacteristicTriggerTemplate *v2;
  HRECharacteristicTriggerTemplate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HRECharacteristicTriggerTemplate;
  v2 = -[HRETemplate init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HRECharacteristicTriggerTemplate setCharacteristicPerServiceRule:](v2, "setCharacteristicPerServiceRule:", 0);
    -[HRECharacteristicTriggerTemplate setEnforcePriority:](v3, "setEnforcePriority:", 0);
    -[HRECharacteristicTriggerTemplate setAllowMultipleEventsFeature:](v3, "setAllowMultipleEventsFeature:", 0);
    -[HRECharacteristicTriggerTemplate setSingleRecommendationPerSplit:](v3, "setSingleRecommendationPerSplit:", 0);
  }
  return v3;
}

- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  id v6;
  id v7;
  HRERecommendationEmptyTriggerBuilderContext *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
  v9 = objc_alloc(MEMORY[0x24BE4D090]);
  objc_msgSend(v6, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithHome:context:", v10, v8);

  objc_msgSend(v6, "splitCharacteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "splitCharacteristic");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (!-[HRECharacteristicTriggerTemplate allowMultipleEventsFeature](self, "allowMultipleEventsFeature"))
    {
      v21 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "na_flatMap:", &__block_literal_global_1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_2;
    v25[3] = &unk_24F216CF8;
    v25[4] = self;
    objc_msgSend(v15, "na_filter:", v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_4;
  v23[3] = &unk_24F217218;
  v23[4] = self;
  v18 = v11;
  v24 = v18;
  objc_msgSend(v17, "na_each:", v23);
  objc_msgSend(v18, "characteristics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
    v21 = v18;
  else
    v21 = 0;

LABEL_9:
  return v21;
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_characteristics");
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "triggerCharacteristicValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_3;
  v8[3] = &unk_24F2171C8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v11 = a2;
  if (objc_msgSend(v11, "isNotificationEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "triggerCharacteristicValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_5;
    v16[3] = &unk_24F2171C8;
    v5 = v11;
    v17 = v5;
    objc_msgSend(v3, "na_firstObjectPassingTest:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD7648], "hf_allTriggerValuesForCharacteristic:similarToValue:", v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
        objc_msgSend(v8, "unionSet:", v9);
      objc_msgSend(v8, "addObject:", v7);

    }
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_6;
    v12[3] = &unk_24F2171F0;
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    v15 = v7;
    v10 = v7;
    objc_msgSend(v8, "na_each:", v12);

  }
}

uint64_t __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __90__HRECharacteristicTriggerTemplate__subclass_triggerBuilderForRecommendation_withObjects___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "characteristicInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCharacteristic:triggerValueRange:", *(_QWORD *)(a1 + 40), v5);
LABEL_8:

    goto LABEL_9;
  }
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "characteristicInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCharacteristic:triggerValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_8;
  }
LABEL_9:

}

- (NSArray)triggerCharacteristicValues
{
  return self->_triggerCharacteristicValues;
}

- (void)setTriggerCharacteristicValues:(id)a3
{
  objc_storeStrong((id *)&self->_triggerCharacteristicValues, a3);
}

- (NSArray)characteristicTypePriority
{
  return self->_characteristicTypePriority;
}

- (void)setCharacteristicTypePriority:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicTypePriority, a3);
}

- (BOOL)characteristicPerServiceRule
{
  return self->_characteristicPerServiceRule;
}

- (void)setCharacteristicPerServiceRule:(BOOL)a3
{
  self->_characteristicPerServiceRule = a3;
}

- (BOOL)enforcePriority
{
  return self->_enforcePriority;
}

- (void)setEnforcePriority:(BOOL)a3
{
  self->_enforcePriority = a3;
}

- (BOOL)singleRecommendationPerSplit
{
  return self->_singleRecommendationPerSplit;
}

- (void)setSingleRecommendationPerSplit:(BOOL)a3
{
  self->_singleRecommendationPerSplit = a3;
}

- (BOOL)allowMultipleEventsFeature
{
  return self->_allowMultipleEventsFeature;
}

- (void)setAllowMultipleEventsFeature:(BOOL)a3
{
  self->_allowMultipleEventsFeature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicTypePriority, 0);
  objc_storeStrong((id *)&self->_triggerCharacteristicValues, 0);
}

@end
