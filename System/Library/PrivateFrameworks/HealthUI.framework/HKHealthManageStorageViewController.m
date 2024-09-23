@implementation HKHealthManageStorageViewController

- (HKHealthManageStorageViewController)init
{
  HKHealthManageStorageViewController *v2;
  HKHealthManageStorageViewController *v3;
  id v4;
  uint64_t v5;
  HKCloudSyncControl *cloudSyncControl;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKHealthManageStorageViewController;
  v2 = -[HKHealthManageStorageViewController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_status = 0;
    v4 = objc_alloc_init(MEMORY[0x1E0CB6780]);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB63F0]), "initWithHealthStore:", v4);
    cloudSyncControl = v3->_cloudSyncControl;
    v3->_cloudSyncControl = (HKCloudSyncControl *)v5;

    -[HKHealthManageStorageViewController _loadCloudSyncStorageStatus](v3, "_loadCloudSyncStorageStatus");
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHealthManageStorageViewController;
  -[HKHealthManageStorageViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthManageStorageViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t status;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v2 = (int)*MEMORY[0x1E0D80590];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
    return v3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v7 = (void *)getSTStorageAppHeaderCellClass_softClass;
  v35 = getSTStorageAppHeaderCellClass_softClass;
  if (!getSTStorageAppHeaderCellClass_softClass)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __getSTStorageAppHeaderCellClass_block_invoke;
    v31[3] = &unk_1E9C3FDF8;
    v31[4] = &v32;
    __getSTStorageAppHeaderCellClass_block_invoke((uint64_t)v31);
    v7 = (void *)v33[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v32, 8);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "healthAppNotInstalled");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D80458], "settingsIconCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageForKey:", *MEMORY[0x1E0D80660]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("HEALTH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E9C4C428, 0, 0, 0, 0, -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
    objc_msgSend(v15, "setProperty:forKey:", v12, *MEMORY[0x1E0D80870]);
    objc_msgSend(v15, "setName:", v14);
    objc_msgSend(v6, "addObject:", v15);

  }
  else
  {
    objc_msgSend(v8, "specifierForAppIdentifier:", CFSTR("com.apple.Health"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);
  }

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("TURN_OFF_AND_DELETE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  if (status == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = CFSTR("HEALTH_SYNC_IS_DISABLED");
  }
  else
  {
    if (status != 2)
    {
      if (status == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AND_DELETE_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setProperty:forKey:", v19, *MEMORY[0x1E0D80848]);

        objc_msgSend(v6, "addObject:", v16);
        v20 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AND_DELETE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deleteButtonSpecifierWithName:target:action:", v22, self, sel_confirmDisable_);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setProperty:forKey:", &unk_1E9CEC5A8, *MEMORY[0x1E0D806F8]);
        objc_msgSend(v6, "addObject:", v23);

      }
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = CFSTR("TURN_OFF_PROGRESS_MESSAGE");
  }
  objc_msgSend(v24, "localizedStringForKey:value:table:", v26, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProperty:forKey:", v27, *MEMORY[0x1E0D80848]);

  objc_msgSend(v6, "addObject:", v16);
LABEL_15:
  v28 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v6;
  v29 = v6;

  v30 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  return v30;
}

- (void)_loadCloudSyncStorageStatus
{
  HKCloudSyncControl *cloudSyncControl;
  _QWORD v3[5];

  cloudSyncControl = self->_cloudSyncControl;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke;
  v3[3] = &unk_1E9C42A18;
  v3[4] = self;
  -[HKCloudSyncControl fetchCloudSyncStatusWithCompletion:](cloudSyncControl, "fetchCloudSyncStatusWithCompletion:", v3);
}

void __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke_2;
  v2[3] = &unk_1E9C429F0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __66__HKHealthManageStorageViewController__loadCloudSyncStorageStatus__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 1376))
  {
    v2 = 3;
    if (*(_BYTE *)(result + 40))
      v2 = 1;
    *(_QWORD *)(v1 + 1376) = v2;
    return objc_msgSend(*(id *)(result + 32), "reloadSpecifiers");
  }
  return result;
}

- (void)showSpinnerMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIProgressHUD *v7;
  UIProgressHUD *spinnerView;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[HKHealthManageStorageViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x1E0DC3B90]);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v7;

  -[UIProgressHUD setAutoresizingMask:](self->_spinnerView, "setAutoresizingMask:", 45);
  -[UIProgressHUD setFontSize:](self->_spinnerView, "setFontSize:", 16);
  -[UIProgressHUD setText:](self->_spinnerView, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");
  -[HKHealthManageStorageViewController rootController](self, "rootController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 == 1)
  {
    objc_msgSend(v11, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v11, "view");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[UIProgressHUD showInView:](self->_spinnerView, "showInView:", v14);
}

- (void)hideSpinner
{
  UIProgressHUD *spinnerView;
  void *v4;
  id v5;

  -[UIProgressHUD hide](self->_spinnerView, "hide");
  spinnerView = self->_spinnerView;
  self->_spinnerView = 0;

  -[HKHealthManageStorageViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

}

- (void)confirmDisable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0D80498]);
  v12[0] = *MEMORY[0x1E0D807B8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AND_DELETE_PROMPT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x1E0D807B0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AND_DELETE_PROMPT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = *MEMORY[0x1E0D80790];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AND_DELETE_PROMPT_CANCEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupWithDictionary:", v11);

  objc_msgSend(v4, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80798]);
  objc_msgSend(v4, "setTarget:", self);
  objc_msgSend(v4, "setConfirmationAction:", sel__disableAndDelete_);
  -[HKHealthManageStorageViewController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v4);

}

- (void)_disableAndDelete:(id)a3
{
  void *v4;
  void *v5;
  HKCloudSyncControl *cloudSyncControl;
  _QWORD v7[5];

  if (self->_status == 1)
  {
    self->_status = 2;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_PROGRESS_MESSAGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthManageStorageViewController showSpinnerMessage:](self, "showSpinnerMessage:", v5);

    cloudSyncControl = self->_cloudSyncControl;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke;
    v7[3] = &unk_1E9C3FB40;
    v7[4] = self;
    -[HKCloudSyncControl disableCloudSyncAndDeleteAllCloudDataWithCompletion:](cloudSyncControl, "disableCloudSyncAndDeleteAllCloudDataWithCompletion:", v7);
    -[HKHealthManageStorageViewController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

void __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke_2;
  v2[3] = &unk_1E9C429F0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __57__HKHealthManageStorageViewController__disableAndDelete___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "hideSpinner");
  v2 = 3;
  if (!*(_BYTE *)(a1 + 40))
    v2 = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376) = v2;
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_cloudSyncControl, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end
