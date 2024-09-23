@implementation HUTriggerConditionSummaryItem

- (HUTriggerConditionSummaryItem)initWithConditions:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUTriggerConditionSummaryItem *v9;
  HUTriggerConditionSummaryItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUTriggerConditionSummaryItem;
  v9 = -[HUTriggerConditionSummaryItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditions, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D31310]);
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HUTriggerConditionSummaryItem conditions](self, "conditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTriggerConditionSummaryItem home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithConditions:home:", v8, v9);

  objc_msgSend(v10, "reloadItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke;
  v15[3] = &unk_1E6F5DDC8;
  v15[4] = self;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v11, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[5];

  objc_msgSend(a2, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_2;
  v18[3] = &unk_1E6F5DCF8;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "sortedArrayUsingComparator:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("triggerConditionSummaryStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &unk_1E7041B78;
  v9 = objc_msgSend(v7, "unsignedIntegerValue");

  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_5;
  v15[3] = &unk_1E6F5DD20;
  v16 = v6;
  v17 = v9;
  v10 = v6;
  objc_msgSend(v10, "na_map:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flatMap:", &__block_literal_global_251);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)MEMORY[0x1E0D319D0];
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "conditions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "comparatorWithSortedObjects:", v8);
  v9 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "condition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "condition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = ((uint64_t (**)(_QWORD, void *, void *))v9)[2](v9, v10, v11);
  return v12;
}

id __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    v6 = 4;
  else
    v6 = 5;
  v7 = *MEMORY[0x1E0D308F8];
  v15[0] = &unk_1E7041B90;
  v8 = *MEMORY[0x1E0D30900];
  v14[0] = v7;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  v14[2] = *MEMORY[0x1E0D30908];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateWithOptions:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "na_map:", &__block_literal_global_17_4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_MergedGlobals_2_1 != -1)
      dispatch_once(&_MergedGlobals_2_1, &__block_literal_global_21_5);
    v5 = (id)qword_1EF226BE0;
    objc_msgSend(v5, "stringForObjectValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_2_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
}

void __61__HUTriggerConditionSummaryItem__subclass_updateWithOptions___block_invoke_4()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D314D0]);
  v1 = (void *)qword_1EF226BE0;
  qword_1EF226BE0 = (uint64_t)v0;

}

- (NSArray)conditions
{
  return self->_conditions;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
