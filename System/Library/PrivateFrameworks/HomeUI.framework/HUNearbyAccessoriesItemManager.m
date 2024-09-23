@implementation HUNearbyAccessoriesItemManager

- (HUNearbyAccessoriesItemManager)initWithDelegate:(id)a3 sourceProfileItem:(id)a4 supportsQuickControls:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  HUNearbyAccessoriesItemManager *v11;
  uint64_t v12;
  HMAccessory *primaryAccessory;
  objc_super v15;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(v8, "copy");
  v15.receiver = self;
  v15.super_class = (Class)HUNearbyAccessoriesItemManager;
  v11 = -[HFItemManager initWithDelegate:sourceItem:](&v15, sel_initWithDelegate_sourceItem_, v9, v10);

  if (v11)
  {
    objc_msgSend(v8, "accessory");
    v12 = objc_claimAutoreleasedReturnValue();
    primaryAccessory = v11->_primaryAccessory;
    v11->_primaryAccessory = (HMAccessory *)v12;

    v11->_supportsQuickControls = a5;
  }

  return v11;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[HUNearbyAccessoriesItemManager primaryAccessory](self, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProvidersForPrimaryAccessory:inHome:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)_numberOfSections
{
  return 1;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[8];

  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HUNearbyAccessoriesItemManager__comparatorForSectionIdentifier___block_invoke;
  v8[3] = &unk_1E6F5E4E8;
  v8[4] = self;
  v8[5] = v6;
  v8[6] = v4;
  v8[7] = v5;
  return _Block_copy(v8);
}

uint64_t __66__HUNearbyAccessoriesItemManager__comparatorForSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  int v23;
  char v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  char v40;
  void *v41;
  void *v43;
  void *v44;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8 == 0;
  if (v7)
    v10 = -1;
  else
    v10 = 1;
  if ((v7 != 0) != v9)
  {
    objc_msgSend(v5, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D30D18];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "latestResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    v19 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    v22 = objc_msgSend(*(id *)(a1 + 32), "_isServiceItemAssociatedWithPrimaryAccessory:", v18);
    v23 = objc_msgSend(*(id *)(a1 + 32), "_isServiceItemAssociatedWithPrimaryAccessory:", v21);
    if (v22 && v23)
    {
      v10 = objc_msgSend(v13, "localizedStandardCompare:", v15);
LABEL_51:

      goto LABEL_52;
    }
    v24 = v22 | v23;
    if (v22)
      v10 = -1;
    else
      v10 = 1;
    if ((v24 & 1) != 0)
      goto LABEL_51;
    v25 = v16;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    v28 = v19;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
    v30 = v29;

    if (v27)
    {
      objc_msgSend(v27, "accessory");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "hf_primaryService");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v18, "service");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v30)
    {
      objc_msgSend(v30, "accessory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hf_primaryService");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v21, "service");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = *(void **)(a1 + 32);
    objc_msgSend(v44, "serviceType", v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "_isAPreferredServiceType:", v35);

    v37 = *(void **)(a1 + 32);
    objc_msgSend(v33, "serviceType");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "_isAPreferredServiceType:", v38);

    if (v36 && v39)
    {
      v10 = objc_msgSend(v13, "localizedStandardCompare:", v15);
    }
    else
    {
      v40 = v36 | v39;
      if (v36)
        v10 = -1;
      else
        v10 = 1;
      if ((v40 & 1) == 0)
      {
        v10 = v13 ? -1 : v15 != 0;
        if (v13)
        {
          v41 = v43;
          if (v15)
            v10 = objc_msgSend(v13, "localizedStandardCompare:", v15);
          goto LABEL_50;
        }
      }
    }
    v41 = v43;
LABEL_50:

    goto LABEL_51;
  }
LABEL_52:

  return v10;
}

