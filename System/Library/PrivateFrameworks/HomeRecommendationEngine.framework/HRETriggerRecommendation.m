@implementation HRETriggerRecommendation

- (HRETriggerRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  HRETriggerRecommendation *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HRETriggerRecommendation;
  v4 = -[HRERecommendation initWithHome:uniqueIdentifier:](&v9, sel_initWithHome_uniqueIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETriggerRecommendation setMutableTriggerBuilders:](v4, "setMutableTriggerBuilders:", v5);

    __58__HRETriggerRecommendation_initWithHome_uniqueIdentifier___block_invoke();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRERecommendation defaultAnalyticsData](v4, "defaultAnalyticsData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE4CDB0]);

  }
  return v4;
}

id __58__HRETriggerRecommendation_initWithHome_uniqueIdentifier___block_invoke()
{
  if (_block_invoke_na_once_token_4 != -1)
    dispatch_once(&_block_invoke_na_once_token_4, &__block_literal_global_2_4);
  return (id)_block_invoke_na_once_object_4;
}

void __58__HRETriggerRecommendation_initWithHome_uniqueIdentifier___block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_4;
  _block_invoke_na_once_object_4 = (uint64_t)CFSTR("trigger");

}

- (void)setSelectedTriggerBuilder:(id)a3
{
  HFTriggerBuilder *v5;
  HFTriggerBuilder *v6;

  v5 = (HFTriggerBuilder *)a3;
  if (self->_selectedTriggerBuilder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedTriggerBuilder, a3);
    v5 = v6;
  }

}

- (HFTriggerBuilder)selectedTriggerBuilder
{
  HFTriggerBuilder *selectedTriggerBuilder;
  void *v4;
  uint64_t v5;
  void *v6;
  HFTriggerBuilder *v7;

  selectedTriggerBuilder = self->_selectedTriggerBuilder;
  if (selectedTriggerBuilder)
    goto LABEL_5;
  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    selectedTriggerBuilder = self->_selectedTriggerBuilder;
LABEL_5:
    v7 = selectedTriggerBuilder;
    return v7;
  }
  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (HFTriggerBuilder *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)actions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "triggerActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anonymousActionBuilder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_flatMap:", &__block_literal_global_6_1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v8;
}

id __35__HRETriggerRecommendation_actions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a2, "triggerActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anonymousActionBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)existingActionBuilder:(id)a3 inSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerActionSets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anonymousActionSetBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingActionBuilder:inSet:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)addAction:(id)a3
{
  -[HRETriggerRecommendation addAction:allowEditingExistingActions:](self, "addAction:allowEditingExistingActions:", a3, 1);
}

- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a4;
  v24 = a3;
  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "triggerActionSets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anonymousActionSetBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "actionBuilders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRETriggerRecommendation existingActionBuilder:inSet:](self, "existingActionBuilder:inSet:", v24, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v24, "recommendableObjectsInvolved");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "actionBuilders");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fromSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __66__HRETriggerRecommendation_addAction_allowEditingExistingActions___block_invoke;
      v25[3] = &unk_24F2174C0;
      v26 = v13;
      v16 = v13;
      objc_msgSend(v15, "na_firstObjectPassingTest:", v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_7;
    }
    if (v4)
    {
LABEL_7:
      if (v12)
      {
        objc_msgSend(v12, "compareToObject:", v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "hasNoDifferencesHigherThanPriority:", 0);
        -[HRETriggerRecommendation allowedVariance](self, "allowedVariance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "anyRulePassesForAction:", v12);

        if ((v18 & 1) == 0 && (v20 & 1) == 0 && objc_msgSend(v12, "updateWithActionBuilder:", v24))
        {
          objc_msgSend(v7, "triggerActionSets");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "updateAnonymousActionBuilder:", v12);

        }
      }
      else
      {
        objc_msgSend(v7, "triggerActionSets");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAnonymousActionBuilder:", v24);
      }

      objc_msgSend(v7, "triggerActionSets");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hre_recommendedActions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v24);

    }
  }
  else
  {
    -[HRERecommendation identifierBuilder](self, "identifierBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "composedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Recommendation's (%@) selected trigger builder is nil! Either there are multiple trigger builders attached and one wasn't selected, or there are no trigger builders"), v12);
  }

}

uint64_t __66__HRETriggerRecommendation_addAction_allowEditingExistingActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recommendableObjectsInvolved");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "triggerActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAnonymousActionBuilder:", v7);

  }
}

- (void)addActions:(id)a3
{
  -[HRETriggerRecommendation addActions:allowEditingExistingActions:](self, "addActions:allowEditingExistingActions:", a3, 1);
}

- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__HRETriggerRecommendation_addActions_allowEditingExistingActions___block_invoke;
  v4[3] = &unk_24F2174E8;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "na_each:", v4);
}

uint64_t __67__HRETriggerRecommendation_addActions_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction:allowEditingExistingActions:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)removeActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__HRETriggerRecommendation_removeActions___block_invoke;
  v3[3] = &unk_24F217510;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __42__HRETriggerRecommendation_removeActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAction:", a2);
}

- (BOOL)containsMeaningfulChanges
{
  int v3;
  uint64_t v4;
  char v5;
  void *v6;

  v3 = -[HRETriggerRecommendation containsRecommendableContent](self, "containsRecommendableContent");
  if (v3)
  {
    -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)v4, "na_any:", &__block_literal_global_12_1);

    -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v6, "na_any:", &__block_literal_global_13);

    LOBYTE(v3) = v5 | v4;
  }
  return v3;
}

uint64_t __53__HRETriggerRecommendation_containsMeaningfulChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = a2;
  objc_msgSend(v2, "triggerActionSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namedActionSetsDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v2, "triggerActionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "namedActionSetsDiff");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deletions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v2, "triggerActionSets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "namedActionSetsDiff");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v2, "triggerActionSets");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "anonymousActionSetBuilder");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "actionBuilders");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v13, "hasChanges");

      }
    }

  }
  return v6;
}

uint64_t __53__HRETriggerRecommendation_containsMeaningfulChanges__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "enabled");
  objc_msgSend(v2, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v3 ^ objc_msgSend(v4, "isEnabled");
  return v5;
}

- (BOOL)containsRecommendableContent
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;

  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_14);

  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "na_all:", &__block_literal_global_15);

  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_16);

  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = v4 | v8;
  if (!v10)
    v11 = 0;
  v12 = v11 & v6;

  return v12;
}

uint64_t __56__HRETriggerRecommendation_containsRecommendableContent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hre_recommendedActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasChanges");

  return v4;
}

BOOL __56__HRETriggerRecommendation_containsRecommendableContent__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allActionBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __56__HRETriggerRecommendation_containsRecommendableContent__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "enabled");
  objc_msgSend(v2, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v3 ^ objc_msgSend(v4, "isEnabled");
  return v5;
}

- (id)changedInvolvedObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HRETriggerRecommendation mutableTriggerBuilders](self, "mutableTriggerBuilders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_flatMap:", &__block_literal_global_17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HRETriggerRecommendation involvedObjects](self, "involvedObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

id __50__HRETriggerRecommendation_changedInvolvedObjects__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a2, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anonymousActionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_flatMap:", &__block_literal_global_19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __50__HRETriggerRecommendation_changedInvolvedObjects__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recommendableObjectsInvolved");
}

- (id)involvedObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HRETriggerRecommendation actions](self, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_flatMap:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __43__HRETriggerRecommendation_involvedObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recommendableObjectsInvolved");
}

id __43__HRETriggerRecommendation_involvedObjects__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v5, "eventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "na_flatMap:", &__block_literal_global_24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __43__HRETriggerRecommendation_involvedObjects__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recommendableObjectsInvolved");
}

- (BOOL)includesObjects:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t (**v7)(_QWORD);
  id v8;
  uint64_t (**v9)(_QWORD);
  char v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  objc_msgSend(a3, "na_flatMap:", &__block_literal_global_26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_2;
  v14[3] = &unk_24F217728;
  v14[4] = self;
  v6 = v4;
  v15 = v6;
  v7 = (uint64_t (**)(_QWORD))MEMORY[0x22E2C9AF4](v14);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_5;
  v12[3] = &unk_24F217728;
  v12[4] = self;
  v13 = v6;
  v8 = v6;
  v9 = (uint64_t (**)(_QWORD))MEMORY[0x22E2C9AF4](v12);
  if ((v7[2](v7) & 1) != 0)
    v10 = 1;
  else
    v10 = v9[2](v9);

  return v10;
}

id __44__HRETriggerRecommendation_includesObjects___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "hf_containedServices");
  else
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "triggerBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_3;
  v5[3] = &unk_24F217700;
  v6 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "na_any:", v5);

  return v3;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "eventBuilders");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_4;
    v10[3] = &unk_24F2176D8;
    v11 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_any:", v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recommendableObjectsInvolved");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_7;
  v6[3] = &unk_24F217770;
  v7 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recommendableObjectsInvolved");
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__HRETriggerRecommendation_includesObjects___block_invoke_8;
  v8[3] = &unk_24F217770;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __44__HRETriggerRecommendation_includesObjects___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _BOOL4 v5;

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = +[HRERecommendableObjectUtilities recommendableObject:isEffectivelyEqualToObject:](HRERecommendableObjectUtilities, "recommendableObject:isEffectivelyEqualToObject:", v4, v3);
  LODWORD(v2) = +[HRERecommendableObjectUtilities recommendableObject:containsObject:](HRERecommendableObjectUtilities, "recommendableObject:containsObject:", v4, *(_QWORD *)(v2 + 32));

  return v5 | v2;
}

