@implementation HUAvailableTriggerItem

- (HUAvailableTriggerItem)initWithHome:(id)a3 containingItem:(id)a4 relatedToServiceLikeItems:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUAvailableTriggerItem *v12;
  HUAvailableTriggerItem *v13;
  NSNumber *activeValue;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUAvailableTriggerItem;
  v12 = -[HUAvailableTriggerItem init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[HUAvailableTriggerItem setSourceItem:](v12, "setSourceItem:", v10);
    objc_storeStrong((id *)&v13->_home, a3);
    objc_storeStrong((id *)&v13->_relatedServiceLikeItems, a5);
    activeValue = v13->_activeValue;
    v13->_activeValue = 0;

  }
  return v13;
}

- (void)resetActiveToDefault
{
  -[HUAvailableTriggerItem setActiveValue:](self, "setActiveValue:", 0);
}

- (void)setSourceItem:(id)a3
{
  HUTriggerLikeItem *v4;
  HUTriggerLikeItem *sourceItem;

  v4 = (HUTriggerLikeItem *)a3;
  if (!v4)
    NSLog(CFSTR("HUAvailableTriggerItem sourceItem must not be nil"));
  sourceItem = self->_sourceItem;
  self->_sourceItem = v4;

}

- (HFServiceLikeItem)preferredRelatedItem
{
  void *v2;
  void *v3;

  -[HUAvailableTriggerItem relatedServiceLikeItems](self, "relatedServiceLikeItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFServiceLikeItem *)v3;
}

- (id)buildersForActivating:(BOOL)a3 inHome:(id)a4 withContext:(id)a5 serviceLikeItems:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_opt_class();
  -[HUAvailableTriggerItem recommendationItem](self, "recommendationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recommendation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v16, "selectedTriggerBuilder");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "triggerBuilderWithContext:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setEnabled:", 1);
      objc_msgSend(v17, "na_safeAddObject:", v20);
      objc_msgSend(v10, "triggers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke;
      v34[3] = &unk_1E6F5E580;
      v35 = v10;
      v36 = v11;
      v37 = v16;
      objc_msgSend(v21, "na_filter:", v34);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addObjectsFromArray:", v22);
    }
    else
    {
      objc_msgSend(v10, "triggers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke_2;
      v30 = &unk_1E6F5E580;
      v31 = v10;
      v32 = v11;
      v33 = v16;
      objc_msgSend(v23, "na_filter:", &v27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "addObjectsFromArray:", v24, v27, v28, v29, v30);
      v20 = v31;
    }

    if (objc_msgSend(v18, "count"))
    {
      -[HUAvailableTriggerItem removalTriggerBuildersForTriggers:home:context:relatedItems:](self, "removalTriggerBuildersForTriggers:home:context:relatedItems:", v18, v10, v11, v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObjectsFromArray:", v25);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

uint64_t __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEnabled") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D31938], "triggerBuilderForTrigger:inHome:context:assertsFailure:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "compareForMatchingToTrigger:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasNoDifferencesHigherThanPriority:", 0);

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

uint64_t __84__HUAvailableTriggerItem_buildersForActivating_inHome_withContext_serviceLikeItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D31938], "triggerBuilderForTrigger:inHome:context:assertsFailure:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "compareForMatchingToTrigger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasNoDifferencesHigherThanPriority:", 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)removalTriggerBuildersForTriggers:(id)a3 home:(id)a4 context:(id)a5 relatedItems:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke;
  v17[3] = &unk_1E6F5E5D0;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  v14 = v9;
  objc_msgSend(a3, "na_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0D31938], "triggerBuilderForTrigger:inHome:context:", a2, a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[6];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke_2;
  v7[3] = &unk_1E6F5E5A8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "na_each:", v7);

  return v5;
}

uint64_t __86__HUAvailableTriggerItem_removalTriggerBuildersForTriggers_home_context_relatedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeServiceLikeItem:", a2);
}

- (BOOL)isActive
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[HUAvailableTriggerItem activeValue](self, "activeValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUAvailableTriggerItem activeValue](self, "activeValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[HUAvailableTriggerItem latestResults](self, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = objc_msgSend(v4, "integerValue") == 2;
    else
      v5 = 0;
  }

  return v5;
}

- (void)setActive:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAvailableTriggerItem setActiveValue:](self, "setActiveValue:", v4);

}

