@implementation HREMotionSensorLightsTemplate

- (HREMotionSensorLightsTemplate)init
{
  HREMotionSensorLightsTemplate *v2;
  HRETypeValueTuple *v3;
  uint64_t v4;
  HRETypeValueTuple *v5;
  HRETypeValueTuple *v6;
  uint64_t v7;
  HRETypeValueTuple *v8;
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
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)HREMotionSensorLightsTemplate;
  v2 = -[HRECharacteristicTriggerTemplate init](&v31, sel_init);
  if (v2)
  {
    v3 = [HRETypeValueTuple alloc];
    v4 = *MEMORY[0x24BDD5940];
    v5 = -[HRETypeValueTuple initWithType:value:](v3, "initWithType:value:", *MEMORY[0x24BDD5940], &unk_24F2211D0);
    v38[0] = v5;
    v6 = [HRETypeValueTuple alloc];
    v7 = *MEMORY[0x24BDD5918];
    v8 = -[HRETypeValueTuple initWithType:value:](v6, "initWithType:value:", *MEMORY[0x24BDD5918], MEMORY[0x24BDBD1C8]);
    v38[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRECharacteristicTriggerTemplate setTriggerCharacteristicValues:](v2, "setTriggerCharacteristicValues:", v9);

    v37[0] = v4;
    v37[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRECharacteristicTriggerTemplate setCharacteristicTypePriority:](v2, "setCharacteristicTypePriority:", v10);

    v11 = (void *)MEMORY[0x24BDBCF20];
    +[HRERecommendableObjectTypeRule ruleWithRequiredType:](HRERecommendableObjectTypeRule, "ruleWithRequiredType:", *MEMORY[0x24BDD6C00]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v12;
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = *MEMORY[0x24BDD6C18];
    v35[0] = *MEMORY[0x24BDD6C20];
    v30 = v35[0];
    v35[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HRERecommendableObjectTypeListRule ruleRequiringOneOfTypes:](HRERecommendableObjectTypeListRule, "ruleRequiringOneOfTypes:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETemplate setRules:](v2, "setRules:", v19);

    -[HRETemplate setIdentifier:](v2, "setIdentifier:", CFSTR("motionSensorLights"));
    -[HRECharacteristicTriggerTemplate setEnforcePriority:](v2, "setEnforcePriority:", 1);
    -[HRECharacteristicTriggerTemplate setAllowMultipleEventsFeature:](v2, "setAllowMultipleEventsFeature:", _os_feature_enabled_impl());
    -[HRETemplate setSplitStrategy:](v2, "setSplitStrategy:", 1);
    -[HRECharacteristicTriggerTemplate setSingleRecommendationPerSplit:](v2, "setSingleRecommendationPerSplit:", 1);
    -[HRETemplate setSortingPriority:](v2, "setSortingPriority:", 2.0);
    -[HRETemplate setStarterRank:](v2, "setStarterRank:", 0.2 * 2.0 + 0.0);
    v20 = objc_alloc(MEMORY[0x24BE4D040]);
    v21 = (_QWORD *)MEMORY[0x24BE4CE20];
    v22 = (void *)objc_msgSend(v20, "initWithPackageIdentifier:state:", *MEMORY[0x24BE4CDE8], *MEMORY[0x24BE4CE20]);
    v23 = objc_alloc(MEMORY[0x24BE4D040]);
    v24 = (void *)objc_msgSend(v23, "initWithPackageIdentifier:state:", *MEMORY[0x24BE4CDF0], *v21);
    -[HRETriggerTemplate setDefaultIconDescriptor:](v2, "setDefaultIconDescriptor:", v22);
    v33[0] = v7;
    v33[1] = v4;
    v34[0] = v22;
    v34[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETriggerTemplate setIconDescriptorsByTriggerCharacteristic:](v2, "setIconDescriptorsByTriggerCharacteristic:", v25);

    v26 = (void *)MEMORY[0x24BDBCF20];
    v32[0] = v30;
    v32[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionTemplate setExtraInvolvedTypes:](v2, "setExtraInvolvedTypes:", v28);

  }
  return v2;
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
  v9[1] = &unk_24F2211E8;
  v3 = *MEMORY[0x24BDD59A8];
  v8[2] = *MEMORY[0x24BDD58D0];
  v8[3] = v3;
  v9[2] = &unk_24F221200;
  v9[3] = &unk_24F221200;
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
