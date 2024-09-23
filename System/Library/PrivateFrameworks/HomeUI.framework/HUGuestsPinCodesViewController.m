@implementation HUGuestsPinCodesViewController

- (HUGuestsPinCodesViewController)initWithPinCodeManager:(id)a3 settingsContext:(unint64_t)a4
{
  id v6;
  HUGuestsPinCodesItemManager *v7;
  HUGuestsPinCodesViewController *v8;
  HUGuestsPinCodesViewController *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = -[HUGuestsPinCodesItemManager initWithPinCodeManager:delegate:]([HUGuestsPinCodesItemManager alloc], "initWithPinCodeManager:delegate:", v6, 0);
  v12.receiver = self;
  v12.super_class = (Class)HUGuestsPinCodesViewController;
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v12, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v9 = v8;
  if (v8)
  {
    -[HUGuestsPinCodesViewController setPinCodeManager:](v8, "setPinCodeManager:", v6);
    -[HUGuestsPinCodesViewController setSettingsContext:](v9, "setSettingsContext:", a4);
    _HULocalizedStringWithDefaultValue(CFSTR("HUGuestsPinCodesTitle"), CFSTR("HUGuestsPinCodesTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGuestsPinCodesViewController setTitle:](v9, "setTitle:", v10);

    -[HUItemTableViewController setAutomaticallyUpdatesViewControllerTitle:](v9, "setAutomaticallyUpdatesViewControllerTitle:", 0);
  }

  return v9;
}

- (void)showSpinner
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  -[HUGuestsPinCodesViewController navigationItem](self, "navigationItem");
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
  -[HUGuestsPinCodesViewController navigationItem](self, "navigationItem");
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

  -[HUGuestsPinCodesViewController navigationItem](self, "navigationItem");
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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)HUGuestsPinCodesViewController;
  v6 = a4;
  -[HUItemTableViewController tableView:cellForRowAtIndexPath:](&v25, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableViewController itemManager](self, "itemManager", v25.receiver, v25.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v7, "contentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeGuestAccessDescription"), CFSTR("HUPinCodeGuestAccessDescription"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v13);

    objc_msgSend(v7, "setContentConfiguration:", v12);
LABEL_6:

    goto LABEL_17;
  }
  if (_os_feature_enabled_impl())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      v14 = v9;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_msgSend(v16, "latestResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      HFLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v12, "isEqualToString:", v18);

      if (v19)
      {
        objc_opt_class();
        objc_msgSend(v7, "contentConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
        v22 = v21;

        _HULocalizedStringWithDefaultValue(CFSTR("HUInviteButtonTitle"), CFSTR("HUInviteButtonTitle"), 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setText:", v23);

        objc_msgSend(v7, "setContentConfiguration:", v22);
      }
      goto LABEL_6;
    }
  }
LABEL_17:

  return v7;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v7 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v9, "setShowAccessLevelDescription:", 1);
    objc_msgSend(v9, "setAccessoryType:", 1);
    objc_msgSend(v6, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "setUserHandle:", v11);
      objc_msgSend(v6, "latestResults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D30BA0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityIdentifier:", v13);

    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
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
  HUAddPersonRoleViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HUEditUserViewController *v29;
  id v30;
  id v31;
  HUEditUserViewController *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  HUAddPersonRoleViewController *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  HUEditUserViewController *v42;
  HUAddPersonRoleViewController *v43;
  id v44;
  id v45;
  objc_super v46;
  uint8_t buf[4];
  HUGuestsPinCodesViewController *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayedItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = self;
    v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: User did select row for item: %@", buf, 0x16u);
  }

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v9, "latestResults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

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
        v20 = objc_msgSend(v19, "na_any:", &__block_literal_global_255);

      }
      else
      {
        v20 = 0;
      }

      v37 = [HUAddPersonRoleViewController alloc];
      -[HUItemTableViewController itemManager](self, "itemManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "home");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HUAddPersonRoleViewController initWithHome:](v37, "initWithHome:", v39);

      if (v20)
      {
        -[HUGuestsPinCodesViewController pinCodeManager](self, "pinCodeManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAddPersonRoleViewController setPinCodeManager:](v23, "setPinCodeManager:", v40);

      }
      -[HUAddPersonRoleViewController setPresentationDelegate:](v23, "setPresentationDelegate:", self);
      v29 = (HUEditUserViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v23);
      -[HUEditUserViewController setModalPresentationStyle:](v29, "setModalPresentationStyle:", 2);
      -[HUGuestsPinCodesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      goto LABEL_20;
    }
  }
  v46.receiver = self;
  v46.super_class = (Class)HUGuestsPinCodesViewController;
  -[HUItemTableViewController tableView:didSelectRowAtIndexPath:](&v46, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v21 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    if (-[HUGuestsPinCodesViewController settingsContext](self, "settingsContext"))
    {
      if (-[HUGuestsPinCodesViewController settingsContext](self, "settingsContext") != 1)
      {
LABEL_21:

        goto LABEL_22;
      }
      -[HUAddPersonRoleViewController user](v23, "user");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUItemTableViewController itemManager](self, "itemManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "home");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak((id *)buf, self);
      -[HUGuestsPinCodesViewController pinCodeManager](self, "pinCodeManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userPinCodes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v41[3] = &unk_1E6F531E8;
      objc_copyWeak(&v45, (id *)buf);
      v29 = v24;
      v42 = v29;
      v43 = v23;
      v30 = v26;
      v44 = v30;
      v31 = (id)objc_msgSend(v28, "addSuccessBlock:", v41);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v32 = [HUEditUserViewController alloc];
      -[HUGuestsPinCodesViewController pinCodeManager](self, "pinCodeManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "home");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGuestsPinCodesViewController pinCodeManager](self, "pinCodeManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HUEditUserViewController initWithItem:home:pinCodeManager:](v32, "initWithItem:home:pinCodeManager:", v23, v34, v35);

      -[HUGuestsPinCodesViewController navigationController](self, "navigationController");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (id)objc_msgSend(v30, "hu_pushPreloadableViewController:animated:", v29, 1);
    }

LABEL_20:
    goto LABEL_21;
  }
LABEL_22:

}

uint64_t __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsAccessCodes");
}