- (HFTriggerItem)triggerItem
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (HFTriggerItem *)v5;
}

- (HRERecommendationItem)recommendationItem
{
  void *v3;
  void *v4;
  id v5;

  objc_opt_class();
  -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (HRERecommendationItem *)v5;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (HMTrigger)trigger
{
  void *v2;
  void *v3;

  -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMTrigger *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  HUAvailableTriggerItem *v32;
  id v33;
  id v34;
  id v35;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[HUAvailableTriggerItem recommendationItem](self, "recommendationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recommendation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shallow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "BOOLValue") & 1) != 0)
    {
      -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        v15 = (void *)MEMORY[0x1E0D519C0];
        -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "latestResults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "futureWithResult:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

        -[HUAvailableTriggerItem _updateNaturalLanguageOptions](self, "_updateNaturalLanguageOptions");
        -[HUAvailableTriggerItem triggerNaturalLanguageOptions](self, "triggerNaturalLanguageOptions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "copy");

        v24 = (void *)MEMORY[0x1E0D31958];
        -[HUAvailableTriggerItem triggerNaturalLanguageOptions](self, "triggerNaturalLanguageOptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "detailOptionsWithOptions:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_2;
        v30[3] = &unk_1E6F5E6C0;
        v31 = v5;
        v32 = self;
        v33 = v9;
        v34 = v23;
        v35 = v26;
        v27 = v23;
        v28 = v26;
        objc_msgSend(v18, "flatMap:", v30);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    else
    {

    }
    v16 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30FE8]);
    -[HUAvailableTriggerItem sourceItem](self, "sourceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithOptions:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "flatMap:", &__block_literal_global_261);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v19 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", MEMORY[0x1E0C9AA70]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "futureWithResult:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v20;
}

id __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_2(id *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  char isKindOfClass;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD aBlock[4];
  id v80;
  id v81;

  objc_msgSend(a1[4], "addEntriesFromDictionary:", a2);
  v3 = *MEMORY[0x1E0D30B80];
  objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(a1[5], "relatedServiceLikeItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_18_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  objc_msgSend(a1[5], "triggerItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    objc_msgSend(a1[5], "recommendationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recommendation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hu_triggerBuilderIfAny");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_8;
  }
  objc_msgSend(a1[5], "trigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v16);

LABEL_8:
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v8, v3);
  objc_msgSend(a1[5], "recommendationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(a1[6], "containsMeaningfulChanges");
    objc_msgSend(a1[5], "activeValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(a1[5], "activeValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "BOOLValue");

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D30E20]);

    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a1[5], "home");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithInt:", objc_msgSend(v26, "hf_userCanCreateTrigger") ^ 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D30C80]);

    objc_msgSend(a1[7], "actionNaturalLanguageOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIgnoreOptionalCharacteristics:", 1);
  }
  else
  {
    objc_msgSend(a1[5], "triggerItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_18;
    objc_msgSend(a1[5], "trigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEnabled"))
      v22 = CFSTR("HUSmartAutomationTriggerEnabledValueText");
    else
      v22 = CFSTR("HUSmartAutomationTriggerDisabledValueText");
    _HULocalizedStringWithDefaultValue(v22, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0D30C08]);

  }
LABEL_18:
  objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x1E0D30E98]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[7], "setFormattingStyle:", 1);
  objc_msgSend(a1[8], "setFormattingStyle:", 3);
  objc_msgSend(a1[8], "setShouldUseFullDayNames:", 1);
  if (objc_msgSend(v28, "triggerNameIsConfigured"))
  {
    objc_msgSend(v28, "triggerName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend(a1[5], "recommendationItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(a1[7], "setShouldUseFirstPersonPronounIfPossible:", 1);
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(a1[6], "selectedTriggerBuilder");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "naturalLanguageNameWithOptions:", a1[7]);
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1[6], "selectedTriggerBuilder");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "naturalLanguageDetailsWithOptions:", a1[8]);
    v35 = objc_claimAutoreleasedReturnValue();
