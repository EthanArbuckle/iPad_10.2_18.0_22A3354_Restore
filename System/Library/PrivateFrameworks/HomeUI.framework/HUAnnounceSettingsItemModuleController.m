@implementation HUAnnounceSettingsItemModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUAnnounceSettingsItemModuleController;
  -[HUItemModuleController setupCell:forItem:](&v13, sel_setupCell_forItem_, v6, a4);
  objc_opt_class();
  v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
    objc_msgSend(v9, "setDelegate:", self);
  objc_opt_class();
  v10 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
    objc_msgSend(v12, "setDelegate:", self);

}

- (void)updateCell:(id)a3 forItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  int v53;
  id v54;
  objc_super v55;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v55.receiver = self;
  v55.super_class = (Class)HUAnnounceSettingsItemModuleController;
  -[HUItemModuleController updateCell:forItem:animated:](&v55, sel_updateCell_forItem_animated_, v8, v9, v5);
  objc_opt_class();
  v10 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    objc_opt_class();
    v13 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      objc_msgSend(v13, "latestResults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DA0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "BOOLValue"))
        v18 = 3;
      else
        v18 = 0;
      objc_msgSend(v12, "setAccessoryType:", v18);

      objc_msgSend(v12, "setDisabled:", 0);
    }

  }
  objc_opt_class();
  v19 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v21)
  {
    objc_opt_class();
    v22 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;
    v24 = v23;

    if (v24)
    {
      objc_msgSend(v24, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "user");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hf_handleForUser:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setUserHandle:", v27);

      objc_msgSend(v21, "setOn:", objc_msgSend(v24, "isAnnounceEnabled"));
      if ((objc_msgSend(v25, "hf_currentUserIsOwner") & 1) != 0)
      {
        v28 = 0;
      }
      else if (objc_msgSend(v25, "hf_currentUserIsAdministrator"))
      {
        objc_msgSend(v26, "uniqueIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentUser");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v29, "hmf_isEqualToUUID:", v31);

        objc_msgSend(v25, "homeAccessControlForUser:", v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = objc_msgSend(v32, "isAdministrator");

        v28 = v30 & ~v53;
      }
      else
      {
        v28 = 1;
      }
      objc_msgSend(v21, "setDisabled:", v28);

    }
  }
  objc_opt_class();
  v33 = v19;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v34 = v33;
  else
    v34 = 0;
  v35 = v34;

  if (v35)
  {
    v54 = v12;
    objc_opt_class();
    v36 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v37 = v36;
    else
      v37 = 0;
    v38 = v37;

    objc_opt_class();
    objc_msgSend(v38, "sourceItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v40 = v39;
    else
      v40 = 0;
    v41 = v40;

    v42 = v41;
    if (objc_msgSend(v42, "conformsToProtocol:", &unk_1EF2AC470))
      v43 = v42;
    else
      v43 = 0;
    v44 = v43;

    objc_msgSend(v44, "accessories");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "anyObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "home");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "hf_currentUserIsAdministrator");

    objc_msgSend(v38, "sourceItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "conformsToProtocol:", &unk_1EF2AC1D8))
      v50 = v49;
    else
      v50 = 0;
    v51 = v50;

    if (v51)
    {
      objc_msgSend(v35, "setOn:", objc_msgSend(v51, "isAnnounceEnabled"));
      objc_msgSend(v35, "setDisabled:", v48 ^ 1u);
      objc_msgSend(v35, "setIconDisplayStyle:", 1);
      +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setContentMetrics:", v52);

    }
    v12 = v54;
  }

}

- (unint64_t)didSelectItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "updateNotificationSettings:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__HUAnnounceSettingsItemModuleController_didSelectItem___block_invoke;
    v11[3] = &unk_1E6F4C0D8;
    v11[4] = self;
    v12 = v4;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

  }
  return 0;
}

