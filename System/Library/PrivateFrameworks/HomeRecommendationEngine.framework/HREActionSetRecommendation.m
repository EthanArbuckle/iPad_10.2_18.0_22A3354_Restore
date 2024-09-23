@implementation HREActionSetRecommendation

- (HREActionSetRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  HREActionSetRecommendation *v4;
  uint64_t v5;
  NSMutableSet *mutableActionSetBuilders;
  HFActionSetBuilder *selectedActionSetBuilder;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HREActionSetRecommendation;
  v4 = -[HRERecommendation initWithHome:uniqueIdentifier:](&v11, sel_initWithHome_uniqueIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableActionSetBuilders = v4->_mutableActionSetBuilders;
    v4->_mutableActionSetBuilders = (NSMutableSet *)v5;

    selectedActionSetBuilder = v4->_selectedActionSetBuilder;
    v4->_selectedActionSetBuilder = 0;

    __60__HREActionSetRecommendation_initWithHome_uniqueIdentifier___block_invoke();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRERecommendation defaultAnalyticsData](v4, "defaultAnalyticsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE4CDB0]);

  }
  return v4;
}

id __60__HREActionSetRecommendation_initWithHome_uniqueIdentifier___block_invoke()
{
  if (_block_invoke_na_once_token_4_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_4_0, &__block_literal_global_2_8);
  return (id)_block_invoke_na_once_object_4_0;
}

void __60__HREActionSetRecommendation_initWithHome_uniqueIdentifier___block_invoke_2()
{
  void *v0;

  v0 = (void *)_block_invoke_na_once_object_4_0;
  _block_invoke_na_once_object_4_0 = (uint64_t)CFSTR("action-set");

}

- (void)setSelectedActionSetBuilder:(id)a3
{
  HFActionSetBuilder *v5;
  HFActionSetBuilder *v6;

  v5 = (HFActionSetBuilder *)a3;
  if (self->_selectedActionSetBuilder != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedActionSetBuilder, a3);
    v5 = v6;
  }

}

- (HFActionSetBuilder)selectedActionSetBuilder
{
  HFActionSetBuilder *selectedActionSetBuilder;
  void *v4;
  uint64_t v5;
  void *v6;
  HFActionSetBuilder *v7;

  selectedActionSetBuilder = self->_selectedActionSetBuilder;
  if (selectedActionSetBuilder)
    goto LABEL_5;
  -[HREActionSetRecommendation actionSetBuilders](self, "actionSetBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    selectedActionSetBuilder = self->_selectedActionSetBuilder;
LABEL_5:
    v7 = selectedActionSetBuilder;
    return v7;
  }
  -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (HFActionSetBuilder *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)actionSetBuilders
{
  void *v2;
  void *v3;

  -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (NSSet)actions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HREActionSetRecommendation selectedActionSetBuilder](self, "selectedActionSetBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    -[HREActionSetRecommendation selectedActionSetBuilder](self, "selectedActionSetBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_flatMap:", &__block_literal_global_6_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v7;
}

id __37__HREActionSetRecommendation_actions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a2, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)existingActionBuilder:(id)a3 inSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[HREActionSetRecommendation selectedActionSetBuilder](self, "selectedActionSetBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "existingActionBuilder:inSet:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addAction:(id)a3
{
  -[HREActionSetRecommendation addAction:allowEditingExistingActions:](self, "addAction:allowEditingExistingActions:", a3, 1);
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
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a4;
  v19 = a3;
  -[HREActionSetRecommendation selectedActionSetBuilder](self, "selectedActionSetBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "actionBuilders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREActionSetRecommendation existingActionBuilder:inSet:](self, "existingActionBuilder:inSet:", v19, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "compareToObject:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasNoDifferencesHigherThanPriority:", 0);

      if ((v12 & 1) != 0)
      {
        v13 = 1;
LABEL_8:
        if (!v4)
        {
LABEL_14:

          goto LABEL_15;
        }
LABEL_9:
        if (v10)
        {
          if (objc_msgSend(v10, "updateWithActionBuilder:", v19))
          {
            objc_msgSend(v7, "actionBuilders");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "updateObject:", v10);

          }
        }
        else if ((v13 & 1) == 0)
        {
          objc_msgSend(v7, "addAction:", v19);
        }
        goto LABEL_14;
      }
      -[HREActionSetRecommendation allowedVariance](self, "allowedVariance");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v17, "anyRulePassesForAction:", v10);
    }
    else
    {
      objc_msgSend(v19, "recommendableObjectsInvolved");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionBuilders");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fromSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __68__HREActionSetRecommendation_addAction_allowEditingExistingActions___block_invoke;
      v20[3] = &unk_24F2174C0;
      v21 = v14;
      v17 = v14;
      objc_msgSend(v16, "na_firstObjectPassingTest:", v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0;
    }

    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_15:

}

uint64_t __68__HREActionSetRecommendation_addAction_allowEditingExistingActions___block_invoke(uint64_t a1, void *a2)
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
  id v4;
  id v5;

  v4 = a3;
  -[HREActionSetRecommendation selectedActionSetBuilder](self, "selectedActionSetBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAction:", v4);

}