LABEL_37:
    v41 = (void *)v35;
LABEL_38:

    goto LABEL_39;
  }
  objc_msgSend(a1[5], "triggerItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(a1[5], "trigger");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "hf_naturalLanguageNameWithOptions:", a1[7]);
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1[5], "trigger");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hf_naturalLangugeDetailsWithOptions:", a1[8]);
    v35 = objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  objc_msgSend(a1[5], "trigger");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(a1[5], "trigger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v39 = v38;
    else
      v39 = 0;
    v34 = v39;

    if (v29)
    {
      v31 = v29;
    }
    else
    {
      v72 = (void *)MEMORY[0x1E0CBA4D0];
      v73 = a1[7];
      objc_msgSend(v34, "events");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "hf_effectiveRecurrences");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "hf_naturalLanguageNameWithOptions:events:recurrences:", v73, v74, v75);
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1[5], "trigger");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "hf_naturalLangugeDetailsWithOptions:", a1[8]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  v31 = 0;
  v41 = 0;
LABEL_39:
  if (objc_msgSend(v31, "length"))
  {
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D30D18]);
    v42 = objc_msgSend(v41, "length");
    v43 = a1[4];
    if (v42)
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0D30BF8]);
    else
      objc_msgSend(v43, "removeObjectForKey:", *MEMORY[0x1E0D30BF8]);
  }
  v44 = *MEMORY[0x1E0D30C60];
  objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v8;
  if (v45)
  {
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v45, v44);
  }
  else
  {
    v46 = objc_alloc(MEMORY[0x1E0D31460]);
    v47 = (void *)objc_msgSend(v46, "initWithImageIdentifier:", *MEMORY[0x1E0D307B0]);
    objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v47, v44);

  }
  v48 = *MEMORY[0x1E0D30B58];
  objc_msgSend(a1[4], "objectForKeyedSubscript:", *MEMORY[0x1E0D30B58]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "mutableCopy");
  v51 = v50;
  v77 = v41;
  if (v50)
    v52 = v50;
  else
    v52 = (id)objc_opt_new();
  v53 = v52;

  objc_msgSend(a1[5], "sourceItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObject:", v54);

  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v53, v48);
  objc_opt_class();
  objc_msgSend(a1[5], "latestResults");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "objectForKeyedSubscript:", v48);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v57 = v56;
  else
    v57 = 0;
  if (v57)
  {
    v58 = v56;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  v59 = v58;
  v60 = v31;

  objc_msgSend(a1[5], "sourceItem");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v59, "containsObject:", v61);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_4;
  aBlock[3] = &unk_1E6F51BE0;
  v63 = a1[4];
  v64 = a1[5];
  v80 = v63;
  v81 = v64;
  v65 = _Block_copy(aBlock);
  v66 = v65;
  if (v62 && !(*((unsigned int (**)(void *))v65 + 2))(v65))
    v67 = 0;
  else
    v67 = 2;
  v68 = (void *)MEMORY[0x1E0D519C0];
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D314B8]), "initWithResults:type:", a1[4], v67);
  objc_msgSend(v68, "futureWithResult:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  return v70;
}

uint64_t __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "homeKitObject");
}

uint64_t __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t v14;

  if (_MergedGlobals_4_8 != -1)
    dispatch_once(&_MergedGlobals_4_8, &__block_literal_global_29_4);
  v2 = (id)qword_1EF226C00;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_7;
  v12 = &unk_1E6F5E678;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  v14 = v4;
  objc_msgSend(v2, "na_map:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v9, v10, v11, v12);

  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_33_3);
  return v7;
}

void __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D30BF8];
  v4[0] = *MEMORY[0x1E0D30D18];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D30C80];
  v4[2] = *MEMORY[0x1E0D30E20];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1EF226C00;
  qword_1EF226C00 = v2;

}

