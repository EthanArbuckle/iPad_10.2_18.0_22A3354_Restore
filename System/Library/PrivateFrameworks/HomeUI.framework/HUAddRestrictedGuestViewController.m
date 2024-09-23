@implementation HUAddRestrictedGuestViewController

- (HUAddRestrictedGuestViewController)initWithHome:(id)a3 inviteeAddresses:(id)a4
{
  id v7;
  id v8;
  HUAddRestrictedGuestTableViewController *v9;
  void *v10;
  void *v11;
  HUAddRestrictedGuestViewController *v12;
  void *v13;
  void *v15;
  objc_super v16;

  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAddRestrictedGuestViewController.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inviteeAddresses.count > 0"));

  }
  v9 = -[HUAddRestrictedGuestTableViewController initWithItem:home:inviteeAddresses:]([HUAddRestrictedGuestTableViewController alloc], "initWithItem:home:inviteeAddresses:", 0, v8, v7);

  _HULocalizedStringWithDefaultValue(CFSTR("HUAddRestrictedGuest_Subtitle"), CFSTR("HUAddRestrictedGuest_Subtitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAddRestrictedGuest_Title"), CFSTR("HUAddRestrictedGuest_Title"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HUAddRestrictedGuestViewController;
  v12 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v16, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v11, v10, 0, 3, v9);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_restrictedGuestTableViewController, v9);
    -[HUAddRestrictedGuestTableViewController setDelegate:](v12->_restrictedGuestTableViewController, "setDelegate:", v12);
    -[HUAddRestrictedGuestTableViewController restrictedGuestItemManager](v12->_restrictedGuestTableViewController, "restrictedGuestItemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRestrictedGuestDelegate:", v12);

  }
  return v12;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUAddRestrictedGuestViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAddRestrictedGuest_InviteButton"), CFSTR("HUAddRestrictedGuest_InviteButton"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 2, self, sel_saveButtonPressed_);
  -[HUAddRestrictedGuestViewController setSaveButtonItem:](self, "setSaveButtonItem:", v5);

  -[HUAddRestrictedGuestViewController saveButtonItem](self, "saveButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[HUAddRestrictedGuestViewController saveButtonItem](self, "saveButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (UIBarButtonItem)addButtonItem
{
  void *v2;
  void *v3;

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBarButtonItem *)v3;
}

- (void)setAddButtonItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    -[HUAddRestrictedGuestViewController saveButtonItem](self, "saveButtonItem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

}

- (void)saveButtonPressed:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void (**v44)(void);
  void *v45;
  void *v46;
  _QWORD v48[5];
  _QWORD v49[4];
  void (**v50)(void);
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD aBlock[4];
  id v55;
  id location;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  _BYTE v60[14];
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v58 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]";
    v59 = 2112;
    *(_QWORD *)v60 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) '%@' button tapped.", buf, 0x16u);
  }

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v45);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  objc_msgSend(v45, "startAnimating");
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke;
  aBlock[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v55, &location);
  v7 = _Block_copy(aBlock);
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_19;
  v51[3] = &unk_1E6F4DD30;
  objc_copyWeak(&v53, &location);
  v43 = v7;
  v52 = v43;
  v44 = (void (**)(void))_Block_copy(v51);
  -[HUAddRestrictedGuestViewController restrictedGuestTableViewController](self, "restrictedGuestTableViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rgHomeAccessSettings");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "locksWithReducedFunctionalityDueToSchedule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v42 = v3;
    objc_msgSend(v46, "guestAccessSchedule");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("Always allowed");
    v15 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v46, "locksWithReducedFunctionalityDueToSchedule");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_minimumDescriptionsOfAccessories:", v17);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CBA1A8];
    objc_msgSend(v46, "accessAllowedToAccessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_minimumDescriptionsOfAccessories:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v58 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]";
    v59 = 1024;
    *(_DWORD *)v60 = v10 != 0;
    *(_WORD *)&v60[4] = 2112;
    *(_QWORD *)&v60[6] = v14;
    v61 = 2112;
    v62 = v18;
    v63 = 2112;
    v64 = v22;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "(%s) shouldShowLockScheduleAlert = %{BOOL}d | rgSchedule = %@ | locksWithReducedFunct = %@ | allowedAccessories = %@", buf, 0x30u);

    v3 = v42;
  }

  if (v10)
  {
    objc_msgSend(v46, "accessAllowedToAccessories");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "na_filter:", &__block_literal_global_284);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAddRestrictedGuestViewController restrictedGuestTableViewController](self, "restrictedGuestTableViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "restrictedGuestItemManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "inviteeAddresses");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count") == 1;

    if (v28)
      v29 = CFSTR("%@_SingleGuest");
    else
      v29 = CFSTR("%@_PluralGuests");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v29, CFSTR("HURestrictedGuest_LocksWithReducedFunctionalityDueToSchedule_Alert"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count") == 1)
      v31 = CFSTR("%@_SingleLock");
    else
      v31 = CFSTR("%@_PluralLocks");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v31, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (void *)MEMORY[0x1E0CEA2E8];
    _HULocalizedStringWithDefaultValue(v32, v32, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "alertControllerWithTitle:message:preferredStyle:", &stru_1E6F60E80, v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_2;
    v49[3] = &unk_1E6F55070;
    v50 = v44;
    objc_msgSend(v36, "actionWithTitle:style:handler:", v37, 0, v49);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "addAction:", v38);
    v39 = (void *)MEMORY[0x1E0CEA2E0];
    _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_49;
    v48[3] = &unk_1E6F4C6E0;
    v48[4] = self;
    objc_msgSend(v39, "actionWithTitle:style:handler:", v40, 0, v48);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "addAction:", v41);
    -[HUAddRestrictedGuestViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v35, 1, &__block_literal_global_51_2);

  }
  else
  {
    v44[2]();
  }

  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);

}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "restrictedGuestTableViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "restrictedGuestItemManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inviteeAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 136315394;
    v8 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Sending invitation. Start sending invitation %@", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(WeakRetained, "restrictedGuestTableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendInvites");

}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_servicesAllowingToRGWithNotificationOff");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Presenting");
    v8 = 136315650;
    v9 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    v10 = 2112;
    if (!v4)
      v6 = CFSTR("NOT presenting");
    v11 = v6;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) %@ notification alert because services allowed to RG with notification Off = %@", (uint8_t *)&v8, 0x20u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(WeakRetained, "hu_presentNotificationAlertForNotificationCapableObjects:notificationsEnabled:mainActionBlock:notNowActionBlock:", v3, 1, v7, *(_QWORD *)(a1 + 32));
  else
    (*(void (**)(_QWORD))(v7 + 16))(*(_QWORD *)(a1 + 32));

}

