@implementation HRELockWhenDoorClosedTemplate

- (HRELockWhenDoorClosedTemplate)init
{
  HRELockWhenDoorClosedTemplate *v2;
  HRELockWhenDoorClosedTemplate *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)HRELockWhenDoorClosedTemplate;
  v2 = -[HRECharacteristicTriggerTemplate init](&v26, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HRETemplate setSplitStrategy:](v2, "setSplitStrategy:", 1);
    v4 = *MEMORY[0x24BDD5800];
    +[HRETypeValueTuple type:value:](HRETypeValueTuple, "type:value:", *MEMORY[0x24BDD5800], &unk_24F221290);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v5;
    v6 = *MEMORY[0x24BDD5860];
    +[HRETypeValueTuple type:value:](HRETypeValueTuple, "type:value:", *MEMORY[0x24BDD5860], &unk_24F2212A8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRECharacteristicTriggerTemplate setTriggerCharacteristicValues:](v3, "setTriggerCharacteristicValues:", v8);

    v29[0] = v4;
    v29[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRECharacteristicTriggerTemplate setCharacteristicTypePriority:](v3, "setCharacteristicTypePriority:", v9);

    -[HRECharacteristicTriggerTemplate setEnforcePriority:](v3, "setEnforcePriority:", 1);
    -[HRECharacteristicTriggerTemplate setSingleRecommendationPerSplit:](v3, "setSingleRecommendationPerSplit:", 1);
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = *MEMORY[0x24BDD6C08];
    +[HRERecommendableObjectTypeRule ruleWithRequiredType:](HRERecommendableObjectTypeRule, "ruleWithRequiredType:", *MEMORY[0x24BDD6C08]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    v13 = *MEMORY[0x24BDD6B98];
    +[HRERecommendableObjectTypeRule ruleWithRequiredType:](HRERecommendableObjectTypeRule, "ruleWithRequiredType:", *MEMORY[0x24BDD6B98]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v14;
    +[HRERecommendableObjectCountRule ruleWithAccessoryType:allowedCount:](HRERecommendableObjectCountRule, "ruleWithAccessoryType:allowedCount:", v11, 1, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    +[HRERecommendableObjectCountRule ruleWithAccessoryType:allowedCount:](HRERecommendableObjectCountRule, "ruleWithAccessoryType:allowedCount:", v13, 0, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setRules:](v3, "setRules:", v18);

    __37__HRELockWhenDoorClosedTemplate_init__block_invoke();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setIdentifier:](v3, "setIdentifier:", v19);

    -[HRETemplate setSortingPriority:](v3, "setSortingPriority:", 4.0);
    -[HRETemplate setStarterRank:](v3, "setStarterRank:", 0.2 * -2.0 + -1.0);
    v20 = objc_alloc(MEMORY[0x24BE4D040]);
    v21 = (void *)objc_msgSend(v20, "initWithPackageIdentifier:state:", *MEMORY[0x24BE4CDE0], *MEMORY[0x24BE4CE18]);
    -[HRETriggerTemplate setDefaultIconDescriptor:](v3, "setDefaultIconDescriptor:", v21);

    v22 = (void *)MEMORY[0x24BDBCF20];
    v27[0] = v11;
    v27[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionTemplate setExtraInvolvedTypes:](v3, "setExtraInvolvedTypes:", v24);

  }
  return v3;
}

id __37__HRELockWhenDoorClosedTemplate_init__block_invoke()
{
  if (_block_invoke_na_once_token_376_10 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_10, &__block_literal_global_9);
  return (id)_block_invoke_na_once_object_376_10;
}

void __37__HRELockWhenDoorClosedTemplate_init__block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_376_10;
  _block_invoke_na_once_object_376_10 = (uint64_t)CFSTR("lockWhenDoorClosed");

}

- (id)_lazy_actionMap
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDD6C08];
  v6 = *MEMORY[0x24BDD5A50];
  v7 = &unk_24F2212C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