void __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  HUPinCodeDetailsViewController *v8;
  void *v9;
  HUPinCodeDetailsViewController *v10;
  void *v11;
  id v12;
  id WeakRetained;
  _QWORD v14[4];
  id v15;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  v14[3] = &unk_1E6F531C0;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v4, "na_firstObjectPassingTest:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(id *)(a1 + 40);
  if (v5)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31638]), "initWithPinCode:inHome:onAccessory:", v5, *(_QWORD *)(a1 + 48), 0);

    v6 = (id)v7;
  }
  v8 = [HUPinCodeDetailsViewController alloc];
  objc_msgSend(WeakRetained, "pinCodeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUPinCodeDetailsViewController initWithItem:pinCodeManager:home:](v8, "initWithItem:pinCodeManager:home:", v6, v9, *(_QWORD *)(a1 + 48));

  objc_msgSend(WeakRetained, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "hu_pushPreloadableViewController:animated:", v10, 1);

}

uint64_t __68__HUGuestsPinCodesViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "userLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
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
    -[HUGuestsPinCodesViewController navigationController](self, "navigationController");
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
  -[HUGuestsPinCodesViewController presentationDelegate](self, "presentationDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishPresentation:animated:", self, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v12;
}

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)objc_loadWeakRetained((id *)&self->presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presentationDelegate, a3);
}

- (unint64_t)settingsContext
{
  return self->_settingsContext;
}

- (void)setSettingsContext:(unint64_t)a3
{
  self->_settingsContext = a3;
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