uint64_t __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_29(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7A38]);

  return v4;
}

uint64_t __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Continue' button about the limit for wallet key and pin code due to RG's schedule.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'cancel' button about the limit for wallet key and pin code due to RG's schedule. NOT sending invitation.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "saveButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

}

void __56__HUAddRestrictedGuestViewController_saveButtonPressed___block_invoke_50()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUAddRestrictedGuestViewController saveButtonPressed:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) Displayed alert about wallet key and pin code limits when updating schedule", (uint8_t *)&v1, 0xCu);
  }

}

- (id)_servicesAllowingToRGWithNotificationOff
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[HUAddRestrictedGuestViewController restrictedGuestTableViewController](self, "restrictedGuestTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoriesToAllowToRG");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HUAddRestrictedGuestViewController restrictedGuestTableViewController](self, "restrictedGuestTableViewController", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoriesToAllowToRG");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12), "hf_servicesWithBulletinBoardNotificationTurnedOff");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject na_safeAddObjectsFromArray:](v6, "na_safeAddObjectsFromArray:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v10);
    }

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[HUAddRestrictedGuestViewController restrictedGuestTableViewController](self, "restrictedGuestTableViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accessoriesToAllowToRG");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "-[HUAddRestrictedGuestViewController _servicesAllowingToRGWithNotificationOff]";
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "(%s) Creating invitation that allows access to RG for %@. Among these accessories, services with notifications turned off: %@", buf, 0x20u);

    }
    v17 = -[NSObject copy](v6, "copy");
  }
  else
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[HUAddRestrictedGuestViewController _servicesAllowingToRGWithNotificationOff]";
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "(%s) No accessories to be allowed for restricted guest in this invitation.", buf, 0xCu);
    }
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)_contactForAddress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[HUAddRestrictedGuestViewController _requiredContactKeyDescriptors](self, "_requiredContactKeyDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hf_isPhoneNumber"))
  {
    objc_msgSend(MEMORY[0x1E0D31318], "contactForPhoneNumber:keyDescriptors:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "hf_isEmail"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D31318], "contactForEmailAddress:keyDescriptors:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

- (id)_requiredContactKeyDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)restrictedGuestItemManager:(id)a3 didSendInvitations:(id)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "The invitations were successfully sent. Attempting to dismiss invite flow.", v8, 2u);
  }

  -[HUAddRestrictedGuestViewController setRequiresPresentingViewControllerDismissal:](self, "setRequiresPresentingViewControllerDismissal:", 1);
  -[HUAddRestrictedGuestViewController presentationDelegate](self, "presentationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "finishPresentation:animated:", self, 1);

}

- (void)restrictedGuestItemManager:(id)a3 didFailToSendInvitations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "The invitations were NOT sent due to error {%@}.", (uint8_t *)&v9, 0xCu);
  }

  -[HUAddRestrictedGuestViewController saveButtonItem](self, "saveButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationDelegate, a3);
}

- (BOOL)requiresPresentingViewControllerDismissal
{
  return self->_requiresPresentingViewControllerDismissal;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  self->_requiresPresentingViewControllerDismissal = a3;
}

- (HUAddRestrictedGuestTableViewController)restrictedGuestTableViewController
{
  return self->_restrictedGuestTableViewController;
}

- (void)setRestrictedGuestTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedGuestTableViewController, a3);
}

- (UIBarButtonItem)saveButtonItem
{
  return self->_saveButtonItem;
}

- (void)setSaveButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_saveButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveButtonItem, 0);
  objc_storeStrong((id *)&self->_restrictedGuestTableViewController, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
}

@end
