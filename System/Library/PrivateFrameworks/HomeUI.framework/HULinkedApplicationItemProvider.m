@implementation HULinkedApplicationItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HULinkedApplicationItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULinkedApplicationItemProvider.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULinkedApplicationItemProvider init]",
    v5);

  return 0;
}

- (HULinkedApplicationItemProvider)initWithHome:(id)a3
{
  id v5;
  HULinkedApplicationItemProvider *v6;
  HULinkedApplicationItemProvider *v7;
  NSSet *v8;
  NSSet *linkedApplicationItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HULinkedApplicationItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    linkedApplicationItems = v7->_linkedApplicationItems;
    v7->_linkedApplicationItems = v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HULinkedApplicationItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HULinkedApplicationItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id location;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HULinkedApplicationItemProvider home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HULinkedApplicationItemProvider filter](self, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HULinkedApplicationItemProvider filter](self, "filter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_filter:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  +[HUSoftwareLibraryLookupResult resultForAccessories:](HUSoftwareLibraryLookupResult, "resultForAccessories:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __46__HULinkedApplicationItemProvider_reloadItems__block_invoke;
  v17 = &unk_1E6F56808;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v10, "flatMap:", &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recover:", &__block_literal_global_137, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

id __46__HULinkedApplicationItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_generateItemsFromSoftwareLookupResult:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "linkedApplicationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByDiffingWithSet:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D317F0];
  objc_msgSend(WeakRetained, "linkedApplicationItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diffFromSet:toSet:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "setLinkedApplicationItems:", v7);
  v11 = objc_alloc(MEMORY[0x1E0D314A0]);
  objc_msgSend(v10, "additions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deletions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithAddedItems:removedItems:existingItems:", v12, v13, v14);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __46__HULinkedApplicationItemProvider_reloadItems__block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0D314A0]);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v0, "initWithAddedItems:removedItems:existingItems:", v1, v2, v3);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_generateItemsFromSoftwareLookupResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "matchedLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke;
  v18[3] = &unk_1E6F56850;
  v7 = v3;
  v19 = v7;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "na_each:", v18);

  objc_msgSend(v7, "matchedStoreItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke_2;
  v15[3] = &unk_1E6F56878;
  v16 = v7;
  v10 = v8;
  v17 = v10;
  v11 = v7;
  objc_msgSend(v9, "na_each:", v15);

  v12 = v17;
  v13 = v10;

  return v13;
}

void __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HULinkedApplicationLibraryItem *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accessoriesByBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  v8 = -[HULinkedApplicationLibraryItem initWithApplicationProxy:associatedAccessories:]([HULinkedApplicationLibraryItem alloc], "initWithApplicationProxy:associatedAccessories:", v4, v9);

  objc_msgSend(v7, "addObject:", v8);
}

void __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HULinkedApplicationStoreItem *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "accessoriesByStoreIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesStoreIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 40);
  v9 = -[HULinkedApplicationStoreItem initWithStoreItem:associatedAccessories:]([HULinkedApplicationStoreItem alloc], "initWithStoreItem:associatedAccessories:", v4, v10);

  objc_msgSend(v8, "addObject:", v9);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)linkedApplicationItems
{
  return self->_linkedApplicationItems;
}

- (void)setLinkedApplicationItems:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplicationItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplicationItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