- (BOOL)_isServiceItemAssociatedWithPrimaryAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyAccessoriesItemManager primaryAccessory](self, "primaryAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  objc_super v11;

  v4 = a3;
  -[HUNearbyAccessoriesItemManager userFilteredIdentifiers](self, "userFilteredIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNearbyAccessoriesItemManager setCustomNearbyAccessories:](self, "setCustomNearbyAccessories:", v5);

  v11.receiver = self;
  v11.super_class = (Class)HUNearbyAccessoriesItemManager;
  -[HFItemManager _itemsToHideInSet:](&v11, sel__itemsToHideInSet_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HUNearbyAccessoriesItemManager__itemsToHideInSet___block_invoke;
  v10[3] = &unk_1E6F4DAD8;
  v10[4] = self;
  objc_msgSend(v4, "na_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "unionSet:", v8);
  return v7;
}

uint64_t __52__HUNearbyAccessoriesItemManager__itemsToHideInSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldHideItem:", a2);
}

- (BOOL)hasCustomNearbyAccessories
{
  void *v2;
  BOOL v3;

  -[HUNearbyAccessoriesItemManager customNearbyAccessories](self, "customNearbyAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasEmptyNearbyAccessories
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HUNearbyAccessoriesItemManager customNearbyAccessories](self, "customNearbyAccessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("EmptySetIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)shouldHideItem:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;

  v4 = a3;
  if (!-[HUNearbyAccessoriesItemManager hasCustomNearbyAccessories](self, "hasCustomNearbyAccessories"))
  {
    objc_opt_class();
    v6 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      objc_msgSend(v8, "accessories");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUNearbyAccessoriesItemManager primaryAccessory](self, "primaryAccessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
      {
        objc_msgSend(v8, "service");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v13, "hf_isDisplayableSensor") ^ 1;
        v8 = v6;
LABEL_45:

        goto LABEL_46;
      }
    }
    objc_opt_class();
    v14 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v13 = v15;

    objc_opt_class();
    v16 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    objc_msgSend(v13, "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUNearbyAccessoriesItemManager primaryAccessory](self, "primaryAccessory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
    {
      LOBYTE(v5) = 1;
LABEL_44:

      goto LABEL_45;
    }
    if (v13)
    {
      objc_msgSend(v13, "accessory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "hf_primaryService");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v8)
    {
      objc_msgSend(v8, "service");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    objc_msgSend(v35, "serviceType");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isEqual:", *MEMORY[0x1E0CB9A90]);

    if ((v40 & 1) == 0)
    {
      objc_msgSend(v35, "serviceType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0CB9AA8]);

      if ((v42 & 1) != 0)
      {
        LOBYTE(v5) = 0;
        goto LABEL_43;
      }
      if ((objc_msgSend(v35, "hf_isInGroup") & 1) == 0)
      {
        v44 = (void *)MEMORY[0x1E0D31328];
        -[HFItemManager childItemsForItem:](self, "childItemsForItem:", v16);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "hu_preferredToggleableControlItemInControlItems:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[HUNearbyAccessoriesItemManager supportsQuickControls](self, "supportsQuickControls") || v46)
        {
          if (v18)
          {
            objc_msgSend(v18, "latestResults");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E48]);
            v48 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v49 = v16;
            if (objc_msgSend(v49, "conformsToProtocol:", &unk_1EF2544A8))
              v50 = v49;
            else
              v50 = 0;
            v51 = v50;

            objc_msgSend(v51, "homeKitObject");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v52, "conformsToProtocol:", &unk_1EF2D9368))
              v53 = v52;
            else
              v53 = 0;
            v54 = v53;

            objc_msgSend(v54, "hf_parentRoom");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "uniqueIdentifier");
            v48 = objc_claimAutoreleasedReturnValue();
          }
          v55 = (void *)v48;

          if (v55)
          {
            -[HUNearbyAccessoriesItemManager primaryAccessory](self, "primaryAccessory");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "hf_parentRoom");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "uniqueIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "UUIDString");
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v55, "UUIDString");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v60, "isEqual:", v59) ^ 1;

          }
          else
          {
            LOBYTE(v5) = 1;
          }

          goto LABEL_43;
        }
      }
    }
    LOBYTE(v5) = 1;
