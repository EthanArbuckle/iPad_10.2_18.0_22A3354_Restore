@implementation HFActionSetSuggestionItem

- (HFActionSetSuggestionItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFActionSetSuggestionItem.m"), 32, CFSTR("Use -initWithHome:builtInActionSetType:"));

  return 0;
}

- (HFActionSetSuggestionItem)initWithHome:(id)a3 actionSet:(id)a4
{
  id v7;
  id v8;
  HFActionSetSuggestionItem *v9;
  HFActionSetSuggestionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFActionSetSuggestionItem;
  v9 = -[HFActionSetSuggestionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_actionSet, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  HFMutableItemUpdateOutcome *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HFActionSetSuggestionVendor *v15;
  void *v16;
  void *v17;
  HFActionSetSuggestionVendor *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  HFActionSetSuggestionVendor *v32;
  id v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  HFActionSetValueSource *v39;
  void *v40;
  HFServiceActionItem *v41;
  void *v42;
  HFServiceActionItem *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  HFMutableItemUpdateOutcome *v50;
  void *v51;
  _QWORD v52[4];
  HFMutableItemUpdateOutcome *v53;
  id v54;

  v4 = a3;
  v5 = objc_alloc_init(HFMutableItemUpdateOutcome);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFActionSetSuggestionItem actionSet](self, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    -[HFActionSetSuggestionItem actionSet](self, "actionSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, CFSTR("dependentHomeKitObjects"));

    -[HFActionSetSuggestionItem serviceLikeItem](self, "serviceLikeItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HFActionSetSuggestionItem serviceLikeItem](self, "serviceLikeItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "services");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFActionSetSuggestionFilter filterWithServices:](HFActionSetSuggestionFilter, "filterWithServices:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = [HFActionSetSuggestionVendor alloc];
    -[HFActionSetSuggestionItem home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetSuggestionItem actionSet](self, "actionSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v11;
    v18 = -[HFActionSetSuggestionVendor initWithHome:actionSet:filter:](v15, "initWithHome:actionSet:filter:", v16, v17, v11);

    v54 = 0;
    -[HFActionSetSuggestionVendor buildWithOutDependentServiceTypes:](v18, "buildWithOutDependentServiceTypes:", &v54);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v54;
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("dependentServiceTypes"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("actionSetBuilder"));
    objc_msgSend(v19, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v21, CFSTR("title"));

    -[HFActionSetSuggestionItem actionSet](self, "actionSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_iconDescriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("icon"));

    objc_msgSend(v19, "actions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "na_any:", &__block_literal_global_47);

    if (-[HFActionSetSuggestionItem includeExistingActionSets](self, "includeExistingActionSets"))
    {
      v26 = 0;
    }
    else
    {
      -[HFActionSetSuggestionItem actionSet](self, "actionSet");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "actions");
      v50 = v5;
      v29 = v19;
      v30 = v20;
      v31 = v6;
      v32 = v18;
      v33 = v4;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v34, "count") != 0;

      v4 = v33;
      v18 = v32;
      v6 = v31;
      v20 = v30;
      v19 = v29;
      v5 = v50;

    }
    if (-[HFActionSetSuggestionItem persistAddedSuggestions](self, "persistAddedSuggestions"))
    {
      if (v25)
        -[HFActionSetSuggestionItem setHasEverHadValidSuggestion:](self, "setHasEverHadValidSuggestion:", 1);
      v35 = -[HFActionSetSuggestionItem hasEverHadValidSuggestion](self, "hasEverHadValidSuggestion");
      v25 |= v35;
      v26 &= ~v35;
    }
    if (!v25 || v26)
    {
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }
    else
    {
      v36 = v4;
      -[HFActionSetSuggestionItem serviceLikeItem](self, "serviceLikeItem");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        -[HFActionSetSuggestionItem serviceLikeItem](self, "serviceLikeItem");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[HFActionSetValueSource initWithActionSetBuilder:]([HFActionSetValueSource alloc], "initWithActionSetBuilder:", v19);
        v40 = (void *)objc_msgSend(v38, "copyWithValueSource:", v39);

        v41 = [HFServiceActionItem alloc];
        -[HFActionSetSuggestionItem home](self, "home");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[HFServiceActionItem initWithHome:containingItem:](v41, "initWithHome:containingItem:", v42, v40);

        v44 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v19, "actions");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setWithArray:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFServiceActionItem setActionBuilders:](v43, "setActionBuilders:", v46);

        -[HFItem updateWithOptions:](v43, "updateWithOptions:", v36);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __57__HFActionSetSuggestionItem__subclass_updateWithOptions___block_invoke_2;
        v52[3] = &unk_1EA7289C8;
        v53 = v5;
        objc_msgSend(v47, "flatMap:", v52);
        v48 = objc_claimAutoreleasedReturnValue();

        v4 = v36;
        v6 = (void *)v48;
      }
      else
      {
        v4 = v36;
      }
    }
    v27 = v6;

  }
  else
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    v27 = v6;
  }

  return v27;
}

BOOL __57__HFActionSetSuggestionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

uint64_t __57__HFActionSetSuggestionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("description"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("description"));

  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (HMHome)home
{
  return self->_home;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (void)setServiceLikeItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)includeExistingActionSets
{
  return self->_includeExistingActionSets;
}

- (void)setIncludeExistingActionSets:(BOOL)a3
{
  self->_includeExistingActionSets = a3;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  self->_persistAddedSuggestions = a3;
}

- (BOOL)hasEverHadValidSuggestion
{
  return self->_hasEverHadValidSuggestion;
}

- (void)setHasEverHadValidSuggestion:(BOOL)a3
{
  self->_hasEverHadValidSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
