@implementation HREAutoLightsOnUnlockTemplate

- (HREAutoLightsOnUnlockTemplate)init
{
  HREAutoLightsOnUnlockTemplate *v2;
  HRETypeValueTuple *v3;
  HRETypeValueTuple *v4;
  HRETypeValueTuple *v5;
  uint64_t v6;
  HRETypeValueTuple *v7;
  HRETypeValueTuple *v8;
  uint64_t v9;
  void *v10;
  HRETypeValueTuple *v11;
  HRETypeValueTuple *v12;
  uint64_t v13;
  HRETypeValueTuple *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  objc_super v36;
  _QWORD v37[3];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[2];
  _QWORD v41[4];
  _QWORD v42[6];

  v42[4] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)HREAutoLightsOnUnlockTemplate;
  v2 = -[HRECharacteristicTriggerTemplate init](&v36, sel_init);
  if (v2)
  {
    v3 = [HRETypeValueTuple alloc];
    v35 = *MEMORY[0x24BDD5850];
    v4 = -[HRETypeValueTuple initWithType:value:](v3, "initWithType:value:");
    v42[0] = v4;
    v5 = [HRETypeValueTuple alloc];
    v6 = *MEMORY[0x24BDD5818];
    v7 = -[HRETypeValueTuple initWithType:value:](v5, "initWithType:value:", *MEMORY[0x24BDD5818], &unk_24F221158);
    v42[1] = v7;
    v8 = [HRETypeValueTuple alloc];
    v9 = *MEMORY[0x24BDD5860];
    objc_msgSend(MEMORY[0x24BDD7878], "numberRangeWithMinValue:", &unk_24F221170);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HRETypeValueTuple initWithType:value:](v8, "initWithType:value:", v9, v10);
    v42[2] = v11;
    v12 = [HRETypeValueTuple alloc];
    v13 = *MEMORY[0x24BDD5800];
    v14 = -[HRETypeValueTuple initWithType:value:](v12, "initWithType:value:", *MEMORY[0x24BDD5800], &unk_24F221188);
    v42[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRECharacteristicTriggerTemplate setTriggerCharacteristicValues:](v2, "setTriggerCharacteristicValues:", v15);

    v41[0] = v9;
    v41[1] = v6;
    v41[2] = v35;
    v41[3] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRECharacteristicTriggerTemplate setCharacteristicTypePriority:](v2, "setCharacteristicTypePriority:", v16);

    v17 = (void *)MEMORY[0x24BDBCF20];
    +[HRERecommendableObjectTypeRule ruleWithRequiredType:](HRERecommendableObjectTypeRule, "ruleWithRequiredType:", *MEMORY[0x24BDD6C00]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v18;
    v19 = (void *)MEMORY[0x24BDBCF20];
    v21 = *MEMORY[0x24BDD6B98];
    v38[0] = *MEMORY[0x24BDD6C08];
    v20 = v38[0];
    v38[1] = v21;
    v39 = *MEMORY[0x24BDD6BC0];
    v22 = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRERecommendableObjectTypeListRule ruleRequiringOneOfTypes:](HRERecommendableObjectTypeListRule, "ruleRequiringOneOfTypes:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setRules:](v2, "setRules:", v27);

    -[HRETemplate setSplitStrategy:](v2, "setSplitStrategy:", 1);
    -[HRECharacteristicTriggerTemplate setCharacteristicPerServiceRule:](v2, "setCharacteristicPerServiceRule:", 1);
    -[HRECharacteristicTriggerTemplate setSingleRecommendationPerSplit:](v2, "setSingleRecommendationPerSplit:", 1);
    -[HRETemplate setSortingPriority:](v2, "setSortingPriority:", 4.0);
    -[HRETemplate setStarterRank:](v2, "setStarterRank:", 0.2 * -2.0 + -1.0);
    v28 = objc_alloc(MEMORY[0x24BE4D0B8]);
    v29 = (void *)objc_msgSend(v28, "initWithImageIdentifier:", *MEMORY[0x24BE4CED8]);
    -[HRETriggerTemplate setDefaultIconDescriptor:](v2, "setDefaultIconDescriptor:", v29);

    __37__HREAutoLightsOnUnlockTemplate_init__block_invoke();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v2, "setIdentifier:", v30);

    v31 = (void *)MEMORY[0x24BDBCF20];
    v37[0] = v20;
    v37[1] = v21;
    v37[2] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionTemplate setExtraInvolvedTypes:](v2, "setExtraInvolvedTypes:", v33);

  }
  return v2;
}

id __37__HREAutoLightsOnUnlockTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_6 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_6, &__block_literal_global_12_0);
  return (id)_block_invoke_na_once_object_376_6;
}

void __37__HREAutoLightsOnUnlockTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_6;
  _block_invoke_na_once_object_376_6 = (uint64_t)CFSTR("autoLightsOnUnlock");

}

- (id)_lazy_actionMap
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = *MEMORY[0x24BDD6C00];
  v2 = *MEMORY[0x24BDD57A0];
  v8[0] = *MEMORY[0x24BDD5970];
  v8[1] = v2;
  v9[0] = MEMORY[0x24BDBD1C8];
  v9[1] = &unk_24F2211A0;
  v3 = *MEMORY[0x24BDD59A8];
  v8[2] = *MEMORY[0x24BDD58D0];
  v8[3] = v3;
  v9[2] = &unk_24F2211B8;
  v9[3] = &unk_24F2211B8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
