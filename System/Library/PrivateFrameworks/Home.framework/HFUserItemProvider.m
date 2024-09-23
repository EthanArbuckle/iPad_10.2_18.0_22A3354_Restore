@implementation HFUserItemProvider

- (HFUserItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserItemProvider.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFUserItemProvider init]",
    v5);

  return 0;
}

- (HFUserItemProvider)initWithHome:(id)a3
{
  id v5;
  HFUserItemProvider *v6;
  HFUserItemProvider *v7;
  NSMutableSet *v8;
  NSMutableSet *userItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFUserItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    userItems = v7->_userItems;
    v7->_userItems = v8;

    v7->_includeCurrentUser = 0;
    v7->_includeOtherUsers = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFUserItemProvider home](self, "home");
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
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__HFUserItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72ABE0;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  if (-[HFUserItemProvider includeOtherUsers](self, "includeOtherUsers"))
  {
    -[HFUserItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "users");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HFUserItemProvider home](self, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "users");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (-[HFUserItemProvider includeCurrentUser](self, "includeCurrentUser"))
  {
    -[HFUserItemProvider home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  if (!-[HFUserItemProvider includeGuestUsers](self, "includeGuestUsers"))
  {
    v20[0] = v3;
    v20[1] = 3221225472;
    v20[2] = __33__HFUserItemProvider_reloadItems__block_invoke_2;
    v20[3] = &unk_1EA72A818;
    v20[4] = self;
    objc_msgSend(v8, "na_filter:", v20);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  objc_initWeak(&location, self);
  -[HFUserItemProvider filter](self, "filter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v8, v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = 3221225472;
  v17[2] = __33__HFUserItemProvider_reloadItems__block_invoke_3;
  v17[3] = &unk_1EA726E30;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v14, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
  return v15;
}

HFUserItem *__33__HFUserItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  HFUserItem *v7;
  void *v8;
  HFUserItem *v9;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = [HFUserItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFUserItem initWithHome:user:nameStyle:](v7, "initWithHome:user:nameStyle:", v8, v6, objc_msgSend(*(id *)(a1 + 32), "nameStyle"));

  return v9;
}

uint64_t __33__HFUserItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_userIsRestrictedGuest:", v3);

  return v5 ^ 1u;
}

id __33__HFUserItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFUserItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("user"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)includeCurrentUser
{
  return self->_includeCurrentUser;
}

- (void)setIncludeCurrentUser:(BOOL)a3
{
  self->_includeCurrentUser = a3;
}

- (BOOL)includeOtherUsers
{
  return self->_includeOtherUsers;
}

- (void)setIncludeOtherUsers:(BOOL)a3
{
  self->_includeOtherUsers = a3;
}

- (BOOL)includeGuestUsers
{
  return self->_includeGuestUsers;
}

- (void)setIncludeGuestUsers:(BOOL)a3
{
  self->_includeGuestUsers = a3;
}

- (unint64_t)nameStyle
{
  return self->_nameStyle;
}

- (void)setNameStyle:(unint64_t)a3
{
  self->_nameStyle = a3;
}

- (HMHome)home
{
  return self->_home;
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
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
