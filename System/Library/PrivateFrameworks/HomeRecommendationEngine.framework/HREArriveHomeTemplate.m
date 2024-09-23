@implementation HREArriveHomeTemplate

- (HREArriveHomeTemplate)init
{
  HREArriveHomeTemplate *v2;
  HREArriveHomeTemplate *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HREArriveHomeTemplate;
  v2 = -[HREActionSetTemplate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HREActionSetTemplate setActionSetType:](v2, "setActionSetType:", *MEMORY[0x24BDD51F8]);
    v4 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x24BE4CE80]);
    -[HREActionSetTemplate setIconDescriptor:](v3, "setIconDescriptor:", v5);

    __29__HREArriveHomeTemplate_init__block_invoke();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v6);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 0.0);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * 5.0 + 1.0);
  }
  return v3;
}

id __29__HREArriveHomeTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_5 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_5, &__block_literal_global_2_3);
  return (id)_block_invoke_na_once_object_376_5;
}

void __29__HREArriveHomeTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_5;
  _block_invoke_na_once_object_376_5 = (uint64_t)CFSTR("arriveHome");

}

- (id)_lazy_actionMap
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[5];
  _QWORD v27[7];

  v27[5] = *MEMORY[0x24BDAC8D0];
  v26[0] = *MEMORY[0x24BDD6C00];
  v2 = *MEMORY[0x24BDD57A0];
  v24[0] = *MEMORY[0x24BDD5970];
  v24[1] = v2;
  v25[0] = MEMORY[0x24BDBD1C8];
  v25[1] = &unk_24F2210E0;
  v3 = *MEMORY[0x24BDD59A8];
  v24[2] = *MEMORY[0x24BDD58D0];
  v24[3] = v3;
  v25[2] = &unk_24F2210F8;
  v25[3] = &unk_24F2210F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  v26[1] = *MEMORY[0x24BDD6B98];
  v22 = *MEMORY[0x24BDD5A60];
  v23 = &unk_24F221110;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v5;
  v26[2] = *MEMORY[0x24BDD6BC0];
  v20 = *MEMORY[0x24BDD5A18];
  v21 = &unk_24F221128;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  v26[3] = *MEMORY[0x24BDD6C30];
  v18 = *MEMORY[0x24BDD5A70];
  v19 = &unk_24F221140;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v9;
  v26[4] = *MEMORY[0x24BDD6C08];
  v16 = *MEMORY[0x24BDD5A50];
  v17 = &unk_24F221128;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_lazy_allowedVariance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  +[HREActionRangeVarianceRule rangeVarianceWithType:min:](HREActionRangeVarianceRule, "rangeVarianceWithType:min:", *MEMORY[0x24BDD57A0], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:](HRECharacteristicActionVarianceRule, "anyVarianceRuleForCharacteristicType:", *MEMORY[0x24BDD58D0], v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  +[HRECharacteristicActionVarianceRule anyVarianceRuleForCharacteristicType:](HRECharacteristicActionVarianceRule, "anyVarianceRuleForCharacteristicType:", *MEMORY[0x24BDD59A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HREActionVarianceCollection varianceRuleCollectionWithRules:](HREActionVarianceCollection, "varianceRuleCollectionWithRules:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
