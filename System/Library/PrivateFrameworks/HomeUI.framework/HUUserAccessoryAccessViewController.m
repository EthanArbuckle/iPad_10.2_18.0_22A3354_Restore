@implementation HUUserAccessoryAccessViewController

- (HUUserAccessoryAccessViewController)initWithHome:(id)a3 user:(id)a4 accessoryCategoryType:(id)a5
{
  id v10;
  id v11;
  id v12;
  HUUserAccessoryAccessItemManager *v13;
  HUUserAccessoryAccessViewController *v14;
  HUUserAccessoryAccessViewController *v15;
  uint64_t v16;
  NSMutableSet *inFlightAllowedAccessoryRemovals;
  uint64_t v18;
  NSMutableSet *inFlightAllowedAccessoryAdditions;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserAccessoryAccessViewController.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("user"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserAccessoryAccessViewController.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserAccessoryAccessViewController.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessoryCategoryType"));

LABEL_4:
  v13 = -[HUUserAccessoryAccessItemManager initWithHome:user:accessoryCategoryType:]([HUUserAccessoryAccessItemManager alloc], "initWithHome:user:accessoryCategoryType:", v10, v11, v12);
  v24.receiver = self;
  v24.super_class = (Class)HUUserAccessoryAccessViewController;
  v14 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v24, sel_initWithItemManager_tableViewStyle_, v13, 1);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_user, a4);
    objc_storeStrong((id *)&v15->_accessoryCategoryType, a5);
    objc_storeStrong((id *)&v15->_userAccessoryAccessItemManager, v13);
    v16 = objc_opt_new();
    inFlightAllowedAccessoryRemovals = v15->_inFlightAllowedAccessoryRemovals;
    v15->_inFlightAllowedAccessoryRemovals = (NSMutableSet *)v16;

    v18 = objc_opt_new();
    inFlightAllowedAccessoryAdditions = v15->_inFlightAllowedAccessoryAdditions;
    v15->_inFlightAllowedAccessoryAdditions = (NSMutableSet *)v18;

  }
  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUUserAccessoryAccessViewController;
  -[HUItemTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x1E0CBA1A8];
  -[HUUserAccessoryAccessViewController accessoryCategoryType](self, "accessoryCategoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_userFriendlyLocalizedCapitalizedPluralDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserAccessoryAccessViewController setTitle:](self, "setTitle:", v5);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  -[HUUserAccessoryAccessViewController userAccessoryAccessItemManager](self, "userAccessoryAccessItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transformedAllowedAccessoryItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if (v9)
  {
    -[HUUserAccessoryAccessViewController home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hf_currentUserIsAdministrator") & 1) != 0)
    {
      -[HUUserAccessoryAccessViewController home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUserAccessoryAccessViewController user](self, "user");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_userIsRestrictedGuest:", v12);

    }
    v13 = (id)objc_opt_class();
  }
  else
  {
    objc_opt_class();
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v13;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUUserAccessoryAccessViewController;
  v9 = a4;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v20, sel_setupCell_forItem_indexPath_, v8, v9, a5);
  -[HUUserAccessoryAccessViewController userAccessoryAccessItemManager](self, "userAccessoryAccessItemManager", v20.receiver, v20.super_class);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transformedAllowedAccessoryItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v9);

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v14 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_msgSend(v16, "setDelegate:", self);
      objc_msgSend(v16, "setIconDisplayStyle:", 1);
LABEL_12:
      +[HUIconCellContentMetrics compactMetrics](HUIconCellContentMetrics, "compactMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setContentMetrics:", v19);

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v17 = v8;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v16 = v18;

      objc_msgSend(v16, "setAccessoryView:", 0);
      objc_msgSend(v16, "setAccessoryType:", 0);
      objc_msgSend(v16, "setHideIcon:", 0);
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9 == 0;
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  SEL v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  BOOL v39;
  _QWORD aBlock[4];
  id v41;
  HUUserAccessoryAccessViewController *v42;
  id v43;
  id v44;
  id v45;
  SEL v46;
  BOOL v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[HUUserAccessoryAccessViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedItemAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v49 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]";
    v50 = 2112;
    v51 = v13;
    v52 = 1024;
    v53 = v4;
    v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "(%s) User tapped switch cell: '%@' | isOn = %{BOOL}d | item = %@", buf, 0x26u);

  }
  v36 = v7;

  objc_opt_class();
  v14 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_opt_class();
  objc_msgSend(v16, "sourceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  -[HUUserAccessoryAccessViewController home](self, "home");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "hf_currentUserIsAdministrator"))
    goto LABEL_12;
  v34 = a2;
  v21 = v4;
  -[HUUserAccessoryAccessViewController home](self, "home");
  v22 = v9;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserAccessoryAccessViewController user](self, "user");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "hf_userIsRestrictedGuest:", v24);

  v9 = v22;
  if (v25)
  {
    objc_msgSend(v19, "accessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserAccessoryAccessViewController home](self, "home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserAccessoryAccessViewController user](self, "user");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke;
    aBlock[3] = &unk_1E6F52AE8;
    v47 = v21;
    v41 = v26;
    v42 = self;
    v43 = v27;
    v44 = v28;
    v46 = v34;
    v29 = v36;
    v45 = v29;
    v35 = v28;
    v33 = v27;
    v20 = v26;
    v30 = _Block_copy(aBlock);
    v31 = (void *)MEMORY[0x1E0CEABB8];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_62;
    v37[3] = &unk_1E6F4D200;
    v32 = v29;
    v9 = v22;
    v38 = v32;
    v39 = v21;
    objc_msgSend(v31, "hu_presentingLockLimitAlertIfNeededFromViewController:home:user:accessory:include:continueActionBlock:cancelActionBlock:", self, v33, v35, v20, v21, v30, v37);

LABEL_12:
  }

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hf_servicesWithBulletinBoardNotificationTurnedOff");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 80))
    v4 = objc_msgSend(v2, "count") != 0;
  else
    v4 = 0;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 80);
    *(_DWORD *)buf = 136316162;
    v20 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke";
    v21 = 1024;
    v22 = v4;
    v23 = 1024;
    v24 = v6;
    v25 = 2048;
    v26 = objc_msgSend(v3, "count");
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) displayNotificationAlert = %{BOOL}d because isOn = %{BOOL}d and servicesWithNotificationOff = (%ld) %@", buf, 0x2Cu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_38;
  aBlock[3] = &unk_1E6F52AC0;
  objc_copyWeak(v17, (id *)buf);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v18 = *(_BYTE *)(a1 + 80);
  v7 = *(id *)(a1 + 32);
  v9 = *(void **)(a1 + 64);
  v8 = *(void **)(a1 + 72);
  v15 = v7;
  v17[1] = v8;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", v3, 1, v10, v10);
  else
    (*((void (**)(void *))v10 + 2))(v10);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_38(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  char v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "homeAccessControlForUser:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "restrictedGuestAccessSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessAllowedToAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSet:", v6);

  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
  else
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_safeAddObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "na_setByRemovingObjectsFromSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v47 = (const char *)WeakRetained;
    v48 = 2112;
    v49 = v16;
    v50 = 2112;
    v51 = v17;
    v52 = 2112;
    v53 = (uint64_t)v18;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ In flight additions: %@ | In flight removals: %@", buf, 0x2Au);

  }
  objc_msgSend(v3, "restrictedGuestAccessSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(v20, "setAccessAllowedToAccessories:", v14);
  objc_msgSend(v14, "na_map:", &__block_literal_global_81);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 80))
      v23 = CFSTR("Including");
    else
      v23 = CFSTR("Removing");
    objc_msgSend(*(id *)(a1 + 48), "hf_minimumDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 136316162;
    v47 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    v48 = 2112;
    v49 = v23;
    v50 = 2112;
    v51 = v24;
    v52 = 2048;
    v53 = v25;
    v54 = 2112;
    v55 = v21;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "(%s) %@ accessory %@. Updating allowed accessories to (count: %ld) %@", buf, 0x34u);

  }
  objc_initWeak((id *)buf, WeakRetained);
  v26 = (void *)MEMORY[0x1E0D519C0];
  v27 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_46;
  v43[3] = &unk_1E6F4D600;
  v28 = v3;
  v44 = v28;
  v29 = v20;
  v45 = v29;
  objc_msgSend(v26, "futureWithBlock:", v43);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v27;
  v40[1] = 3221225472;
  v40[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_49;
  v40[3] = &unk_1E6F4DB40;
  objc_copyWeak(&v42, (id *)buf);
  v41 = *(id *)(a1 + 48);
  v31 = (id)objc_msgSend(v30, "addCompletionBlock:", v40);
  v37[0] = v27;
  v37[1] = 3221225472;
  v37[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_51;
  v37[3] = &unk_1E6F4D188;
  v38 = *(id *)(a1 + 32);
  v39 = *(id *)(a1 + 40);
  v32 = (id)objc_msgSend(v30, "addSuccessBlock:", v37);
  v34[0] = v27;
  v34[1] = 3221225472;
  v34[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_58;
  v34[3] = &unk_1E6F52A58;
  v35 = *(id *)(a1 + 56);
  v36 = *(_BYTE *)(a1 + 80);
  v33 = (id)objc_msgSend(v30, "addFailureBlock:", v34);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);

}

uint64_t __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_minimumDescription");
}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2;
  v7[3] = &unk_1E6F4E2D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateRestrictedGuestSettings:completionHandler:", v4, v7);

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v5, "finishWithError:", v3);
  else
    objc_msgSend(v5, "finishWithNoResult");

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_49(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryAdditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(WeakRetained, "inFlightAllowedAccessoryRemovals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_51(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_53;
  v4[3] = &unk_1E6F4F418;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", v4, 0);

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateAccessControlForUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_2_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[HUUserAccessoryAccessViewController switchCell:didTurnOn:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories with error: %@.", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D30A18], 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(_BYTE *)(a1 + 40) == 0, 1);
}

uint64_t __60__HUUserAccessoryAccessViewController_switchCell_didTurnOn___block_invoke_62(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", *(_BYTE *)(a1 + 40) == 0);
}

- (HMHome)home
{
  return self->_home;
}

- (HMUser)user
{
  return self->_user;
}

- (NSString)accessoryCategoryType
{
  return self->_accessoryCategoryType;
}

- (HUUserAccessoryAccessItemManager)userAccessoryAccessItemManager
{
  return self->_userAccessoryAccessItemManager;
}

- (NSMutableSet)inFlightAllowedAccessoryRemovals
{
  return self->_inFlightAllowedAccessoryRemovals;
}

- (void)setInFlightAllowedAccessoryRemovals:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (NSMutableSet)inFlightAllowedAccessoryAdditions
{
  return self->_inFlightAllowedAccessoryAdditions;
}

- (void)setInFlightAllowedAccessoryAdditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryAdditions, 0);
  objc_storeStrong((id *)&self->_inFlightAllowedAccessoryRemovals, 0);
  objc_storeStrong((id *)&self->_userAccessoryAccessItemManager, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryType, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
