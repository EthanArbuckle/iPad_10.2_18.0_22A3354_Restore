@implementation HFScheduleTypeItemProvider

- (HFScheduleTypeItemProvider)initWithScheduleBuilder:(id)a3
{
  id v5;
  HFScheduleTypeItemProvider *v6;
  HFScheduleTypeItemProvider *v7;
  uint64_t v8;
  NSMutableSet *items;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFScheduleTypeItemProvider;
  v6 = -[HFItemProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduleBuilder, a3);
    v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;

    -[HFScheduleTypeItemProvider scheduleBuilder](v7, "scheduleBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_selectedType = objc_msgSend(v10, "estimatedScheduleType");

  }
  return v7;
}

- (HFScheduleTypeItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithUser_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFScheduleTypeItemProvider.m"), 80, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFScheduleTypeItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, self);
  -[HFScheduleTypeItemProvider scheduleTypes](self, "scheduleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_1EA73EE38;
  objc_copyWeak(&v11, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v3, &__block_literal_global_218, &__block_literal_global_44_7, 0, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_5;
  v8[3] = &unk_1EA726E30;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

id __41__HFScheduleTypeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
}

HFScheduleTypeItem *__41__HFScheduleTypeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HFScheduleTypeItem *v7;
  HFScheduleTypeItem *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1EA7295B8;
  v6 = v3;
  v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v7 = (HFScheduleTypeItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HFScheduleTypeItem alloc];
    v9 = objc_msgSend(v6, "unsignedIntegerValue");
    objc_msgSend(WeakRetained, "scheduleBuilder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HFScheduleTypeItem initWithScheduleType:scheduleBuilder:](v8, "initWithScheduleType:scheduleBuilder:", v9, v10);

  }
  return v7;
}

BOOL __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;

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
    v7 = objc_msgSend(v6, "type");
    v8 = v7 == objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateSelectedType:(unint64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];

  -[HFScheduleTypeItemProvider setSelectedType:](self, "setSelectedType:");
  -[HFScheduleTypeItemProvider items](self, "items");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HFScheduleTypeItemProvider_updateSelectedType___block_invoke;
  v7[3] = &__block_descriptor_40_e16_v16__0__HFItem_8l;
  v7[4] = a3;
  objc_msgSend(v5, "na_each:", v7);

}

void __49__HFScheduleTypeItemProvider_updateSelectedType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  v6 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v6;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "setSelected:", objc_msgSend(v5, "type") == *(_QWORD *)(a1 + 32));
}

- (id)scheduleTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1EA7CD390, &unk_1EA7CD3A8, &unk_1EA7CD3C0, 0);
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void)setScheduleBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleBuilder, a3);
}

- (unint64_t)selectedType
{
  return self->_selectedType;
}

- (void)setSelectedType:(unint64_t)a3
{
  self->_selectedType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