- (id)compareForMatchingToTrigger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v4 = a3;
  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    v8 = -[HRETriggerRecommendation containsMeaningfulChanges](self, "containsMeaningfulChanges");

    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x24BE4D070]);
      -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v9, "initWithObjectA:objectB:", v10, v4);
LABEL_18:
      v25 = v11;
      goto LABEL_21;
    }
  }
  else
  {

  }
  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "compareToObject:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "highestPriorityDifference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v11 = v10;
    v10 = v11;
    goto LABEL_18;
  }
  objc_opt_class();
  objc_msgSend(v10, "differences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE48]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v17, "containedObjectResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v18, "differences");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BE4CE38]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22 && objc_msgSend(v22, "isASubsetOfB"))
    {
      objc_msgSend(v22, "withPriority:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "add:", v23);

    }
    v24 = v10;

  }
  else
  {
    v26 = v10;
  }

  v25 = v10;
LABEL_21:

  return v25;
}

- (NSSet)addedActions
{
  void *v2;
  void *v3;

  -[HRETriggerRecommendation triggerBuilders](self, "triggerBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_36);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

id __40__HRETriggerRecommendation_addedActions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anonymousActionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)replaceTriggerBuilder:(id)a3 withTriggerBuilder:(id)a4 allowEditingExistingActions:(BOOL)a5
{
  HFTriggerBuilder *v8;
  id v9;
  void *v10;
  void *v11;
  HFTriggerBuilder *v12;
  HFTriggerBuilder *selectedTriggerBuilder;
  void *v14;
  void *v15;
  void *v16;
  HFTriggerBuilder *v17;
  HFTriggerBuilder *v18;
  HFTriggerBuilder *v19;
  _QWORD v20[5];
  BOOL v21;

  v8 = (HFTriggerBuilder *)a4;
  v9 = a3;
  -[HRETriggerRecommendation mutableTriggerBuilders](self, "mutableTriggerBuilders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v9);

  -[HRETriggerRecommendation mutableTriggerBuilders](self, "mutableTriggerBuilders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v8);

  v12 = self->_selectedTriggerBuilder;
  selectedTriggerBuilder = self->_selectedTriggerBuilder;
  self->_selectedTriggerBuilder = v8;
  v19 = v8;

  objc_msgSend(v9, "triggerActionSets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "hre_recommendedActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "additions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __97__HRETriggerRecommendation_replaceTriggerBuilder_withTriggerBuilder_allowEditingExistingActions___block_invoke;
  v20[3] = &unk_24F2174E8;
  v20[4] = self;
  v21 = a5;
  objc_msgSend(v16, "na_each:", v20);

  v17 = self->_selectedTriggerBuilder;
  self->_selectedTriggerBuilder = v12;
  v18 = v12;

}

uint64_t __97__HRETriggerRecommendation_replaceTriggerBuilder_withTriggerBuilder_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction:allowEditingExistingActions:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HRETriggerRecommendation;
  -[HRERecommendation descriptionBuilder](&v15, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naturalLanguageNameOfType:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("name"));

  -[HRETriggerRecommendation selectedTriggerBuilder](self, "selectedTriggerBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("trigger"), 1);

  -[HRETriggerRecommendation addedActions](self, "addedActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE4D008];
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hre_sortActionBuilders:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v13, CFSTR("+actions"), 1);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRETriggerRecommendation;
  v4 = -[HRERecommendation copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[HRETriggerRecommendation iconDescriptor](self, "iconDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconDescriptor:", v5);

  return v4;
}

- (HREActionVarianceCollection)allowedVariance
{
  return self->allowedVariance;
}

- (void)setAllowedVariance:(id)a3
{
  objc_storeStrong((id *)&self->allowedVariance, a3);
}

- (NSMutableSet)mutableTriggerBuilders
{
  return self->mutableTriggerBuilders;
}

- (void)setMutableTriggerBuilders:(id)a3
{
  objc_storeStrong((id *)&self->mutableTriggerBuilders, a3);
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->mutableTriggerBuilders, 0);
  objc_storeStrong((id *)&self->_selectedTriggerBuilder, 0);
  objc_storeStrong((id *)&self->allowedVariance, 0);
}

@end
