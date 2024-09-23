@implementation HRERecommendationItem

- (HRERecommendationItem)initWithRecommendation:(id)a3
{
  id v5;
  HRERecommendationItem *v6;
  HRERecommendationItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRERecommendationItem;
  v6 = -[HRERecommendationItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recommendation, a3);
    v7->_selected = 0;
    v7->_accessoryCountType = 0;
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v47;
  void *v48;

  v4 = (void *)objc_opt_new();
  -[HRERecommendationItem recommendation](self, "recommendation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE4CF98]);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRERecommendationItem recommendation](self, "recommendation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HRERecommendationItem recommendation](self, "recommendation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "selectedTriggerBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "naturalLanguageNameOfType:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE4CF80]);

    objc_msgSend(v10, "selectedTriggerBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "triggerActionSets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anonymousActionBuilder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x24BE4D190]);
    objc_msgSend(v10, "selectedTriggerBuilder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "home");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithTrigger:inHome:forceDisabled:ignoringDisabled:", v18, v19, 0, 1);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE4CFA0]);
    objc_msgSend(v20, "triggerIconDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BE4CF60];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE4CF60]);

    objc_msgSend(v10, "iconDescriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v10, "iconDescriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, v22);

    }
    objc_msgSend(v10, "triggerBuilders");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "na_flatMap:", &__block_literal_global_2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v26);

    goto LABEL_7;
  }
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  -[HRERecommendationItem recommendation](self, "recommendation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if ((v27 & 1) != 0)
  {
    objc_msgSend(v28, "selectedActionSetBuilder");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, *MEMORY[0x24BE4CF80]);

    objc_msgSend(v10, "selectedActionSetBuilder");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "actions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "selectedActionSetBuilder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "iconDescriptor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE4CF60]);

    objc_msgSend(v10, "actionSetBuilders");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "na_map:", &__block_literal_global_6_0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v25);
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  v47 = objc_opt_isKindOfClass();

  if ((v47 & 1) == 0)
  {
    v15 = 0;
    goto LABEL_9;
  }
  -[HRERecommendationItem recommendation](self, "recommendation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, *MEMORY[0x24BE4CF80]);

  objc_msgSend(v10, "iconDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE4CF60]);
  v15 = 0;
LABEL_8:

LABEL_9:
  v34 = objc_alloc(MEMORY[0x24BE4D010]);
  -[HRERecommendationItem recommendation](self, "recommendation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "home");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v34, "initWithHome:formattingContext:", v36, 2);

  objc_msgSend(v37, "setAccessoryCountType:", -[HRERecommendationItem accessoryCountType](self, "accessoryCountType"));
  objc_msgSend(v15, "na_map:", &__block_literal_global_10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "na_filter:", &__block_literal_global_12);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE4D018], "hf_naturalLanguageDescriptionForActions:withOptions:", v39, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, *MEMORY[0x24BE4CF58]);

  v41 = (void *)MEMORY[0x24BDD16E0];
  -[HRERecommendationItem isSelected](self, "isSelected");
  objc_msgSend(v41, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, *MEMORY[0x24BE4CF90]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE4CF48]);
  v43 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(MEMORY[0x24BE4D0D8], "outcomeWithResults:", v4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "futureWithResult:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

id __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v3 = a2;
  objc_msgSend(v2, "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_safeAddObject:", v5);
  return v4;
}

uint64_t __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "actionSet");
}

uint64_t __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __53__HRERecommendationItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (HRERecommendation)recommendation
{
  return self->_recommendation;
}

- (void)setRecommendation:(id)a3
{
  objc_storeStrong((id *)&self->_recommendation, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (unint64_t)accessoryCountType
{
  return self->_accessoryCountType;
}

- (void)setAccessoryCountType:(unint64_t)a3
{
  self->_accessoryCountType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendation, 0);
}

@end
