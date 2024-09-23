@implementation HUUsersAndGuestsPinCodeViewController

- (HUUsersAndGuestsPinCodeViewController)initWithSourceItem:(id)a3 pinCodeManager:(id)a4 home:(id)a5 forAccessory:(id)a6
{
  id v9;
  id v10;
  id v11;
  HUUsersAndGuestsPinCodeItemManager *v12;
  HUUsersAndGuestsPinCodeViewController *v13;
  HUUsersAndGuestsPinCodeViewController *v14;
  void *v15;
  objc_super v17;

  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = -[HUUsersAndGuestsPinCodeItemManager initWithPinCodeManager:delegate:home:forAccessory:]([HUUsersAndGuestsPinCodeItemManager alloc], "initWithPinCodeManager:delegate:home:forAccessory:", v9, self, v11, v10);

  v17.receiver = self;
  v17.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v17, sel_initWithItemManager_tableViewStyle_, v12, 1);
  v14 = v13;
  if (v13)
  {
    -[HUUsersAndGuestsPinCodeViewController setPinCodeManager:](v13, "setPinCodeManager:", v9);
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersAndGuestsPinCodesTitle"), CFSTR("HUUsersAndGuestsPinCodesTitle"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUsersAndGuestsPinCodeViewController setTitle:](v14, "setTitle:", v15);

    -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](v14, "setAutomaticallyUpdatesViewControllerTitle:", 0);
  }

  return v14;
}

- (void)showSpinner
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  -[HUUsersAndGuestsPinCodeViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  objc_msgSend(v5, "startAnimating");
}

