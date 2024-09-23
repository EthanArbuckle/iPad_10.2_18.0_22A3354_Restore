@implementation HFAccessoryCategoryItemProvider

- (HFAccessoryCategoryItemProvider)initWithHome:(id)a3
{
  id v5;
  HFAccessoryCategoryItemProvider *v6;
  HFAccessoryCategoryItemProvider *v7;
  uint64_t v8;
  NSMutableSet *categoryItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAccessoryCategoryItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    categoryItems = v7->_categoryItems;
    v7->_categoryItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend(MEMORY[0x1E0CBA1D8], "hf_standardAccessoryCategoryTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryCategoryItemProvider filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_58, &__block_literal_global_3_2, v5, &__block_literal_global_5_3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_1EA726E30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

id __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "categoryType");
}

HFAccessoryCategoryItem *__46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HFAccessoryCategoryItem *v3;

  v2 = a2;
  v3 = -[HFAccessoryCategoryItem initWithCategoryType:]([HFAccessoryCategoryItem alloc], "initWithCategoryType:", v2);

  return v3;
}

id __46__HFAccessoryCategoryItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "categoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(WeakRetained, "categoryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  v6.super_class = (Class)HFAccessoryCategoryItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("home");
  v7[1] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (NSMutableSet)categoryItems
{
  return self->_categoryItems;
}

- (void)setCategoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_categoryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
