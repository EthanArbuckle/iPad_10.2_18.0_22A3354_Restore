@implementation HFAccessoryProfileGroupItemProvider

- (HFAccessoryProfileGroupItemProvider)initWithHome:(id)a3
{
  id v5;
  HFAccessoryProfileGroupItemProvider *v6;
  HFAccessoryProfileGroupItemProvider *v7;
  uint64_t v8;
  NSMutableSet *profileGroupItems;
  HFAccessoryProfileFilterOptions *v10;
  HFAccessoryProfileFilterOptions *filterOptions;
  void *v12;
  HFAccessoryProfileGroupOptions *v13;
  HFAccessoryProfileGroupOptions *groupOptions;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFAccessoryProfileGroupItemProvider;
  v6 = -[HFItemProvider init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    profileGroupItems = v7->_profileGroupItems;
    v7->_profileGroupItems = (NSMutableSet *)v8;

    v10 = objc_alloc_init(HFAccessoryProfileFilterOptions);
    filterOptions = v7->_filterOptions;
    v7->_filterOptions = v10;

    -[HFAccessoryProfileGroupItemProvider _supportedProfileClasses](v7, "_supportedProfileClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryProfileFilterOptions setByClasses:](v7->_filterOptions, "setByClasses:", v12);

    v13 = objc_alloc_init(HFAccessoryProfileGroupOptions);
    groupOptions = v7->_groupOptions;
    v7->_groupOptions = v13;

  }
  return v7;
}

- (HFAccessoryProfileGroupItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryProfileGroupItemProvider.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryProfileGroupItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryProfileGroupItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
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
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id location;

  -[HFAccessoryProfileGroupItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allAccessoryProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryProfileGroupItemProvider filterOptions](self, "filterOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryProfileFilter filterProfiles:options:](HFAccessoryProfileFilter, "filterProfiles:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessoryProfileGroupItemProvider groupOptions](self, "groupOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryProfileGroup groupProfiles:options:](HFAccessoryProfileGroup, "groupProfiles:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_3;
  v15[3] = &unk_1EA733DA8;
  v15[4] = self;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v8, &__block_literal_global_104, &__block_literal_global_12_9, 0, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_4;
  v13[3] = &unk_1EA726E30;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v11;
}

uint64_t __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupIdentifier");
}

id __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

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

  objc_msgSend(v6, "groupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "profiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_profileGroupItemForProfiles:groupIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __50__HFAccessoryProfileGroupItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "profileGroupItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "profileGroupItems");
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
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryProfileGroupItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("accessory");
  v7[1] = CFSTR("service");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_supportedProfileClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)_profileGroupItemForProfiles:(id)a3 groupIdentifier:(id)a4
{
  id v6;
  id v7;
  HFAccessoryProfileGroupItem *v8;
  void *v9;
  void *v10;
  void *v11;
  HFAccessoryProfileGroupItem *v12;

  v6 = a4;
  v7 = a3;
  v8 = [HFAccessoryProfileGroupItem alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessoryProfileGroupItemProvider home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_characteristicValueManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HFAccessoryProfileGroupItem initWithProfiles:groupIdentifier:valueSource:](v8, "initWithProfiles:groupIdentifier:valueSource:", v9, v6, v11);

  return v12;
}

- (HFAccessoryProfileFilterOptions)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(id)a3
{
  objc_storeStrong((id *)&self->_filterOptions, a3);
}

- (HFAccessoryProfileGroupOptions)groupOptions
{
  return self->_groupOptions;
}

- (void)setGroupOptions:(id)a3
{
  objc_storeStrong((id *)&self->_groupOptions, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)profileGroupItems
{
  return self->_profileGroupItems;
}

- (void)setProfileGroupItems:(id)a3
{
  objc_storeStrong((id *)&self->_profileGroupItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileGroupItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_groupOptions, 0);
  objc_storeStrong((id *)&self->_filterOptions, 0);
}

@end
