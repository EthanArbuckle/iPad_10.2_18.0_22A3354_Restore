@implementation HURemoteAccessItemManager

- (HURemoteAccessItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5
{
  id v8;
  HURemoteAccessItemManager *v9;
  HURemoteAccessItemManager *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HURemoteAccessItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v12, sel_initWithDelegate_sourceItem_, a5, a4);
  v10 = v9;
  if (v9)
    -[HURemoteAccessItemManager setHomeForUser:](v9, "setHomeForUser:", v8);

  return v10;
}

- (HURemoteAccessItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_userItem_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURemoteAccessItemManager.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HURemoteAccessItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HMUser)user
{
  void *v2;
  void *v3;

  -[HFItemManager sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMUser *)v3;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HURemoteAccessItemManager homeForUser](self, "homeForUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HURemoteAccessItemManager__buildItemProvidersForHome___block_invoke;
  v15[3] = &unk_1E6F4C518;
  v15[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithResultsBlock:", v15);
  -[HURemoteAccessItemManager setAllowRemoteAccessItem:](self, "setAllowRemoteAccessItem:", v5);

  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = objc_alloc(MEMORY[0x1E0D31848]);
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HURemoteAccessItemManager allowRemoteAccessItem](self, "allowRemoteAccessItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithItems:", v10);
  objc_msgSend(v6, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __56__HURemoteAccessItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isAllowedToEditTargetUser") ^ 1;
  v3 = (void *)MEMORY[0x1E0D519C0];
  v19[0] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "_hasResidentDevice") ^ 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCellControlAccessRemotely"), CFSTR("HUUsersCellControlAccessRemotely"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v5;
  v19[2] = *MEMORY[0x1E0D30E20];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_isRemoteAccessAllowedForUser:", v8))
    v9 = 2;
  else
    v9 = 1;
  objc_msgSend(v6, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v10;
  v19[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v11;
  v19[4] = *MEMORY[0x1E0D30B80];
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "user");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  v19[5] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HURemoteAccessItemManager allowRemoteAccessItem](self, "allowRemoteAccessItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    -[HURemoteAccessItemManager allowRemoteAccessItem](self, "allowRemoteAccessItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "containsObject:", v8);

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUControlAccessoriesRemotelySectionIdentifier"));
      v11 = (void *)MEMORY[0x1E0C99D20];
      -[HURemoteAccessItemManager allowRemoteAccessItem](self, "allowRemoteAccessItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setItems:", v13);

      _HULocalizedStringWithDefaultValue(CFSTR("HUUsersCellControlAccessRemotelyFooter"), CFSTR("HUUsersCellControlAccessRemotelyFooter"), 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFooterTitle:", v14);

      objc_msgSend(v5, "addObject:", v10);
    }
  }

  return v5;
}

- (BOOL)_isRemoteAccessAllowedForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isRemoteAccessAllowed");
  return (char)v4;
}

- (BOOL)_isEditingAllowedForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isAdministrator");
  return (char)v4;
}

- (BOOL)_isUserOwner:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isOwner");
  return (char)v4;
}

- (BOOL)_isUserBeingEditedTheDeviceUser
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HURemoteAccessItemManager user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (BOOL)_hasResidentDevice
{
  void *v3;
  char v4;
  void *v5;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hf_supportsRemoteAccessRestrictions") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HFItemManager home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hf_supportsPerUserRemoteAccess");

  }
  return v4;
}

- (BOOL)_isAllowedToEditTargetUser
{
  void *v3;
  void *v4;
  BOOL v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  -[HFItemManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HURemoteAccessItemManager _isUserOwner:](self, "_isUserOwner:", v4))
  {
    v5 = -[HURemoteAccessItemManager _isUserBeingEditedTheDeviceUser](self, "_isUserBeingEditedTheDeviceUser");

    if (!v5)
    {
      LOBYTE(v6) = 1;
      return v6;
    }
  }
  else
  {

  }
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HURemoteAccessItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v8))
  {
    -[HURemoteAccessItemManager user](self, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[HURemoteAccessItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v9);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (HFItem)allowRemoteAccessItem
{
  return self->_allowRemoteAccessItem;
}

- (void)setAllowRemoteAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowRemoteAccessItem, a3);
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
  objc_storeStrong((id *)&self->_homeForUser, a3);
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
  objc_storeStrong((id *)&self->_removeItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_allowRemoteAccessItem, 0);
}

@end
