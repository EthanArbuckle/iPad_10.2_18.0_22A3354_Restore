@implementation HUAccessorySettingsProfileViewController

- (HUAccessorySettingsProfileViewController)initWithAccessoryGroupItem:(id)a3
{
  void *v5;
  HUAccessorySettingsProfileItemManager *v6;
  HUAccessorySettingsProfileViewController *v7;
  HUAccessorySettingsProfileViewController *v8;
  void *v9;
  void *v10;
  HUAccessorySettingsProfileModuleController *v11;
  void *v12;
  HUAccessorySettingsProfileModuleController *v13;
  void *v14;
  void *v16;
  objc_super v17;

  v5 = (void *)objc_msgSend(a3, "copy");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsProfileViewController.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  v6 = -[HUAccessorySettingsProfileItemManager initWithDelegate:accessoryGroupItem:]([HUAccessorySettingsProfileItemManager alloc], "initWithDelegate:accessoryGroupItem:", self, v5);
  v17.receiver = self;
  v17.super_class = (Class)HUAccessorySettingsProfileViewController;
  v7 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v17, sel_initWithItemManager_tableViewStyle_, v6, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_item, v5);
    -[HUAccessorySettingsProfileItemManager profileModule](v6, "profileModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySettingsProfileViewController setProfileModule:](v8, "setProfileModule:", v9);

    -[HUAccessorySettingsProfileViewController profileModule](v8, "profileModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v8);

    v11 = [HUAccessorySettingsProfileModuleController alloc];
    -[HUAccessorySettingsProfileViewController profileModule](v8, "profileModule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUAccessorySettingsProfileModuleController initWithModule:](v11, "initWithModule:", v12);
    -[HUAccessorySettingsProfileViewController setProfileModuleController:](v8, "setProfileModuleController:", v13);

    -[HUAccessorySettingsProfileViewController profileModuleController](v8, "profileModuleController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", v8);

  }
  return v8;
}

- (id)itemModuleControllers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[HUAccessorySettingsProfileViewController profileModuleController](self, "profileModuleController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  return v3;
}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)accessorySettingsProfileModuleController:(id)a3 needsNavigationToController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HUAccessorySettingsProfileViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (id)settingsProfileModule:(id)a3 wantsProfileItemDeleted:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  BOOL v37;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v30 = v7;
  objc_msgSend(v7, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsProfileViewControllerRemoveProfile"), CFSTR("HUAccessorySettingsProfileViewControllerRemoveProfile"), 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v29 = v9;
  if (objc_msgSend(v9, "needsReboot"))
    v11 = CFSTR("HUAccessorySettingsProfileViewControllerRemoveNeedsReboot");
  else
    v11 = CFSTR("HUAccessorySettingsProfileViewControllerRemove");
  _HULocalizedStringWithDefaultValue(v11, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsProfileViewControllerDeleteActionTitle"), CFSTR("HUAccessorySettingsProfileViewControllerDeleteActionTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUAccessorySettingsProfileViewControllerCancelActionTitle"), CFSTR("HUAccessorySettingsProfileViewControllerCancelActionTitle"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v31 = v6;
  objc_msgSend(v6, "adapter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfProfiles") == 1;

  v18 = (void *)MEMORY[0x1E0CEA2E0];
  v19 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke;
  v34[3] = &unk_1E6F52960;
  objc_copyWeak(&v36, location);
  v37 = v17;
  v20 = v8;
  v35 = v20;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v13, 2, v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0CEA2E0];
  v32[0] = v19;
  v32[1] = 3221225472;
  v32[2] = __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke_2;
  v32[3] = &unk_1E6F4C6E0;
  v23 = v20;
  v33 = v23;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v14, 1, v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v24);

  -[HUAccessorySettingsProfileViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
  v25 = v33;
  v26 = v23;

  objc_destroyWeak(&v36);
  objc_destroyWeak(location);

  return v26;
}

void __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");

}

void __90__HUAccessorySettingsProfileViewController_settingsProfileModule_wantsProfileItemDeleted___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_cancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:", v2);

}

- (HFAccessorySettingGroupItem)item
{
  return self->_item;
}

- (HUAccessorySettingsProfileModule)profileModule
{
  return self->_profileModule;
}

- (void)setProfileModule:(id)a3
{
  objc_storeStrong((id *)&self->_profileModule, a3);
}

- (HUAccessorySettingsProfileModuleController)profileModuleController
{
  return self->_profileModuleController;
}

- (void)setProfileModuleController:(id)a3
{
  objc_storeStrong((id *)&self->_profileModuleController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileModuleController, 0);
  objc_storeStrong((id *)&self->_profileModule, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
