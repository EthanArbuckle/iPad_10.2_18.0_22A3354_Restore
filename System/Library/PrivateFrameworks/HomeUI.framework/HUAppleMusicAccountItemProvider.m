@implementation HUAppleMusicAccountItemProvider

- (HUAppleMusicAccountItemProvider)initWithMediaProfileContainer:(id)a3
{
  id v5;
  HUAppleMusicAccountItemProvider *v6;
  HUAppleMusicAccountItemProvider *v7;
  uint64_t v8;
  NSMutableSet *items;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAppleMusicAccountItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;

  }
  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D31528], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleMusicMagicAuthCapableAccounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUAppleMusicAccountItemProvider filter](self, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1E6F587B8;
  objc_copyWeak(&v13, &location);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v4, &__block_literal_global_161, &__block_literal_global_3_1, v5, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v8;
}

uint64_t __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

HUAppleMusicAccountItem *__46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  HUAppleMusicAccountItem *v7;
  HUAppleMusicAccountItem *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1E6F58790;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
  v7 = (HUAppleMusicAccountItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [HUAppleMusicAccountItem alloc];
    objc_msgSend(WeakRetained, "mediaProfileContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUAppleMusicAccountItem initWithMediaProfileContainer:account:](v8, "initWithMediaProfileContainer:account:", v9, v6);

  }
  return v7;
}

uint64_t __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

id __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
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

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUAppleMusicAccountItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", *MEMORY[0x1E0D308A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
