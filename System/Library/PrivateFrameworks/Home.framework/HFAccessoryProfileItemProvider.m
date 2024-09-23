@implementation HFAccessoryProfileItemProvider

- (HFAccessoryProfileItemProvider)initWithHome:(id)a3
{
  id v5;
  HFAccessoryProfileItemProvider *v6;
  HFAccessoryProfileItemProvider *v7;
  uint64_t v8;
  NSMutableSet *profileItems;
  HFAccessoryProfileFilterOptions *v10;
  HFAccessoryProfileFilterOptions *filterOptions;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFAccessoryProfileItemProvider;
  v6 = -[HFItemProvider init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    profileItems = v7->_profileItems;
    v7->_profileItems = (NSMutableSet *)v8;

    v10 = objc_alloc_init(HFAccessoryProfileFilterOptions);
    filterOptions = v7->_filterOptions;
    v7->_filterOptions = v10;

    -[HFAccessoryProfileItemProvider _supportedProfileClasses](v7, "_supportedProfileClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessoryProfileFilterOptions setByClasses:](v7->_filterOptions, "setByClasses:", v12);

  }
  return v7;
}

- (HFAccessoryProfileItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryProfileItemProvider.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryProfileItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryProfileItemProvider home](self, "home");
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id location;

  -[HFAccessoryProfileItemProvider home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_allAccessoryProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryProfileItemProvider filterOptions](self, "filterOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFAccessoryProfileFilter filterProfiles:options:](HFAccessoryProfileFilter, "filterProfiles:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v15, &location);
  v8 = _Block_copy(aBlock);
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v6, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_3;
  v12[3] = &unk_1EA726E30;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

id __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_supportedProfileClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_2;
  v16[3] = &unk_1EA731238;
  v6 = v3;
  v17 = v6;
  v7 = objc_msgSend(v5, "na_any:", v16);

  if ((v7 & 1) == 0)
    NSLog(CFSTR("accessoryProfile %@ class not supported"), v6);

  v8 = objc_opt_class();
  v9 = v6;
  if (!v9)
    goto LABEL_9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v9;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

LABEL_9:
    v11 = 0;
  }

  objc_msgSend(WeakRetained, "_profileItemForProfile:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

id __45__HFAccessoryProfileItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "profileItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "profileItems");
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
  v6.super_class = (Class)HFAccessoryProfileItemProvider;
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

- (id)_profileItemForProfile:(id)a3
{
  id v4;
  HFAccessoryProfileItem *v5;
  void *v6;
  void *v7;
  HFAccessoryProfileItem *v8;

  v4 = a3;
  v5 = [HFAccessoryProfileItem alloc];
  -[HFAccessoryProfileItemProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_characteristicValueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFAccessoryProfileItem initWithProfile:valueSource:](v5, "initWithProfile:valueSource:", v4, v7);

  return v8;
}

- (HFAccessoryProfileFilterOptions)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(id)a3
{
  objc_storeStrong((id *)&self->_filterOptions, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)profileItems
{
  return self->_profileItems;
}

- (void)setProfileItems:(id)a3
{
  objc_storeStrong((id *)&self->_profileItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_filterOptions, 0);
}

@end
