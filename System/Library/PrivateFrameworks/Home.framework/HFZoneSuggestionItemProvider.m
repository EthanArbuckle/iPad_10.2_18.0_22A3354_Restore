@implementation HFZoneSuggestionItemProvider

- (HFZoneSuggestionItemProvider)initWithHome:(id)a3
{
  id v5;
  HFZoneSuggestionItemProvider *v6;
  HFZoneSuggestionItemProvider *v7;
  uint64_t v8;
  NSMutableSet *zoneBuilderItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFZoneSuggestionItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    zoneBuilderItems = v7->_zoneBuilderItems;
    v7->_zoneBuilderItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HFZoneSuggestionItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFZoneSuggestionItemProvider.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFZoneSuggestionItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFZoneSuggestionItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA73AB30;
  objc_copyWeak(&v22, &location);
  v4 = _Block_copy(aBlock);
  -[HFZoneSuggestionItemProvider _zoneSuggestions](self, "_zoneSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFZoneSuggestionItemProvider home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = objc_msgSend(v6, "count");
  if (v10 >= 2)
    v11 = 2;
  else
    v11 = v10;
  if (v9)
  {
    if (v9 == 1)
      --v11;
    else
      v11 = 0;
  }
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    v14 = MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  if (objc_msgSend(v12, "count") > v11)
  {
    objc_msgSend(v13, "subarrayWithRange:", 0, v11);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:

    v13 = (void *)v14;
  }
  -[HFZoneSuggestionItemProvider filter](self, "filter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v13, &__block_literal_global_175, &__block_literal_global_13_11, v15, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_4;
  v19[3] = &unk_1EA726E30;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v16, "flatMap:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v17;
}

HFZoneBuilderItem *__43__HFZoneSuggestionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  HFZoneBuilder *v5;
  void *v6;
  HFZoneBuilder *v7;
  HFZoneBuilderItem *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HFZoneBuilder alloc];
  objc_msgSend(WeakRetained, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFItemBuilder initWithHome:](v5, "initWithHome:", v6);

  -[HFZoneBuilder setName:](v7, "setName:", v3);
  v8 = -[HFZoneBuilderItem initWithZoneBuilder:]([HFZoneBuilderItem alloc], "initWithZoneBuilder:", v7);

  return v8;
}

id __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

id __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "zoneBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__HFZoneSuggestionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "zoneBuilderItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "zoneBuilderItems");
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
  v5.super_class = (Class)HFZoneSuggestionItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("room"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_zoneSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  -[HFZoneSuggestionItemProvider home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zones");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = (void *)MEMORY[0x1E0C99E60];
  _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneSuggestionMainLevel"), CFSTR("HFZoneSuggestionMainLevel"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneSuggestionBasement"), CFSTR("HFZoneSuggestionBasement"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneSuggestionOutside"), CFSTR("HFZoneSuggestionOutside"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObjects:", v6, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke;
  v13[3] = &unk_1EA726EA8;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "na_filter:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke_2;
  v8[3] = &unk_1EA72E450;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8) ^ 1;

  return v6;
}

uint64_t __48__HFZoneSuggestionItemProvider__zoneSuggestions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
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

- (NSMutableSet)zoneBuilderItems
{
  return self->_zoneBuilderItems;
}

- (void)setZoneBuilderItems:(id)a3
{
  objc_storeStrong((id *)&self->_zoneBuilderItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneBuilderItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
