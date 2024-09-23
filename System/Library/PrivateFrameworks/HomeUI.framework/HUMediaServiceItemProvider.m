@implementation HUMediaServiceItemProvider

+ (id)itemComparator
{
  return &__block_literal_global_258;
}

uint64_t __44__HUMediaServiceItemProvider_itemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  uint64_t v27;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  v12 = v4;
  if (!v12)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v12;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

LABEL_7:
    v14 = 0;
  }

  v17 = objc_opt_class();
  v18 = v5;
  if (v18)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v18;
    if (v19)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v17, objc_opt_class());

  }
  v20 = 0;
LABEL_15:

  objc_msgSend(v14, "mediaService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isServiceRemovable");

  if (v24)
  {
    objc_msgSend(v20, "mediaService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isServiceRemovable");

    if (v26)
    {
      v27 = 0;
      if (v8 && v10)
        v27 = objc_msgSend(v8, "compare:", v10);
    }
    else
    {
      v27 = 1;
    }
  }
  else
  {
    v27 = -1;
  }

  return v27;
}

- (HUMediaServiceItemProvider)initWithHome:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HUMediaServiceItemProvider *v9;
  HUMediaServiceItemProvider *v10;
  uint64_t v11;
  NSMutableSet *items;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUMediaServiceItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = objc_opt_new();
    items = v10->_items;
    v10->_items = (NSMutableSet *)v11;

  }
  return v10;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HUMediaServiceItemProvider _fetchMediaServicesFuture](self, "_fetchMediaServicesFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1E6F5E460;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __41__HUMediaServiceItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_1E6F5E438;
  v6 = (id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 40));
  objc_msgSend(v4, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v3, &__block_literal_global_3_4, &__block_literal_global_5_4, 0, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke_6;
  v10[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v11, v6);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  return v8;
}

uint64_t __41__HUMediaServiceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

id __41__HUMediaServiceItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HUMediaServiceItem *__41__HUMediaServiceItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUMediaServiceItem *v7;
  HUMediaServiceItem *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke_5;
  v11[3] = &unk_1E6F4DAD8;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
  v7 = (HUMediaServiceItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUMediaServiceItem alloc];
    objc_msgSend(WeakRetained, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUMediaServiceItem initWithMediaService:home:](v8, "initWithMediaService:home:", v6, v9);

  }
  return v7;
}

uint64_t __41__HUMediaServiceItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "mediaService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  return v10;
}

id __41__HUMediaServiceItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
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

- (void)registerForExternalUpdates
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addMediaServiceManagerObserver:", self);

}

- (void)unregisterForExternalUpdates
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeMediaServiceManagerObserver:", self);

}

- (void)mediaServicesDidUpdate:(id)a3
{
  if (a3)
    -[HUMediaServiceItemProvider _notifyMediaServicesUpdated](self, "_notifyMediaServicesUpdated");
}

- (id)_fetchMediaServicesFuture
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMediaServiceItemProvider home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaServicesForHome:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__HUMediaServiceItemProvider__fetchMediaServicesFuture__block_invoke;
  v16[3] = &unk_1E6F4C660;
  v7 = v5;
  v17 = v7;
  objc_msgSend(v6, "futureWithBlock:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(MEMORY[0x1E0D31540], "sharedManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[HUMediaServiceItemProvider home](self, "home"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v9, "isRefreshNeededForHome:", v10),
        v10,
        v9,
        v11))
  {
    objc_msgSend(MEMORY[0x1E0D31540], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUMediaServiceItemProvider home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "fetchMediaServicesForHome:", v13);

  }
  return v8;
}

uint64_t __55__HUMediaServiceItemProvider__fetchMediaServicesFuture__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "finishWithResult:", *(_QWORD *)(a1 + 32));
}

- (void)_notifyMediaServicesUpdated
{
  void *v3;
  int v4;
  id v5;

  -[HUMediaServiceItemProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2A96B8);

  if (v4)
  {
    -[HUMediaServiceItemProvider delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaServiceItemProviderDidUpdateServices:", self);

  }
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (HUMediaServiceItemProviderDelegate)delegate
{
  return (HUMediaServiceItemProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