- (void)hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  -[HUUsersAndGuestsPinCodeViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v8 = v6;

  -[HUUsersAndGuestsPinCodeViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", 0);

  objc_msgSend(v8, "stopAnimating");
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v3;
  HUPinCodeListModuleController *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    NSLog(CFSTR("Unexpected module %@"), v3);
  v4 = -[HUPinCodeListModuleController initWithModule:]([HUPinCodeListModuleController alloc], "initWithModule:", v3);

  return v4;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;

  v5 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v5);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v6, "transformedGuestUserItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v5);

    if (v12)
    {
      -[HUUsersAndGuestsPinCodeViewController _isEditingGuestList](self, "_isEditingGuestList");
    }
    else
    {
      objc_msgSend(v6, "restoreHomeKeyAccessItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "isEqual:", v13);

      if ((v14 & 1) == 0)
        NSLog(CFSTR("Unrecognized item in cellClassForItem: %@. Possible race condition"), v5);
    }
  }
  objc_opt_class();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v15;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;

  v27 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if (v11)
  {
    objc_opt_class();
    v12 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v14, "setAccessoryType:", 0);
    objc_msgSend(v7, "latestResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v14, "setUserHandle:", v16);
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v8, "transformedGuestUserItemProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "items");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containsObject:", v7);

  if (v19)
  {
    objc_opt_class();
    v20 = v27;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v14 = v21;

    objc_msgSend(v7, "latestResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v14, "setUserHandle:", v16);
    +[HUListContentConfigurationUtilities labelDefaultConfigurationForItem:](HUListContentConfigurationUtilities, "labelDefaultConfigurationForItem:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShowAccessLevelDescription:", 1);
    objc_msgSend(v23, "setPrefersSideBySideTextAndSecondaryText:", 0);
    objc_msgSend(v20, "setContentConfiguration:", v23);
    if (-[HUUsersAndGuestsPinCodeViewController _isEditingGuestList](self, "_isEditingGuestList"))
      objc_msgSend(v20, "setAccessoryType:", 1);
    objc_opt_class();
    v24 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = v25;

    objc_msgSend(v26, "setOverrideDefaultContentConfiguration:", 0);
    objc_msgSend(v26, "setDelegate:", self);

    goto LABEL_19;
  }
LABEL_20:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v9);

  if ((v12 & 1) != 0
    || _os_feature_enabled_impl()
    && !-[HUUsersAndGuestsPinCodeViewController _isEditingGuestList](self, "_isEditingGuestList")
    && (objc_msgSend(v8, "transformedGuestUserItemProvider"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "items"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "containsObject:", v9),
        v15,
        v14,
        (v16 & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
    v13 = -[HUItemTableViewController tableView:shouldHighlightRowAtIndexPath:](&v18, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
  v6 = a4;
  -[HUItemTableViewController tableView:cellForRowAtIndexPath:](&v17, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager", v17.receiver, v17.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    if (-[HUUsersAndGuestsPinCodeViewController _shouldShowInvitePeople](self, "_shouldShowInvitePeople"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HUUsersAndGuestsPinCodeViewController _addPinCodeItem](self, "_addPinCodeItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          objc_opt_class();
          objc_msgSend(v7, "contentConfiguration");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
          v14 = v13;

          _HULocalizedStringWithDefaultValue(CFSTR("HUInviteButtonTitle"), CFSTR("HUInviteButtonTitle"), 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setText:", v15);

          objc_msgSend(v7, "setContentConfiguration:", v14);
        }
      }
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  HUAddPersonRoleViewController *v27;
  id v28;
  void *v29;
  HUAddPersonRoleViewController *v30;
  HUEditUserViewController *v31;
  void *v32;
  void *v33;
  void *v34;
  HUEditUserViewController *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  int v40;
  void *v41;
  HUAddPersonRoleViewController *v42;
  HUAddPersonRoleViewController *v43;
  id v44;
  void *v45;
  id v46;
  HUAddPersonRoleViewController *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  HUAddPersonRoleViewController *v53;
  id v54;
  id v55[2];
  objc_super v56;
  id location;
  uint8_t buf[4];
  HUUsersAndGuestsPinCodeViewController *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayedItemAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUItemTableViewController itemManager](self, "itemManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);

  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v59 = self;
    v60 = 2080;
    v61 = "-[HUUsersAndGuestsPinCodeViewController tableView:didSelectRowAtIndexPath:]";
    v62 = 2112;
    v63 = v10;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "In %@'s %s, user selected item %@", buf, 0x20u);
  }

  if (_os_feature_enabled_impl())
  {
    if (-[HUUsersAndGuestsPinCodeViewController _shouldShowInvitePeople](self, "_shouldShowInvitePeople"))
    {
      -[HUUsersAndGuestsPinCodeViewController _addPinCodeItem](self, "_addPinCodeItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqual:", v13);

      if (v14)
      {
        -[HUItemTableViewController itemManager](self, "itemManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "home");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "hasOnboardedForAccessCode"))
        {
          -[HUItemTableViewController itemManager](self, "itemManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "home");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "accessories");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "na_any:", &__block_literal_global_153);

        }
        else
        {
          v20 = 0;
        }

        v47 = [HUAddPersonRoleViewController alloc];
        -[HUItemTableViewController itemManager](self, "itemManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "home");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HUAddPersonRoleViewController initWithHome:](v47, "initWithHome:", v49);

        if (v20)
        {
          -[HUUsersAndGuestsPinCodeViewController pinCodeManager](self, "pinCodeManager");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUAddPersonRoleViewController setPinCodeManager:](v27, "setPinCodeManager:", v50);

        }
        -[HUAddPersonRoleViewController setPresentationDelegate:](v27, "setPresentationDelegate:", self);
        v30 = (HUAddPersonRoleViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v27);
        -[HUAddPersonRoleViewController setModalPresentationStyle:](v30, "setModalPresentationStyle:", 2);
        -[HUUsersAndGuestsPinCodeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 1, 0);
        objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);
LABEL_27:

        goto LABEL_28;
      }
    }
  }
  if (_os_feature_enabled_impl())
  {
    if (-[HUUsersAndGuestsPinCodeViewController _isEditingGuestList](self, "_isEditingGuestList"))
    {
      v21 = objc_loadWeakRetained(&location);
      objc_msgSend(v21, "transformedGuestUserItemProvider");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "items");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", v10);

      if (v24)
      {
        objc_opt_class();
        v25 = v10;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
        v27 = v26;

        objc_opt_class();
        -[HUAddPersonRoleViewController sourceItem](v27, "sourceItem");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v29 = v28;
        else
          v29 = 0;
        v30 = v29;

        v31 = [HUEditUserViewController alloc];
        -[HUUsersAndGuestsPinCodeViewController pinCodeManager](self, "pinCodeManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "home");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUUsersAndGuestsPinCodeViewController pinCodeManager](self, "pinCodeManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[HUEditUserViewController initWithItem:home:pinCodeManager:](v31, "initWithItem:home:pinCodeManager:", v30, v33, v34);

        -[HUUsersAndGuestsPinCodeViewController navigationController](self, "navigationController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (id)objc_msgSend(v36, "hu_pushPreloadableViewController:animated:", v35, 1);

        goto LABEL_27;
      }
    }
  }
  v56.receiver = self;
  v56.super_class = (Class)HUUsersAndGuestsPinCodeViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v56, sel_tableView_didSelectRowAtIndexPath_, v7, v8);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v8, 1);
  v38 = objc_loadWeakRetained(&location);
  objc_msgSend(v38, "restoreHomeKeyAccessItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v10, "isEqual:", v39);

  if (v40)
  {
    objc_msgSend(v7, "cellForRowAtIndexPath:", v8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v27 = v41;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v27;
    else
      v42 = 0;
    v43 = v42;

    -[HUAddPersonRoleViewController setShowSpinner:](v43, "setShowSpinner:", 1);
    objc_initWeak((id *)buf, self);
    v44 = objc_loadWeakRetained(&location);
    objc_msgSend(v44, "restoreFuture");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v51[3] = &unk_1E6F58058;
    objc_copyWeak(&v54, (id *)buf);
    objc_copyWeak(v55, &location);
    v52 = v10;
    v55[1] = (id)a2;
    v30 = v43;
    v53 = v30;
    v46 = (id)objc_msgSend(v45, "addSuccessBlock:", v51);

    objc_destroyWeak(v55);
    objc_destroyWeak(&v54);
    objc_destroyWeak((id *)buf);
    goto LABEL_27;
  }
LABEL_28:
  objc_destroyWeak(&location);

}

uint64_t __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

void __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pinCodeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v9[3] = &unk_1E6F58030;
  objc_copyWeak(v12, (id *)(a1 + 56));
  v9[4] = WeakRetained;
  v7 = *(id *)(a1 + 32);
  v8 = *(void **)(a1 + 64);
  v10 = v7;
  v12[1] = v8;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v6, "restoreMissingWalletKeys:completion:", v3, v9);

  objc_destroyWeak(v12);
}

uint64_t __75__HUUsersAndGuestsPinCodeViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setRestoreFuture:", v3);

  objc_msgSend(*(id *)(a1 + 32), "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "updateResultsForItems:senderSelector:", v6, *(_QWORD *)(a1 + 64));

  return objc_msgSend(*(id *)(a1 + 48), "setShowSpinner:", 0);
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  if (!_os_feature_enabled_impl())
  {
    -[HUUsersAndGuestsPinCodeViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "popViewControllerAnimated:", 1);

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = (void *)v15;
    goto LABEL_10;
  }
  v7 = v6;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EF2578B8))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_msgSend(v9, "requiresPresentingViewControllerDismissal");
  if (!v10)
  {
    -[UIViewController hu_dismissViewControllerAnimated:](self, "hu_dismissViewControllerAnimated:", v4);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[HUUsersAndGuestsPinCodeViewController presentationDelegate](self, "presentationDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishPresentation:animated:", self, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v12;
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
  void *v14;
  id v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  BOOL v29;
  uint8_t buf[4];
  HUUsersAndGuestsPinCodeViewController *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
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
    v31 = self;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    v36 = 1024;
    v37 = v4;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped on switch cell '%@' | isOn = %{BOOL}d | item = %@", buf, 0x30u);

  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v7, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  objc_msgSend(v15, "sourceItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v15, "sourceItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v20 = v19;

    objc_msgSend(v12, "enableRestrictedGuestAccessSetting:forItem:", v4, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __66__HUUsersAndGuestsPinCodeViewController_userSwitchCell_didTurnOn___block_invoke;
    v27 = &unk_1E6F4D1D8;
    v28 = v7;
    v29 = v4;
    v22 = (id)objc_msgSend(v21, "addCompletionBlock:", &v24);

  }
  v23 = (id)objc_msgSend(v12, "reloadAndUpdateAllItemsFromSenderSelector:", a2, v24, v25, v26, v27);

}

void __66__HUUsersAndGuestsPinCodeViewController_userSwitchCell_didTurnOn___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[HUUsersAndGuestsPinCodeViewController userSwitchCell:didTurnOn:]_block_invoke";
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "(%s) Failed to update restricted guest access settings with error %@.", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleError:operationType:options:retryBlock:cancelBlock:", v4, *MEMORY[0x1E0D30A18], 0, 0, 0);

  }
}

- (id)_addPinCodeItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HUItemTableViewController itemModuleControllers](self, "itemModuleControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_93_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "module");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addPinCodeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __56__HUUsersAndGuestsPinCodeViewController__addPinCodeItem__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _BOOL8 v6;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "listType") == 2;
  return v6;
}

- (BOOL)_isEditingGuestList
{
  void *v2;
  void *v3;

  -[HUItemTableViewController itemModuleControllers](self, "itemModuleControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_94);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "editing");
  return (char)v2;
}

BOOL __60__HUUsersAndGuestsPinCodeViewController__isEditingGuestList__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _BOOL8 v6;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "module");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "listType") == 2;
  return v6;
}

- (BOOL)_shouldShowInvitePeople
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOptedToHH2");

  if (v6)
  {
    objc_msgSend(v3, "residentDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v8 = 1;
  }
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "residentDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136316162;
    v13 = "-[HUUsersAndGuestsPinCodeViewController _shouldShowInvitePeople]";
    v14 = 1024;
    v15 = v8;
    v16 = 1024;
    v17 = v6;
    v18 = 2048;
    v19 = objc_msgSend(v10, "count");
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowInvitePeople = %{BOOL}d because hasOptedToHH2 = %{BOOL}d | residentDevices.count = %ld | home %@", (uint8_t *)&v12, 0x2Cu);

  }
  return v8;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return (HFPinCodeManager *)objc_loadWeakRetained((id *)&self->_pinCodeManager);
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeWeak((id *)&self->_pinCodeManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pinCodeManager);
  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end