id __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v10 = v8;
  if (v9 == v10)
  {
    v11 = 0;
  }
  else if (v9)
  {
    v11 = objc_msgSend(v9, "isEqual:", v10) ^ 1;
  }
  else
  {
    v11 = 1;
  }

  objc_msgSend(v3, "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __54__HUAvailableTriggerItem__subclass_updateWithOptions___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLValue");
}

- (void)_updateNaturalLanguageOptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  -[HUAvailableTriggerItem triggerItem](self, "triggerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUAvailableTriggerItem trigger](self, "trigger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_anonymousActions");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v28;
LABEL_5:

    v12 = (void *)v5;
    goto LABEL_6;
  }
  -[HUAvailableTriggerItem recommendationItem](self, "recommendationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HUAvailableTriggerItem recommendationItem](self, "recommendationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recommendation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "triggerBuilders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "na_flatMap:", &__block_literal_global_37_1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = v10;
    goto LABEL_5;
  }
  v12 = v28;
LABEL_6:
  v30[1] = 3221225472;
  v30[2] = __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_4;
  v30[3] = &unk_1E6F5E788;
  v30[4] = self;
  v30[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v12, "na_filter:", v30, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    v14 = v13;
  else
    v14 = v29;
  v15 = v14;
  -[HUAvailableTriggerItem triggerNaturalLanguageOptions](self, "triggerNaturalLanguageOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v15, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAvailableTriggerItem triggerNaturalLanguageOptions](self, "triggerNaturalLanguageOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActions:", v17);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0D31960]);
    -[HUAvailableTriggerItem home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "initWithHome:nameType:actions:", v17, 2, v18);
    -[HUAvailableTriggerItem setTriggerNaturalLanguageOptions:](self, "setTriggerNaturalLanguageOptions:", v20);

  }
  v21 = (void *)MEMORY[0x1E0C99E60];
  -[HUAvailableTriggerItem relatedServiceLikeItems](self, "relatedServiceLikeItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "na_flatMap:", &__block_literal_global_46_1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAvailableTriggerItem triggerNaturalLanguageOptions](self, "triggerNaturalLanguageOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObjectsInContext:", v24);

  -[HUAvailableTriggerItem triggerNaturalLanguageOptions](self, "triggerNaturalLanguageOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actionNaturalLanguageOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObjectsInContext:", v24);

}

id __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "triggerActionSets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anonymousActionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_39_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_41_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createNewAction");
}

BOOL __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

uint64_t __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "relatedServiceLikeItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_5;
  v8[3] = &unk_1E6F5DBB8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_isServiceLikeItemInvolved:", a2);
}

id __55__HUAvailableTriggerItem__updateNaturalLanguageOptions__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v2 = a2;
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v2, "homeKitObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_accessoryLikeObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "homeKitObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      v8 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "homeKitObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_accessoryLikeObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HUTriggerLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (NSDictionary)naturalLanguageTitleOptions
{
  return self->_naturalLanguageTitleOptions;
}

- (void)setNaturalLanguageTitleOptions:(id)a3
{
  objc_storeStrong((id *)&self->_naturalLanguageTitleOptions, a3);
}

- (NSArray)relatedServiceLikeItems
{
  return self->_relatedServiceLikeItems;
}

- (void)setRelatedServiceLikeItems:(id)a3
{
  objc_storeStrong((id *)&self->_relatedServiceLikeItems, a3);
}

- (NSNumber)activeValue
{
  return self->_activeValue;
}

- (void)setActiveValue:(id)a3
{
  objc_storeStrong((id *)&self->_activeValue, a3);
}

- (HFTriggerNaturalLanguageOptions)triggerNaturalLanguageOptions
{
  return self->_triggerNaturalLanguageOptions;
}

- (void)setTriggerNaturalLanguageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_triggerNaturalLanguageOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerNaturalLanguageOptions, 0);
  objc_storeStrong((id *)&self->_activeValue, 0);
  objc_storeStrong((id *)&self->_relatedServiceLikeItems, 0);
  objc_storeStrong((id *)&self->_naturalLanguageTitleOptions, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