- (void)addActions:(id)a3
{
  -[HREActionSetRecommendation addActions:allowEditingExistingActions:](self, "addActions:allowEditingExistingActions:", a3, 1);
}

- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__HREActionSetRecommendation_addActions_allowEditingExistingActions___block_invoke;
  v4[3] = &unk_24F2174E8;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "na_each:", v4);
}

uint64_t __69__HREActionSetRecommendation_addActions_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction:allowEditingExistingActions:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)removeActions:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__HREActionSetRecommendation_removeActions___block_invoke;
  v3[3] = &unk_24F217510;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

void __44__HREActionSetRecommendation_removeActions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedActionSetBuilder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAction:", v3);

}

- (BOOL)containsRecommendableContent
{
  void *v3;
  char v4;
  void *v5;
  BOOL v6;

  -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_all:", &__block_literal_global_10_1);

  -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = v4;
  else
    v6 = 0;

  return v6;
}

BOOL __58__HREActionSetRecommendation_containsRecommendableContent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)containsMeaningfulChanges
{
  void *v2;
  char v3;

  -[HREActionSetRecommendation actionSetBuilders](self, "actionSetBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_11_0);

  return v3;
}

uint64_t __55__HREActionSetRecommendation_containsMeaningfulChanges__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "actionBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChanges");

  return v3;
}

- (id)changedInvolvedObjects
{
  void *v2;
  void *v3;

  -[HREActionSetRecommendation addedActions](self, "addedActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_13_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __52__HREActionSetRecommendation_changedInvolvedObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recommendableObjectsInvolved");
}

- (id)involvedObjects
{
  void *v2;
  void *v3;

  -[HREActionSetRecommendation actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_14_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __45__HREActionSetRecommendation_involvedObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recommendableObjectsInvolved");
}

- (BOOL)includesObjects:(id)a3
{
  void *v4;
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD v13[5];
  id v14;

  objc_msgSend(a3, "na_flatMap:", &__block_literal_global_16_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46__HREActionSetRecommendation_includesObjects___block_invoke_2;
  v13[3] = &unk_24F217728;
  v13[4] = self;
  v14 = v4;
  v5 = v4;
  v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x22E2C9AF4](v13);
  v11 = v6[2](v6, v7, v8, v9, v10);

  return v11;
}

id __46__HREActionSetRecommendation_includesObjects___block_invoke(uint64_t a1, void *a2)
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

uint64_t __46__HREActionSetRecommendation_includesObjects___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__HREActionSetRecommendation_includesObjects___block_invoke_3;
  v5[3] = &unk_24F2174C0;
  v6 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "na_any:", v5);

  return v3;
}

uint64_t __46__HREActionSetRecommendation_includesObjects___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recommendableObjectsInvolved");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSSet)addedActions
{
  void *v2;
  void *v3;

  -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_19_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

id __42__HREActionSetRecommendation_addedActions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "actionBuilders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "additions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HREActionSetRecommendation;
  -[HRERecommendation descriptionBuilder](&v12, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HREActionSetRecommendation actionSetBuilders](self, "actionSetBuilders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("actionSetNames"));

  -[HREActionSetRecommendation addedActions](self, "addedActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE4D008];
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hre_sortActionBuilders:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("actions"), 1);
  return v3;
}

id __48__HREActionSetRecommendation_descriptionBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "actionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "actionSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  HFActionSetBuilder *v6;
  void *v7;
  HFActionSetBuilder *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  HFActionSetBuilder *v13;
  uint64_t *v14;
  _NSZone *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HREActionSetRecommendation;
  v5 = -[HRERecommendation copyWithZone:](&v22, sel_copyWithZone_);
  v6 = self->_selectedActionSetBuilder;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  -[HREActionSetRecommendation mutableActionSetBuilders](self, "mutableActionSetBuilders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__HREActionSetRecommendation_copyWithZone___block_invoke;
  v12[3] = &unk_24F218A10;
  v15 = a3;
  v8 = v6;
  v13 = v8;
  v14 = &v16;
  objc_msgSend(v7, "na_map:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v5, "setMutableActionSetBuilders:", v10);

  objc_storeStrong(v5 + 10, (id)v17[5]);
  _Block_object_dispose(&v16, 8);

  return v5;
}

id __43__HREActionSetRecommendation_copyWithZone___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  int v6;

  v3 = a1[6];
  v4 = a2;
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", v3);
  v6 = objc_msgSend(v4, "isEqual:", a1[4]);

  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v5);
  return v5;
}

- (HREActionVarianceCollection)allowedVariance
{
  return self->allowedVariance;
}

- (void)setAllowedVariance:(id)a3
{
  objc_storeStrong((id *)&self->allowedVariance, a3);
}

- (NSMutableSet)mutableActionSetBuilders
{
  return self->_mutableActionSetBuilders;
}

- (void)setMutableActionSetBuilders:(id)a3
{
  objc_storeStrong((id *)&self->_mutableActionSetBuilders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableActionSetBuilders, 0);
  objc_storeStrong((id *)&self->_selectedActionSetBuilder, 0);
  objc_storeStrong((id *)&self->allowedVariance, 0);
}

@end
