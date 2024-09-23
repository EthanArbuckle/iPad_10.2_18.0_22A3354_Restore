@implementation HUUserAccessoryAccessItemManager

- (HUUserAccessoryAccessItemManager)initWithHome:(id)a3 user:(id)a4 accessoryCategoryType:(id)a5
{
  id v10;
  id v11;
  id v12;
  HUUserAccessoryAccessItemManager *v13;
  HUUserAccessoryAccessItemManager *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserAccessoryAccessItemManager.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserAccessoryAccessItemManager.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserAccessoryAccessItemManager.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryCategoryType"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)HUUserAccessoryAccessItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v19, sel_initWithDelegate_sourceItem_, 0, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_overrideHome, a3);
    objc_storeStrong((id *)&v14->_user, a4);
    objc_storeStrong((id *)&v14->_accessoryCategoryType, a5);
  }

  return v14;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("AccessoriesSection"));
  -[HUUserAccessoryAccessItemManager transformedAllowedAccessoryItemProvider](self, "transformedAllowedAccessoryItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v7, "setItems:", v13);
  _HULocalizedStringWithDefaultValue(CFSTR("HUUserAccessoryAccess_AllowedAccessoriesSection_Header"), CFSTR("HUUserAccessoryAccess_AllowedAccessoriesSection_Header"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHeaderTitle:", v14);

  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v6, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(id *, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  void *v39;
  _BYTE location[12];
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "hf_allUsersIncludingCurrentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserAccessoryAccessItemManager user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    -[HFItemManager home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserAccessoryAccessItemManager user](self, "user");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homeAccessControlForUser:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject restrictedGuestAccessSettings](v10, "restrictedGuestAccessSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessAllowedToAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0D310B0]);
    -[HFItemManager home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithHome:", v14);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest"))
    {
      v16 = objc_alloc_init(MEMORY[0x1E0D315E8]);
      objc_msgSend(v15, "setValueSource:", v16);

    }
    objc_initWeak((id *)location, self);
    v17 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke;
    v36[3] = &unk_1E6F55518;
    objc_copyWeak(&v38, (id *)location);
    v18 = v12;
    v37 = v18;
    objc_msgSend(v15, "setFilter:", v36);
    v19 = objc_alloc(MEMORY[0x1E0D31928]);
    v29 = v17;
    v30 = 3221225472;
    v31 = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_3;
    v32 = &unk_1E6F5FC68;
    objc_copyWeak(&v35, (id *)location);
    v20 = v18;
    v33 = v20;
    v34 = v4;
    v21 = (void *)objc_msgSend(v19, "initWithSourceProvider:transformationBlock:", v15, &v29);
    -[HUUserAccessoryAccessItemManager setTransformedAllowedAccessoryItemProvider:](self, "setTransformedAllowedAccessoryItemProvider:", v21, v29, v30, v31, v32);

    -[HUUserAccessoryAccessItemManager transformedAllowedAccessoryItemProvider](self, "transformedAllowedAccessoryItemProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)location);

  }
  else
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserAccessoryAccessItemManager user](self, "user");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "hf_prettyDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[HUUserAccessoryAccessItemManager _buildItemProvidersForHome:]";
      v41 = 2112;
      v42 = v24;
      v43 = 2112;
      v44 = v25;
      v45 = 2112;
      v46 = v27;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Not creating itemProviders for Home <Name:%@, uniqueIdentifier:%@> becuase it does NOT contain user %@", location, 0x2Au);

    }
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

uint64_t __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CBA1D8];
  objc_msgSend(WeakRetained, "accessoryCategoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_compatibleServiceTypesForCategoryType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_primaryService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "na_safeContainsObject:", v12);

  objc_msgSend(WeakRetained, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentUser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v14, "hf_userIsRestrictedGuest:", v16);

  if ((_DWORD)v12)
  {
    v17 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_2;
    v20[3] = &unk_1E6F4E5D8;
    v21 = v7;
    v18 = v13 & objc_msgSend(v17, "na_any:", v20);

  }
  else if (v13)
  {
    v18 = objc_msgSend(v7, "hf_isRestrictedGuestAllowedAccessory");
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

id __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_3(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D31920]);
  v10 = (void *)objc_msgSend(v5, "copy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_4;
  v14[3] = &unk_1E6F5FC40;
  v15 = v8;
  v16 = a1[4];
  v17 = WeakRetained;
  v18 = a1[5];
  v11 = v8;
  v12 = (void *)objc_msgSend(v9, "initWithSourceItem:transformationBlock:", v10, v14);

  return v12;
}

id __63__HUUserAccessoryAccessItemManager__buildItemProvidersForHome___block_invoke_4(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  v4 = (void *)MEMORY[0x1E0D317C8];
  objc_msgSend(a1[4], "hf_primaryService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serviceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconDescriptorForAccessoryCategoryOrServiceType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30C60]);

  objc_msgSend(a1[5], "containsObject:", a1[4]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30E20]);

  objc_msgSend(a1[6], "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "hf_userIsRestrictedGuest:", v11);

  objc_msgSend(a1[6], "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hf_currentUserIsAdministrator"))
  {
    objc_msgSend(a1[6], "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "user");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "hf_userIsRestrictedGuest:", v15) ^ 1;

  }
  else
  {
    v16 = 1;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16 & ~v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30D70]);

  if ((objc_msgSend(a1[4], "isReachable") & 1) == 0
    && (objc_msgSend(a1[7], "hf_shouldBlockCurrentRestrictedGuestFromHome") & 1) == 0)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUserAccessoryAccess_isUnReachable"), CFSTR("HUUserAccessoryAccess_isUnReachable"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_safeSetObject:forKey:", v18, *MEMORY[0x1E0D30BF8]);

  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  return v2;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUUserAccessoryAccessItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFTransformItemProvider)transformedAllowedAccessoryItemProvider
{
  return self->_transformedAllowedAccessoryItemProvider;
}

- (void)setTransformedAllowedAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transformedAllowedAccessoryItemProvider, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HMUser)user
{
  return self->_user;
}

- (NSString)accessoryCategoryType
{
  return self->_accessoryCategoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryCategoryType, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_transformedAllowedAccessoryItemProvider, 0);
}

@end