uint64_t __56__HUAnnounceSettingsItemModuleController_didSelectItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;
  uint64_t v4;

  if (a2)
    v3 = a3 == 0;
  else
    v3 = 0;
  v4 = v3;
  return objc_msgSend(*(id *)(a1 + 32), "_submitAnalyticsForAnnounceNotificationSettingItem:writeWasSuccessfull:", *(_QWORD *)(a1 + 40), v4);
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_opt_class();
  objc_msgSend(v6, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  objc_opt_class();
  objc_msgSend(v12, "sourceItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_opt_class();
  objc_msgSend(v12, "sourceItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v15 | v18)
  {
    objc_msgSend(v6, "item");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enableAnnounceSetting:forItem:", v4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__HUAnnounceSettingsItemModuleController_switchCell_didTurnOn___block_invoke;
    v27[3] = &unk_1E6F50330;
    v27[4] = self;
    v28 = v6;
    v29 = v4;
    v21 = (id)objc_msgSend(v20, "addCompletionBlock:", v27);

  }
  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (v24)
  {
    if (v15)
      v25 = (void *)v15;
    else
      v25 = (void *)v18;
    v26 = v25;
    if (!v26)
      v26 = v12;
    objc_msgSend(MEMORY[0x1E0D31170], "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v26, v4, CFSTR("announceAccessoryItem"), v24);

  }
}

void __63__HUAnnounceSettingsItemModuleController_switchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v8 = a3 == 0;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v6, "_submitAnalyticsForAnnounceHomePodSettingItem:enabled:writeWasSuccessfull:", v7, *(unsigned __int8 *)(a1 + 48), v9);

  if (a3)
    objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  BOOL v28;

  v4 = a4;
  v7 = a3;
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v7, "item");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "item");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enablePermissionSetting:forItem:", v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __67__HUAnnounceSettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke;
    v26[3] = &unk_1E6F50330;
    v26[4] = self;
    v27 = v7;
    v28 = v4;
    v15 = (id)objc_msgSend(v14, "addCompletionBlock:", v26);

  }
  objc_msgSend(v10, "itemUpdater");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(v10, "itemProviders");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestToReloadItemProviders:senderSelector:", v18, a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v16, "performItemUpdateRequest:", v19);

  objc_opt_class();
  -[HUItemModuleController host](self, "host");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0D31170];
    objc_msgSend(v7, "item");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sendSwitchCellToggleEventForItem:isOn:title:fromSourceViewController:", v25, v4, CFSTR("userDisplayString"), v23);

  }
}

void __67__HUAnnounceSettingsItemModuleController_userSwitchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v8 = a3 == 0;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v6, "_submitAnalyticsForAnnounceUserSettingItem:enabled:writeWasSuccessfull:", v7, *(unsigned __int8 *)(a1 + 48), v9);

  if (a3)
    objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 48) == 0, 1);
}

- (void)_submitAnalyticsForAnnounceUserSettingItem:(id)a3 enabled:(BOOL)a4 writeWasSuccessfull:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_opt_class();
  v29 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v29;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D301E0]);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "currentUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isEqual:", v16));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30298]);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "user");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hf_userIsAdministrator:", v19))
    v20 = objc_msgSend(v11, "hf_currentUserIsOwner") ^ 1;
  else
    v20 = 0;
  objc_msgSend(v18, "numberWithInt:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30290]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "hf_currentUserIsOwner"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D30280]);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(v11, "hf_currentUserIsAdministrator"))
    v24 = objc_msgSend(v11, "hf_currentUserIsOwner") ^ 1;
  else
    v24 = 0;
  objc_msgSend(v23, "numberWithInt:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D30278]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D30270]);

  -[HUAnnounceSettingsItemModuleController _populateHostInformation:](self, "_populateHostInformation:", v12);
  v27 = (void *)MEMORY[0x1E0D31170];
  v28 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v27, "sendEvent:withData:", 21, v28);

}

- (void)_submitAnalyticsForAnnounceHomePodSettingItem:(id)a3 enabled:(BOOL)a4 writeWasSuccessfull:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  objc_opt_class();
  v24 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v24;
  else
    v9 = 0;
  v10 = v9;

  objc_opt_class();
  objc_msgSend(v10, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D301D8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "hf_currentUserIsOwner"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D30280]);

  v18 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(v14, "hf_currentUserIsAdministrator"))
    v19 = objc_msgSend(v14, "hf_currentUserIsOwner") ^ 1;
  else
    v19 = 0;
  objc_msgSend(v18, "numberWithInt:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D30278]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D30270]);

  -[HUAnnounceSettingsItemModuleController _populateHostInformation:](self, "_populateHostInformation:", v15);
  v22 = (void *)MEMORY[0x1E0D31170];
  v23 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v22, "sendEvent:withData:", 22, v23);

}

- (void)_submitAnalyticsForAnnounceNotificationSettingItem:(id)a3 writeWasSuccessfull:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  v22 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v22;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "notificationMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D301F0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsOwner"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D30280]);

  v16 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(v12, "hf_currentUserIsAdministrator"))
    v17 = objc_msgSend(v12, "hf_currentUserIsOwner") ^ 1;
  else
    v17 = 0;
  objc_msgSend(v16, "numberWithInt:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D30278]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D30270]);

  -[HUAnnounceSettingsItemModuleController _populateHostInformation:](self, "_populateHostInformation:", v13);
  v20 = (void *)MEMORY[0x1E0D31170];
  v21 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v20, "sendEvent:withData:", 23, v21);

}

- (void)_populateHostInformation:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[HUItemModuleController host](self, "host");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0;
  v6 = v15;
  if (v5)
    v6 = 0;
  objc_msgSend(v6, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[HUItemModuleController host](self, "host");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  -[HUItemModuleController host](self, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", isKindOfClass & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D30288]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10 & 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D302A8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 & 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D302A0]);

}

@end
