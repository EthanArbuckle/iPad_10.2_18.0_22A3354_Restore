@implementation HFControlPanelItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HFControlPanelItemProvider)initWithItem:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  HFControlPanelItemProvider *v8;
  uint64_t v9;
  NSCopying *item;
  uint64_t v11;
  NSSet *controlPanelItems;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFControlPanelItemProvider;
  v8 = -[HFItemProvider init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    item = v8->_item;
    v8->_item = (NSCopying *)v9;

    objc_storeStrong((id *)&v8->_valueSource, a4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    controlPanelItems = v8->_controlPanelItems;
    v8->_controlPanelItems = (NSSet *)v11;

  }
  return v8;
}

- (HFControlPanelItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItem_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFControlPanelItemProvider.m"), 51, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFControlPanelItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFControlPanelItemProvider item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlPanelItemProvider valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithItem:valueSource:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  -[HFControlPanelItemProvider valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFStaticReadPolicy policyWithDecision:](HFStaticReadPolicy, "policyWithDecision:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginTransactionWithReason:readPolicy:logger:", CFSTR("disableControlPanelReads"), v4, 0);

  v5 = (void *)objc_opt_new();
  -[HFControlPanelItemProvider item](self, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, HFItemUpdateOptionPreviousResults);

  -[HFControlPanelItemProvider item](self, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithOptions:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __41__HFControlPanelItemProvider_reloadItems__block_invoke;
  v13[3] = &unk_1EA7289C8;
  v13[4] = self;
  objc_msgSend(v9, "flatMap:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlPanelItemProvider valueSource](self, "valueSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commitTransactionWithReason:", CFSTR("disableControlPanelReads"));

  return v10;
}

id __41__HFControlPanelItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HFItemProviderReloadResults *v16;
  void *v17;
  void *v18;
  void *v19;
  HFItemProviderReloadResults *v20;
  void *v21;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("childItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_86);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  +[HFControlPanelItem standardControlPanelItemsForControlItems:](HFControlPanelItem, "standardControlPanelItemsForControlItems:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "filter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_filter:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(*(id *)(a1 + 32), "controlPanelItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_setByDiffingWithSet:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "controlPanelItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [HFItemProviderReloadResults alloc];
  objc_msgSend(v15, "additions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deletions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v16, "initWithAddedItems:removedItems:existingItems:", v17, v18, v19);

  objc_msgSend(*(id *)(a1 + 32), "setControlPanelItems:", v13);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __41__HFControlPanelItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFControlPanelItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("service");
  v7[1] = CFSTR("serviceGroup");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)controlPanelItemComparator
{
  return &__block_literal_global_21_3;
}

uint64_t __56__HFControlPanelItemProvider_controlPanelItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "sortPriority");
  if (v6 != objc_msgSend(v5, "sortPriority"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "sortPriority"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "sortPriority"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = objc_msgSend(v8, "compare:", v10);
    goto LABEL_10;
  }
  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (!v11)
    goto LABEL_9;
  v12 = 0;
LABEL_10:

  return v12;
}

- (NSCopying)item
{
  return self->_item;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSSet)controlPanelItems
{
  return self->_controlPanelItems;
}

- (void)setControlPanelItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPanelItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
