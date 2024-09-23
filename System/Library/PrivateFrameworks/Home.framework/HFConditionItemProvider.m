@implementation HFConditionItemProvider

- (HFConditionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithConditions_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFConditionItemProvider.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFConditionItemProvider init]",
    v5);

  return 0;
}

- (HFConditionItemProvider)initWithConditions:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HFConditionItemProvider *v9;
  HFConditionItemProvider *v10;
  uint64_t v11;
  NSMutableSet *conditionItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFConditionItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditions, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    conditionItems = v10->_conditionItems;
    v10->_conditionItems = (NSMutableSet *)v11;

  }
  return v10;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  -[HFConditionItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[HFConditionItemProvider conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __38__HFConditionItemProvider_reloadItems__block_invoke_3;
  v13[3] = &unk_1EA73E1E0;
  v7 = v3;
  v14 = v7;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v5, &__block_literal_global_210, &__block_literal_global_8_11, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __38__HFConditionItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1EA726E30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
  return v9;
}

uint64_t __38__HFConditionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predicate");
}

id __38__HFConditionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "condition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HFPresenceConditionItem *__38__HFConditionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  __objc2_class *v4;
  HFPresenceConditionItem *v5;
  HFPresenceConditionItem *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = HFTimeConditionItem;
LABEL_8:
    v5 = (HFPresenceConditionItem *)objc_msgSend([v4 alloc], "initWithCondition:", v3);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = HFCharacteristicConditionItem;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = HFUnknownConditionItem;
    goto LABEL_8;
  }
  v5 = -[HFPresenceConditionItem initWithCondition:home:]([HFPresenceConditionItem alloc], "initWithCondition:home:", v3, *(_QWORD *)(a1 + 32));
LABEL_9:
  v6 = v5;

  return v6;
}

id __38__HFConditionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "conditionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(WeakRetained, "conditionItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)conditionItems
{
  return self->_conditionItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
