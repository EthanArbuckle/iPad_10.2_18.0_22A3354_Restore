@implementation HRElectrocardiogramWatchAppInstallability

- (HRElectrocardiogramWatchAppInstallability)init
{
  HRElectrocardiogramWatchAppInstallability *v2;
  id v3;
  uint64_t v4;
  HKWatchAppAvailability *ecgAppAvailability;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HRElectrocardiogramWatchAppInstallability;
  v2 = -[HRElectrocardiogramWatchAppInstallability init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD4110]);
    v4 = objc_msgSend(v3, "initWithBundleID:", *MEMORY[0x24BDD2BD0]);
    ecgAppAvailability = v2->_ecgAppAvailability;
    v2->_ecgAppAvailability = (HKWatchAppAvailability *)v4;

  }
  return v2;
}

- (void)setAllowInstallingElectrocardiogramWatchApp:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  HRElectrocardiogramWatchAppInstallability *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  _BOOL4 v21;
  _QWORD v22[2];

  v3 = a3;
  v22[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_setElectrocardiogramWatchAppInstallIsAllowed:", v3);

  v7 = objc_alloc(MEMORY[0x24BDBCF20]);
  v8 = *MEMORY[0x24BDD2BE0];
  v22[0] = *MEMORY[0x24BDD2BE0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithArray:", v9);

  HKSynchronizeNanoPreferencesUserDefaults();
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = self;
    v16 = 2114;
    v17 = v13;
    v18 = 2114;
    v19 = v8;
    v20 = 1026;
    v21 = v3;
    _os_log_impl(&dword_215454000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Triggered NanoPreferencesSync (key: %{public}@; value: %{public}d)",
      (uint8_t *)&v14,
      0x26u);

  }
}

+ (BOOL)isElectrocardiogramAppDeletableForActiveWatch
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD3D78], "activeNonFamilySetupDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CFACCB8-FFEB-4682-A50E-16F853583912"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

- (void)electrocardiogramAppInstallStateOnActiveWatch:(id)a3
{
  void *v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  HRElectrocardiogramWatchAppInstallability *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD3D78];
  v6 = (void (**)(id, _QWORD, void *))a3;
  objc_msgSend(v5, "activeNonFamilySetupDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HRElectrocardiogramWatchAppInstallability ecgAppAvailability](self, "ecgAppAvailability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appInstallStateOnWatch:completion:", v7, v6);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_215454000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> No active device", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("No active device"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v8);
  }

}

