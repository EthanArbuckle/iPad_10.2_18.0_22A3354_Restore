@implementation HREGoodMorningTemplate

- (HREGoodMorningTemplate)init
{
  HREGoodMorningTemplate *v2;
  HREGoodMorningTemplate *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HREGoodMorningTemplate;
  v2 = -[HREActionSetTemplate init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HREActionSetTemplate setActionSetType:](v2, "setActionSetType:", *MEMORY[0x24BDD5228]);
    v4 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v5 = (void *)objc_msgSend(v4, "initWithImageIdentifier:", *MEMORY[0x24BE4CED0]);
    -[HREActionSetTemplate setIconDescriptor:](v3, "setIconDescriptor:", v5);

    __30__HREGoodMorningTemplate_init__block_invoke();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v6);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 3.0);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * 4.0 + 1.0);
  }
  return v3;
}

id __30__HREGoodMorningTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_11 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_11, &__block_literal_global_2_11);
  return (id)_block_invoke_na_once_object_376_11;
}

void __30__HREGoodMorningTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_11;
  _block_invoke_na_once_object_376_11 = (uint64_t)CFSTR("goodMorning");

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
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = *MEMORY[0x24BDD6C00];
  v2 = *MEMORY[0x24BDD57A0];
  v12[0] = *MEMORY[0x24BDD5970];
  v12[1] = v2;
  v13[0] = MEMORY[0x24BDBD1C8];
  v13[1] = &unk_24F2212D8;
  v3 = *MEMORY[0x24BDD59A8];
  v12[2] = *MEMORY[0x24BDD58D0];
  v12[3] = v3;
  v13[2] = &unk_24F2212F0;
  v13[3] = &unk_24F2212F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = *MEMORY[0x24BDD6CA8];
  v10 = *MEMORY[0x24BDD5A60];
  v11 = &unk_24F221308;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