LABEL_43:

    goto LABEL_44;
  }
  if (!-[HUNearbyAccessoriesItemManager hasEmptyNearbyAccessories](self, "hasEmptyNearbyAccessories"))
  {
    objc_opt_class();
    v22 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v8 = v23;

    objc_opt_class();
    v24 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v13 = v25;

    objc_opt_class();
    v26 = v24;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
    v18 = v27;

    -[HUNearbyAccessoriesItemManager customNearbyAccessories](self, "customNearbyAccessories");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "service");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "uniqueIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = 1;
    }
    else
    {
      v69 = v18;
      -[HUNearbyAccessoriesItemManager customNearbyAccessories](self, "customNearbyAccessories");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceGroup");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "uniqueIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "UUIDString");
      v68 = v36;
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v33 = 1;
      }
      else
      {
        -[HUNearbyAccessoriesItemManager customNearbyAccessories](self, "customNearbyAccessories");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "accessory");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "uniqueIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "UUIDString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v61);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v38 != 0;

      }
      v18 = v69;
    }

    LOBYTE(v5) = !v33;
    goto LABEL_44;
  }
  LOBYTE(v5) = 1;
LABEL_46:

  return v5;
}

- (BOOL)_isAPreferredServiceType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A70]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A00]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A80]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AD8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AA8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A78]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AA0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9B28]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9B30]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9A10]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9B10]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AC8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB9AD0]);
  }

  return v4;
}

- (id)userFilteredIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HUNearbyAccessoriesItemManager primaryAccessory](self, "primaryAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HUNearbyAccessoryCustomUUIDStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = objc_opt_class();
    v12 = 0;
    objc_msgSend(v5, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v6, objc_opt_class(), v4, &v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v12;
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "Unable to unarchive custom data:%@", buf, 0xCu);
      }

      v10 = v7;
      v7 = MEMORY[0x1E0C9AA70];
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Unarchived custom data:%@", buf, 0xCu);
    }

  }
  else
  {
    HFLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "Associated accessories have never been customized.", buf, 2u);
    }
    v7 = MEMORY[0x1E0C9AA70];
  }

  return v7;
}

+ (id)itemProvidersForPrimaryAccessory:(id)a3 inHome:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_2;
  aBlock[3] = &unk_1E6F5E530;
  v22 = &__block_literal_global_260;
  v7 = a4;
  v8 = _Block_copy(aBlock);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317D8]), "initWithHome:serviceTypes:", v7, 0);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_3;
  v18[3] = &unk_1E6F5E558;
  v19 = v5;
  v20 = v8;
  v10 = v8;
  v11 = v5;
  objc_msgSend(v9, "setFilter:", v18);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D310B0]), "initWithHome:", v7);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_4;
  v16[3] = &unk_1E6F5DA28;
  v17 = &__block_literal_global_260;
  objc_msgSend(v12, "setFilter:", v16);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D317C0]), "initWithHome:", v7);

  v23[0] = v12;
  v23[1] = v13;
  v23[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_showAsAccessoryTile");
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(unsigned int (**)(uint64_t, void *))(v2 + 16))(v2, v3) ^ 1;

  return v4;
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v8 = 1;
  else
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v8;
}

uint64_t __74__HUNearbyAccessoriesItemManager_itemProvidersForPrimaryAccessory_inHome___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v7;
}

- (HMAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setPrimaryAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessory, a3);
}

- (BOOL)supportsQuickControls
{
  return self->_supportsQuickControls;
}

- (void)setSupportsQuickControls:(BOOL)a3
{
  self->_supportsQuickControls = a3;
}

- (NSDictionary)customNearbyAccessories
{
  return self->_customNearbyAccessories;
}

- (void)setCustomNearbyAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_customNearbyAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customNearbyAccessories, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
}

@end
