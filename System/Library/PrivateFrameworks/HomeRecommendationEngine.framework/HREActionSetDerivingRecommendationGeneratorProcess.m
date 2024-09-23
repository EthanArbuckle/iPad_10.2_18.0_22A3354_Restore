@implementation HREActionSetDerivingRecommendationGeneratorProcess

- (id)generateRecommendations
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  HREActionSetDerivingRecommendationGeneratorProcess *v13;
  _QWORD v14[4];
  id v15;
  HREActionSetDerivingRecommendationGeneratorProcess *v16;

  v3 = (void *)objc_opt_new();
  v4 = -[HREStandardAsyncRecommendationGenerationProcess options](self, "options");
  v5 = MEMORY[0x24BDAC760];
  if ((v4 & 1) != 0)
  {
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke;
    v14[3] = &unk_24F217138;
    v15 = v3;
    v16 = self;
    objc_msgSend(v7, "na_each:", v14);

  }
  if ((-[HREStandardAsyncRecommendationGenerationProcess options](self, "options") & 2) != 0)
  {
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "triggers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke_2;
    v11[3] = &unk_24F217160;
    v12 = v3;
    v13 = self;
    objc_msgSend(v9, "na_each:", v11);

  }
  return v3;
}

void __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_recommendationForActionSet:trigger:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

}

void __77__HREActionSetDerivingRecommendationGeneratorProcess_generateRecommendations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_recommendationForActionSet:trigger:", 0, a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

}

- (BOOL)shouldGenerateRecommendations
{
  return 1;
}

- (id)_recommendationForActionSet:(id)a3 trigger:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "hf_triggerType"))
  {
    v16 = 0;
  }
  else
  {
    -[HREActionSetDerivingRecommendationGeneratorProcess _createRecommendationWithActionSet:trigger:](self, "_createRecommendationWithActionSet:trigger:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "actions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HREStandardAsyncRecommendationGenerationProcess sourceRecommendableObjects](self, "sourceRecommendableObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HRERecommendableObjectUtilities filterRecommendableObjects:excludingObjectsInActions:](HRERecommendableObjectUtilities, "filterRecommendableObjects:excludingObjectsInActions:", v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        +[HREDerivedActionUtilities derivedActionsForActionableObjects:fromActions:](HREDerivedActionUtilities, "derivedActionsForActionableObjects:fromActions:", v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addActions:", v14);

        if (objc_msgSend(v10, "containsMeaningfulChanges"))
          v15 = v10;
        else
          v15 = 0;
        v16 = v15;
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  return v16;
}

- (id)_createRecommendationWithActionSet:(id)a3 trigger:(id)a4
{
  id v6;
  id v7;
  HREIdentifierBuilder *v8;
  HRETriggerRecommendation *v9;
  void *v10;
  HRETriggerRecommendation *v11;
  void *v12;
  void *v13;
  HRERecommendationEmptyTriggerBuilderContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HREActionSetRecommendation *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = -[HREIdentifierBuilder initWithBaseIdentifier:]([HREIdentifierBuilder alloc], "initWithBaseIdentifier:", CFSTR("derived"));
  if (v7)
  {
    v9 = [HRETriggerRecommendation alloc];
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HRERecommendation initWithHome:](v9, "initWithHome:", v10);

    objc_msgSend(v7, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREIdentifierBuilder setObject:forKey:](v8, "setObject:forKey:", v13, CFSTR("trigger"));

    v14 = objc_alloc_init(HRERecommendationEmptyTriggerBuilderContext);
    v15 = (void *)MEMORY[0x24BE4D188];
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "triggerBuilderForTrigger:inHome:context:assertsFailure:", v7, v16, v14, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {

      v11 = 0;
      goto LABEL_9;
    }
    -[HRETriggerRecommendation mutableTriggerBuilders](v11, "mutableTriggerBuilders");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v17);

  }
  else
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v19 = objc_alloc(MEMORY[0x24BE4D020]);
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (HRERecommendationEmptyTriggerBuilderContext *)objc_msgSend(v19, "initWithExistingObject:inHome:", v6, v20);

    objc_msgSend(v6, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREIdentifierBuilder setObject:forKey:](v8, "setObject:forKey:", v22, CFSTR("actionSet"));

    v23 = [HREActionSetRecommendation alloc];
    -[HREStandardAsyncRecommendationGenerationProcess home](self, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HRERecommendation initWithHome:](v23, "initWithHome:", v24);

    -[HRETriggerRecommendation mutableActionSetBuilders](v11, "mutableActionSetBuilders");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v14);

    -[HRETriggerRecommendation setSelectedActionSetBuilder:](v11, "setSelectedActionSetBuilder:", v14);
  }

LABEL_7:
  -[HRERecommendation defaultAnalyticsData](v11, "defaultAnalyticsData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("derived"), *MEMORY[0x24BE4CDD0]);

  -[HRERecommendation setIdentifierBuilder:](v11, "setIdentifierBuilder:", v8);
LABEL_9:

  return v11;
}

- (NSDictionary)sourceCharacteristics
{
  return self->_sourceCharacteristics;
}

- (void)setSourceCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_sourceCharacteristics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceCharacteristics, 0);
}

@end