- (void)checkElectrocardiogramAppInstallStateWithContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  _BYTE location[12];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "isElectrocardiogramAppDeletableForActiveWatch") & 1) != 0)
  {
    objc_initWeak((id *)location, self);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke;
    v12[3] = &unk_24D34A880;
    objc_copyWeak(v15, (id *)location);
    v15[1] = (id)a2;
    v14 = v8;
    v13 = v7;
    -[HRElectrocardiogramWatchAppInstallability electrocardiogramAppInstallStateOnActiveWatch:](self, "electrocardiogramAppInstallStateOnActiveWatch:", v12);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = self;
      v17 = 2114;
      v18 = v11;
      _os_log_impl(&dword_215454000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Skipping check for if ECG app is installed, active watch does not support standalone apps", location, 0x16u);

    }
    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[3];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2;
    block[3] = &unk_24D34A858;
    v8 = v5;
    v9 = WeakRetained;
    v12[1] = a1[7];
    v11 = a1[5];
    v10 = a1[4];
    v12[2] = a2;
    objc_copyWeak(v12, a1 + 6);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v12);

  }
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  id v34[2];
  _QWORD v35[4];
  id v36;
  id v37[2];
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2_cold_1(a1, v3, v2);
    v4 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", CFSTR("error"), v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ECG_APP_INSTALL_PROMPT_CANCEL_BUTTON_TITLE"), &stru_24D34B1B8, CFSTR("HealthUI-Localizable-Cinnamon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_206;
    v38[3] = &unk_24D34A7E0;
    v40 = *(id *)(a1 + 56);
    v39 = *(id *)(a1 + 32);
    objc_msgSend(v7, "actionWithTitle:style:handler:", v10, 1, v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "addAction:", v11);
    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 80) - 1;
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3010];
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT);
    if (v12 > 1)
    {
      if (v14)
      {
        v22 = *(_QWORD *)(a1 + 40);
        v23 = *(const char **)(a1 + 72);
        v24 = v13;
        NSStringFromSelector(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v22;
        v43 = 2114;
        v44 = (uint64_t)v25;
        _os_log_impl(&dword_215454000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG App is not installed on watch, presenting install prompt", buf, 0x16u);

      }
      v26 = *(void **)(a1 + 40);
      v27 = MEMORY[0x24BDAC760];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_212;
      v35[3] = &unk_24D34A808;
      objc_copyWeak(v37, (id *)(a1 + 64));
      v37[1] = *(id *)(a1 + 72);
      v36 = *(id *)(a1 + 56);
      v29 = v27;
      v30 = 3221225472;
      v31 = __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_214;
      v32 = &unk_24D34A830;
      objc_copyWeak(v34, (id *)(a1 + 64));
      v34[1] = *(id *)(a1 + 72);
      v33 = *(id *)(a1 + 56);
      objc_msgSend(v26, "installElectrocardiogramAppAlertController:cancel:", v35, &v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v28, 1, 0, v29, v30, v31, v32);

      objc_destroyWeak(v34);
      objc_destroyWeak(v37);
    }
    else
    {
      if (v14)
      {
        v15 = *(_QWORD *)(a1 + 40);
        v16 = *(const char **)(a1 + 72);
        v17 = v13;
        NSStringFromSelector(v16);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138543874;
        if (v20 == 2)
          v21 = CFSTR("installed");
        else
          v21 = CFSTR("installing");
        v42 = v15;
        v43 = 2114;
        v44 = v18;
        v45 = 2114;
        v46 = v21;
        _os_log_impl(&dword_215454000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> ECG App is %{public}@ on watch", buf, 0x20u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_206(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_212(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = WeakRetained;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_215454000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> User elected to install ECG App", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_214(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = WeakRetained;
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_215454000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> User cancelled install prompt for ECG App", (uint8_t *)&v7, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)installElectrocardiogramAppAlertController:(id)a3 cancel:(id)a4
{
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
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v27;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;

  v27 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ECG_APP_INSTALL_PROMPT_TITLE"), &stru_24D34B1B8, CFSTR("HealthUI-Localizable-Cinnamon"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ECG_APP_INSTALL_PROMPT_BODY"), &stru_24D34B1B8, CFSTR("HealthUI-Localizable-Cinnamon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ECG_APP_INSTALL_PROMPT_CANCEL_BUTTON_TITLE"), &stru_24D34B1B8, CFSTR("HealthUI-Localizable-Cinnamon"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke;
  v31[3] = &unk_24D34A8A8;
  v32 = v5;
  v18 = v5;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v17, 1, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ECG_APP_INSTALL_PROMPT_INSTALL_BUTTON_TITLE"), &stru_24D34B1B8, CFSTR("HealthUI-Localizable-Cinnamon"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HKConditionallyRedactedHeartRhythmString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_2;
  v29[3] = &unk_24D34A920;
  v29[4] = self;
  v30 = v27;
  v24 = v27;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v23, 0, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v19);
  objc_msgSend(v13, "addAction:", v25);

  return v13;
}

uint64_t __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = (void *)objc_opt_class();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_3;
  v3[3] = &unk_24D34A8F8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "installElectrocardiogramAppOnActiveWatch:", v3);

}

void __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_4;
  block[3] = &unk_24D34A8D0;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __95__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppAlertController_cancel___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

+ (void)installElectrocardiogramAppOnActiveWatch:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SEL v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD3D78], "activeNonFamilySetupDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v7 = (void *)getASDSystemAppMetadataClass_softClass;
    v27 = getASDSystemAppMetadataClass_softClass;
    v8 = MEMORY[0x24BDAC760];
    if (!getASDSystemAppMetadataClass_softClass)
    {
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __getASDSystemAppMetadataClass_block_invoke;
      v22 = &unk_24D34A970;
      v23 = &v24;
      __getASDSystemAppMetadataClass_block_invoke((uint64_t)&v19);
      v7 = (void *)v25[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v24, 8);
    v10 = [v9 alloc];
    v11 = (void *)objc_msgSend(v10, "initWithBundleID:", *MEMORY[0x24BDD2BD0]);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v12 = (void *)getASDInstallAppsClass_softClass;
    v27 = getASDInstallAppsClass_softClass;
    if (!getASDInstallAppsClass_softClass)
    {
      v19 = v8;
      v20 = 3221225472;
      v21 = __getASDInstallAppsClass_block_invoke;
      v22 = &unk_24D34A970;
      v23 = &v24;
      __getASDInstallAppsClass_block_invoke((uint64_t)&v19);
      v12 = (void *)v25[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v24, 8);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke;
    v15[3] = &unk_24D34A948;
    v17 = a1;
    v18 = a2;
    v16 = v5;
    objc_msgSend(v13, "installApp:onPairedDevice:withCompletionHandler:", v11, v6, v15);

  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      +[HRElectrocardiogramWatchAppInstallability installElectrocardiogramAppOnActiveWatch:].cold.1((uint64_t)a1, v14, a2);
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:description:", 100, CFSTR("No active device"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);
  }

}

void __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void (*v7)(void);
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3010];
  v6 = *MEMORY[0x24BDD3010];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1((uint64_t)a1, v5, (uint64_t)v4);
    v7 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[5];
      v8 = (const char *)a1[6];
      v10 = v5;
      NSStringFromSelector(v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_215454000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ %{public}@] -> Scheduled installation of ECG app on watch", (uint8_t *)&v12, 0x16u);

    }
    v7 = *(void (**)(void))(a1[4] + 16);
  }
  v7();

}

- (HKWatchAppAvailability)ecgAppAvailability
{
  return self->_ecgAppAvailability;
}

- (void)setEcgAppAvailability:(id)a3
{
  objc_storeStrong((id *)&self->_ecgAppAvailability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecgAppAvailability, 0);
}

void __105__HRElectrocardiogramWatchAppInstallability_checkElectrocardiogramAppInstallStateWithContext_completion___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(const char **)(a1 + 72);
  v6 = a2;
  NSStringFromSelector(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a3;
  v10 = 138543874;
  v11 = v4;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = v8;
  OUTLINED_FUNCTION_1(&dword_215454000, v6, v9, "[%{public}@ %{public}@] -> Failed to check if ECG app is installed on watch with error: %{public}@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_0_0();
}

+ (void)installElectrocardiogramAppOnActiveWatch:(const char *)a3 .cold.1(uint64_t a1, void *a2, const char *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_215454000, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch due to no active device", (uint8_t *)&v7, 0x16u);

}

void __86__HRElectrocardiogramWatchAppInstallability_installElectrocardiogramAppOnActiveWatch___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(const char **)(a1 + 48);
  v6 = a2;
  NSStringFromSelector(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v5;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = a3;
  OUTLINED_FUNCTION_1(&dword_215454000, v6, v8, "[%{public}@ %{public}@] -> Failed to schedule installation of ECG app on watch with error: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_0_0();
}

@end
