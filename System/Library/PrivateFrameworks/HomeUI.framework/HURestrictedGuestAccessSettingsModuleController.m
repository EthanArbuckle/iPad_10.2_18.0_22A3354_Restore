@implementation HURestrictedGuestAccessSettingsModuleController

- (Class)cellClassForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (void)setupCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  char isKindOfClass;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HURestrictedGuestAccessSettingsModuleController;
  -[HUItemModuleController setupCell:forItem:](&v23, sel_setupCell_forItem_, v6, v7);
  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v10, "sourceItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v13 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    objc_msgSend(v8, "latestResults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(v15, "setUserHandle:", v17);
    +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowAccessLevelDescription:", 1);
    objc_msgSend(v18, "setPrefersSideBySideTextAndSecondaryText:", 0);
    objc_msgSend(v13, "setContentConfiguration:", v18);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v19);

  }
  objc_opt_class();
  v20 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  if (v22)
  {
    objc_msgSend(v22, "setDelegate:", self);
    objc_msgSend(v22, "setOverrideDefaultContentConfiguration:", 0);
  }

}

- (void)userSwitchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _BOOL8 v26;
  id v27;
  void (**v28)(_QWORD);
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  BOOL v49;
  _QWORD aBlock[4];
  id v51;
  id v52;
  id v53;
  BOOL v54;
  uint8_t buf[4];
  HURestrictedGuestAccessSettingsModuleController *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  _BOOL4 v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v4 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v56 = self;
    v57 = 2112;
    v58 = v9;
    v59 = 2112;
    v60 = v10;
    v61 = 1024;
    v62 = v4;
    v63 = 2112;
    v64 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped on switch cell '%@' | isOn = %{BOOL}d | item = %@", buf, 0x30u);

  }
  objc_opt_class();
  -[HUItemModuleController module](self, "module");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  objc_msgSend(v7, "item");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "sourceItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v45 = v17;
    objc_msgSend(v17, "sourceItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6F4C100;
    v43 = v14;
    v23 = v14;
    v51 = v23;
    v54 = v4;
    v24 = v22;
    v52 = v24;
    v46 = v7;
    v25 = v7;
    v26 = v4;
    v27 = v25;
    v53 = v25;
    v28 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v24, "user");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v24;
    objc_msgSend(v24, "home");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    -[HUItemModuleController host](self, "host");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
    v33 = v32;

    objc_msgSend(v23, "accessoryToAdd");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v35 = (void *)MEMORY[0x1E0CEABB8];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_11;
      v47[3] = &unk_1E6F4D200;
      v48 = v27;
      v49 = v26;
      objc_msgSend(v35, "hu_presentingLockLimitAlertIfNeededFromViewController:home:user:accessory:include:continueActionBlock:cancelActionBlock:", v33, v30, v29, v34, v26, v28, v47);

    }
    else
    {
      HFLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        -[HUItemModuleController host](self, "host");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v56 = (HURestrictedGuestAccessSettingsModuleController *)"-[HURestrictedGuestAccessSettingsModuleController userS"
                                                                 "witchCell:didTurnOn:]";
        v57 = 2112;
        v58 = v42;
        _os_log_error_impl(&dword_1B8E1E000, v36, OS_LOG_TYPE_ERROR, "(%s) Unable to find hostVC. Updating access without alert. host = %@", buf, 0x16u);

      }
      v28[2](v28);
    }
    v7 = v46;

    v17 = v45;
    v14 = v43;
  }
  objc_msgSend(v14, "itemUpdater");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(v14, "itemProviders");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "requestToReloadItemProviders:senderSelector:", v39, a2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v37, "performItemUpdateRequest:", v40);

}

void __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "enableRestrictedGuestAccessSetting:forItem:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_2;
  v4[3] = &unk_1E6F4D1D8;
  v5 = *(id *)(a1 + 48);
  v6 = *(_BYTE *)(a1 + 56);
  v3 = (id)objc_msgSend(v2, "addCompletionBlock:", v4);

}

void __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[HURestrictedGuestAccessSettingsModuleController userSwitchCell:didTurnOn:]_block_invoke_2";
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "(%s) Failed to update restricted guest access settings with error %@.", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:operationType:options:retryBlock:cancelBlock:", v4, *MEMORY[0x1E0D30A18], 0, 0, 0);

  }
}

uint64_t __76__HURestrictedGuestAccessSettingsModuleController_userSwitchCell_didTurnOn___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 40) == 0);
}

@end
