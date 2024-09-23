@implementation HREContextActionRecommendation

- (HREContextActionRecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  HREContextActionRecommendation *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HREContextActionRecommendation;
  v4 = -[HRERecommendation initWithHome:uniqueIdentifier:](&v7, sel_initWithHome_uniqueIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREContextActionRecommendation set_actions:](v4, "set_actions:", v5);

  }
  return v4;
}

- (void)addAction:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HREContextActionRecommendation actions](self, "actions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "canUpdateWithActionBuilder:", v5) & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v11;

    if (!v12)
      goto LABEL_12;
    objc_msgSend(v12, "updateWithActionBuilder:", v5);
  }
  else
  {
LABEL_9:

LABEL_12:
    -[HREContextActionRecommendation _actions](self, "_actions");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v5);
  }

}

- (void)addAction:(id)a3
{
  -[HREContextActionRecommendation addAction:allowEditingExistingActions:](self, "addAction:allowEditingExistingActions:", a3, 1);
}

- (void)addActions:(id)a3
{
  -[HREContextActionRecommendation addActions:allowEditingExistingActions:](self, "addActions:allowEditingExistingActions:", a3, 1);
}

- (void)addActions:(id)a3 allowEditingExistingActions:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__HREContextActionRecommendation_addActions_allowEditingExistingActions___block_invoke;
  v4[3] = &unk_24F2174E8;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "na_each:", v4);
}

uint64_t __73__HREContextActionRecommendation_addActions_allowEditingExistingActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAction:allowEditingExistingActions:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)removeAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HREContextActionRecommendation _actions](self, "_actions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)removeActions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HREContextActionRecommendation _actions](self, "_actions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v4);

}

- (BOOL)containsMeaningfulChanges
{
  void *v2;
  BOOL v3;

  -[HREContextActionRecommendation actions](self, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

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
  v12.super_class = (Class)HREContextActionRecommendation;
  -[HRERecommendation descriptionBuilder](&v12, sel_descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HREContextActionRecommendation name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("name"));

  -[HREContextActionRecommendation iconDescriptor](self, "iconDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("iconDescriptor"));

  v7 = (void *)MEMORY[0x24BE4D008];
  -[HREContextActionRecommendation _actions](self, "_actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hre_sortActionBuilders:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v10, CFSTR("actions"), 1);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HREContextActionRecommendation;
  v4 = -[HRERecommendation copyWithZone:](&v11, sel_copyWithZone_, a3);
  -[HREContextActionRecommendation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[HREContextActionRecommendation iconDescriptor](self, "iconDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconDescriptor:", v7);

  -[HREContextActionRecommendation _actions](self, "_actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v4, "set_actions:", v9);

  return v4;
}

- (id)executeActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  HREContextActionRecommendation *v19;

  -[HRERecommendation home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_characteristicValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HREContextActionRecommendation actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "combineAllFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __48__HREContextActionRecommendation_executeActions__block_invoke_2;
  v17 = &unk_24F217FF0;
  v18 = v4;
  v19 = self;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "flatMap:", &__block_literal_global_19_0, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __48__HREContextActionRecommendation_executeActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performValidation");
}

id __48__HREContextActionRecommendation_executeActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "beginTransactionWithReason:", CFSTR("HREContextActionRecommendationCharacteristicTransactionReason"));
  objc_msgSend(*(id *)(a1 + 40), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_15_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_17_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "executeActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "commitTransactionWithReason:", CFSTR("HREContextActionRecommendationCharacteristicTransactionReason"));

  return v5;
}

uint64_t __48__HREContextActionRecommendation_executeActions__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __48__HREContextActionRecommendation_executeActions__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

uint64_t __48__HREContextActionRecommendation_executeActions__block_invoke_5()
{
  return objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

- (id)copyWithActionFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)-[HREContextActionRecommendation copy](self, "copy");
  objc_msgSend(v5, "_actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v5, "set_actions:", v8);

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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (NSMutableSet)_actions
{
  return self->__actions;
}

- (void)set_actions:(id)a3
{
  objc_storeStrong((id *)&self->__actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__actions, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->allowedVariance, 0);
}

@end
