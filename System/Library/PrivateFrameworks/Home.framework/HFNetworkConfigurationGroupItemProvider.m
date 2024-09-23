@implementation HFNetworkConfigurationGroupItemProvider

- (HFNetworkConfigurationGroupItemProvider)initWithHome:(id)a3
{
  id v5;
  HFNetworkConfigurationGroupItemProvider *v6;
  HFNetworkConfigurationGroupItemProvider *v7;
  uint64_t v8;
  NSMutableSet *groupItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFNetworkConfigurationGroupItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    groupItems = v7->_groupItems;
    v7->_groupItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HFNetworkConfigurationGroupItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFNetworkConfigurationGroupItemProvider.m"), 35, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFNetworkConfigurationGroupItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFNetworkConfigurationGroupItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  -[HFNetworkConfigurationGroupItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryProtectionGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_1EA72A340;
  objc_copyWeak(&v12, &location);
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v4, &__block_literal_global_139, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_1EA726E30;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v7;
}

BOOL __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  objc_msgSend(v6, "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") != 0;

  return v10;
}

HFNetworkConfigurationGroupItem *__54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFNetworkConfigurationGroupItem *v11;
  void *v12;
  void *v13;
  HFNetworkConfigurationGroupItem *v14;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_opt_class();
  v6 = v3;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  v11 = [HFNetworkConfigurationGroupItem alloc];
  objc_msgSend(WeakRetained, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_characteristicValueManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HFNetworkConfigurationGroupItem initWithGroup:valueSource:](v11, "initWithGroup:valueSource:", v8, v13);

  return v14;
}

id __54__HFNetworkConfigurationGroupItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "groupItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "groupItems");
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
  void *v4;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFNetworkConfigurationGroupItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("accessory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)groupItems
{
  return self->_groupItems;
}

- (void)setGroupItems:(id)a3
{
  objc_storeStrong((id *)&self->_groupItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
