@implementation HUUserCamerasAccessLevelItemManager

- (HUUserCamerasAccessLevelItemManager)initWithHome:(id)a3 userItem:(id)a4 delegate:(id)a5
{
  id v8;
  HUUserCamerasAccessLevelItemManager *v9;
  HUUserCamerasAccessLevelItemManager *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HUUserCamerasAccessLevelItemManager;
  v9 = -[HFItemManager initWithDelegate:sourceItem:](&v12, sel_initWithDelegate_sourceItem_, a5, a4);
  v10 = v9;
  if (v9)
    -[HUUserCamerasAccessLevelItemManager setHomeForUser:](v9, "setHomeForUser:", v8);

  return v10;
}

- (HUUserCamerasAccessLevelItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_userItem_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserCamerasAccessLevelItemManager.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUserCamerasAccessLevelItemManager initWithDelegate:sourceItem:]",
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
  -[HUUserCamerasAccessLevelItemManager homeForUser](self, "homeForUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  char v4;
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
  char v16;

  v4 = !-[HUUserCamerasAccessLevelItemManager _isAllowedToEditTargetUser](self, "_isAllowedToEditTargetUser", a3);
  -[HUUserCamerasAccessLevelItemManager _cameraAccessLevels](self, "_cameraAccessLevels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke;
  v15[3] = &unk_1E6F536A8;
  v15[4] = self;
  v16 = v4;
  objc_msgSend(v5, "na_map:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserCamerasAccessLevelItemManager setAccessLevelItems:](self, "setAccessLevelItems:", v6);

  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUUserCamerasAccessLevelItemManager accessLevelItems](self, "accessLevelItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v10 = (void *)MEMORY[0x1E0C99E20];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v9);
  objc_msgSend(v10, "setWithObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v6[6];
  char v7;

  v3 = objc_msgSend(a2, "integerValue");
  v4 = objc_alloc(MEMORY[0x1E0D31840]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke_2;
  v6[3] = &unk_1E6F53680;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v3;
  v7 = *(_BYTE *)(a1 + 40);
  return (id)objc_msgSend(v4, "initWithResultsBlock:", v6);
}

id __66__HUUserCamerasAccessLevelItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = *MEMORY[0x1E0D30D18];
  HFLocalizedStringFromHMUserCameraAccessLevel();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = CFSTR("HFAccessLevelValueResultKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = *MEMORY[0x1E0D30DA0];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", v7 == objc_msgSend(v6, "_accessLevelForUser:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v9;
  v17[3] = *MEMORY[0x1E0D30C80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v10;
  v17[4] = *MEMORY[0x1E0D30B80];
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "user");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObjects:", v12, 0, v17[0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[HUUserCamerasAccessLevelItemManager accessLevelItems](self, "accessLevelItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);
  v9 = objc_msgSend(v4, "intersectsSet:", v8);

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[HUUserCamerasAccessLevelItemManager accessLevelItems](self, "accessLevelItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsObject:", v16))
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v13);
    }

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUCamerasAccessLevelSectionIdentifier"));
    objc_msgSend(v17, "setItems:", v10);
    if (-[HUUserCamerasAccessLevelItemManager _isAllowedToEditTargetUser](self, "_isAllowedToEditTargetUser"))
    {
      v18 = objc_alloc(MEMORY[0x1E0D31998]);
      -[HFItemManager home](self, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithHome:", v19);

      objc_msgSend(v20, "setStyle:", 1);
      -[HFItemManager home](self, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserCamerasAccessLevelItemManager user](self, "user");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hf_handleForUser:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringForObjectValue:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      HULocalizedStringWithFormat(CFSTR("HUUsersCamerasAccessLevelFooter"), CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFooterTitle:", v31);

    }
    objc_msgSend(v5, "addObject:", v17);

  }
  return v5;
}

- (id)_cameraAccessLevels
{
  return &unk_1E7042C78;
}

- (unint64_t)_accessLevelForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "camerasAccessLevel");
  return v7;
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

  -[HUUserCamerasAccessLevelItemManager user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
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
  if (-[HUUserCamerasAccessLevelItemManager _isUserOwner:](self, "_isUserOwner:", v4))
  {
    v5 = -[HUUserCamerasAccessLevelItemManager _isUserBeingEditedTheDeviceUser](self, "_isUserBeingEditedTheDeviceUser");

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
  if (-[HUUserCamerasAccessLevelItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v8))
  {
    -[HUUserCamerasAccessLevelItemManager user](self, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = !-[HUUserCamerasAccessLevelItemManager _isEditingAllowedForUser:](self, "_isEditingAllowedForUser:", v9);

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSArray)accessLevelItems
{
  return self->_accessLevelItems;
}

- (void)setAccessLevelItems:(id)a3
{
  objc_storeStrong((id *)&self->_accessLevelItems, a3);
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
  objc_storeStrong((id *)&self->_accessLevelItems, 0);
}

@end
