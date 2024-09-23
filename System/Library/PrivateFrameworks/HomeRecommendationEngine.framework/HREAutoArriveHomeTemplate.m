@implementation HREAutoArriveHomeTemplate

- (HREAutoArriveHomeTemplate)init
{
  HREAutoArriveHomeTemplate *v2;
  HREAutoArriveHomeTemplate *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HREAutoArriveHomeTemplate;
  v2 = -[HRETemplate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HREPresenceTriggerTemplate setPresenceType:](v2, "setPresenceType:", 3);
    -[HREPresenceTriggerTemplate setPresenceUserType:](v3, "setPresenceUserType:", 2);
    __33__HREAutoArriveHomeTemplate_init__block_invoke();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v4);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 0.1);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * 2.0 + 1.0);
    v5 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v6 = (void *)objc_msgSend(v5, "initWithImageIdentifier:", *MEMORY[0x24BE4CE80]);
    -[HRETriggerTemplate setDefaultIconDescriptor:](v3, "setDefaultIconDescriptor:", v6);

  }
  return v3;
}

id __33__HREAutoArriveHomeTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_9 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_9, &__block_literal_global_2_7);
  return (id)_block_invoke_na_once_object_376_9;
}

void __33__HREAutoArriveHomeTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_9;
  _block_invoke_na_once_object_376_9 = (uint64_t)CFSTR("autoArriveHome");

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
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[4];
  _QWORD v23[6];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v22[0] = *MEMORY[0x24BDD6C00];
  v2 = *MEMORY[0x24BDD57A0];
  v20[0] = *MEMORY[0x24BDD5970];
  v20[1] = v2;
  v21[0] = MEMORY[0x24BDBD1C8];
  v21[1] = &unk_24F221218;
  v3 = *MEMORY[0x24BDD59A8];
  v20[2] = *MEMORY[0x24BDD58D0];
  v20[3] = v3;
  v21[2] = &unk_24F221230;
  v21[3] = &unk_24F221230;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v22[1] = *MEMORY[0x24BDD6B98];
  v18 = *MEMORY[0x24BDD5A60];
  v19 = &unk_24F221248;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = *MEMORY[0x24BDD6BC0];
  v16 = *MEMORY[0x24BDD5A18];
  v17 = &unk_24F221260;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  v22[3] = *MEMORY[0x24BDD6C30];
  v14 = *MEMORY[0x24BDD5A70];
  v15 = &unk_24F221278;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
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
