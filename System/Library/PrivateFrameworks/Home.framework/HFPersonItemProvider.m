@implementation HFPersonItemProvider

- (HFPersonItemProvider)initWithHome:(id)a3 personManager:(id)a4
{
  id v7;
  id v8;
  HFPersonItemProvider *v9;
  HFPersonItemProvider *v10;
  uint64_t v11;
  NSMutableSet *personItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFPersonItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_personManager, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    personItems = v10->_personItems;
    v10->_personItems = (NSMutableSet *)v11;

  }
  return v10;
}

- (id)reloadItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  HFItemProviderReloadResults *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  HFPersonItemProvider *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFPersonItemProvider personManager](self, "personManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFPersonItemProvider personManager](self, "personManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "completionHandlerAdapter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchAllPersonsWithCompletion:", v6);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __35__HFPersonItemProvider_reloadItems__block_invoke;
    v11[3] = &unk_1EA736180;
    v11[4] = self;
    objc_msgSend(v3, "flatMap:", v11);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory(0x13uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@: Person manager is nil", buf, 0xCu);
    }

    v9 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", 0, 0, 0);
    objc_msgSend(v3, "finishWithResult:", v9);
    v7 = v3;

  }
  return v7;
}

id __35__HFPersonItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__HFPersonItemProvider_reloadItems__block_invoke_2;
  v12[3] = &unk_1EA72ABE0;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, v5, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __35__HFPersonItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1EA72C438;
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "flatMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recover:", &__block_literal_global_177);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

HFPersonItem *__35__HFPersonItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HFPersonItem *v7;
  void *v8;
  void *v9;
  HFPersonItem *v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = [HFPersonItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "personManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFPersonItem initWithPerson:fromPersonManager:home:](v7, "initWithPerson:fromPersonManager:home:", v6, v8, v9);

  return v10;
}

id __35__HFPersonItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v3, "personItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(*(id *)(a1 + 32), "personItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __35__HFPersonItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  HFItemProviderReloadResults *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x29uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Person fetch failed with error %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", 0, 0, 0);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFPersonItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("person"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (void)setPersonManager:(id)a3
{
  objc_storeStrong((id *)&self->_personManager, a3);
}

- (NSMutableSet)personItems
{
  return self->_personItems;
}

- (void)setPersonItems:(id)a3
{
  objc_storeStrong((id *)&self->_personItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personItems, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
