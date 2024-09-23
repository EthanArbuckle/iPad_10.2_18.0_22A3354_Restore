@implementation HFScheduleRuleItemProvider

- (HFScheduleRuleItemProvider)initWithScheduleBuilder:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HFScheduleRuleItemProvider *v9;
  HFScheduleRuleItemProvider *v10;
  uint64_t v11;
  NSMutableSet *items;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFScheduleRuleItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_scheduleBuilder, a3);
    v11 = objc_opt_new();
    items = v10->_items;
    v10->_items = (NSMutableSet *)v11;

  }
  return v10;
}

- (HFScheduleRuleItemProvider)initWithScheduleBuilder:(id)a3
{
  return -[HFScheduleRuleItemProvider initWithScheduleBuilder:home:](self, "initWithScheduleBuilder:home:", a3, 0);
}

- (HFScheduleRuleItemProvider)initWithHome:(id)a3
{
  return -[HFScheduleRuleItemProvider initWithScheduleBuilder:home:](self, "initWithScheduleBuilder:home:", 0, a3);
}

- (HFScheduleRuleItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithScheduleBuilder_home_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFScheduleRuleItemProvider.m"), 44, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFScheduleRuleItemProvider init]",
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
  -[HFScheduleRuleItemProvider scheduleBuilder](self, "scheduleBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFScheduleRuleItemProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithScheduleBuilder:home:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  -[HFScheduleRuleItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFScheduleRuleItemProvider home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFScheduleRuleItemProvider _scheduleRulesFromHome:](self, "_scheduleRulesFromHome:", v4);
  }
  else
  {
    -[HFScheduleRuleItemProvider scheduleBuilder](self, "scheduleBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rules");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1EA73E058;
  v12[4] = self;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v6, &__block_literal_global_208, &__block_literal_global_9_16, 0, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_5;
  v11[3] = &unk_1EA72C438;
  v11[4] = self;
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __41__HFScheduleRuleItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

uint64_t __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
}

HFScheduleRuleItem *__41__HFScheduleRuleItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  HFScheduleRuleItem *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_4;
  v8[3] = &unk_1EA7295B8;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  v6 = (HFScheduleRuleItem *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = -[HFScheduleRuleItem initWithScheduleRule:]([HFScheduleRuleItem alloc], "initWithScheduleRule:", v5);

  return v6;
}

BOOL __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "rule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == *(void **)(a1 + 32);

  return v8;
}

id __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFScheduleRuleItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("home"));
  objc_msgSend(v3, "addObject:", CFSTR("user"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_scheduleRulesFromHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "restrictedGuestAccessSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guestAccessSchedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFScheduleBuilder scheduleBuilderFromHomeAccessSchedule:](HFScheduleBuilder, "scheduleBuilderFromHomeAccessSchedule:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rules");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void)setScheduleBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
