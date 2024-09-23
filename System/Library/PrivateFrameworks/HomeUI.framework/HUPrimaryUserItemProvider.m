@implementation HUPrimaryUserItemProvider

- (HUPrimaryUserItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPrimaryUserItemProvider.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUPrimaryUserItemProvider init]",
    v5);

  return 0;
}

- (HUPrimaryUserItemProvider)initWithHome:(id)a3 mediaProfileContainer:(id)a4
{
  id v7;
  id v8;
  HUPrimaryUserItemProvider *v9;
  HUPrimaryUserItemProvider *v10;
  NSMutableSet *v11;
  NSMutableSet *userItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUPrimaryUserItemProvider;
  v9 = -[HFItemProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_mediaProfileContainer, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    userItems = v10->_userItems;
    v10->_userItems = v11;

  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUPrimaryUserItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPrimaryUserItemProvider mediaProfileContainer](self, "mediaProfileContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithHome:mediaProfileContainer:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HUPrimaryUserItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6F53E48;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  -[HUPrimaryUserItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_allUsersIncludingCurrentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v6, 0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __40__HUPrimaryUserItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v8;
}

HUPrimaryUserItem *__40__HUPrimaryUserItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HUPrimaryUserItem *v7;
  void *v8;
  void *v9;
  HUPrimaryUserItem *v10;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = [HUPrimaryUserItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUPrimaryUserItem initWithHome:mediaProfileContainer:user:](v7, "initWithHome:mediaProfileContainer:user:", v8, v9, v6);

  return v10;
}

id __40__HUPrimaryUserItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "userItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "userItems");
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
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUPrimaryUserItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308A0];
  v8[0] = *MEMORY[0x1E0D308F0];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (NSMutableSet)userItems
{
  return self->_userItems;
}

- (void)setUserItems:(id)a3
{
  objc_storeStrong((id *)&self->_userItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItems, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
