@implementation WDClinicalSettingsOptInSection

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDClinicalSettingsOptInSection;
  -[HRWDTableViewSection viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDClinicalSettingsOptInSection _fetchOptInStatus](self, "_fetchOptInStatus");
}

- (void)applicationWillEnterForeground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDClinicalSettingsOptInSection;
  -[HRWDTableViewSection applicationWillEnterForeground](&v3, sel_applicationWillEnterForeground);
  -[WDClinicalSettingsOptInSection _fetchOptInStatus](self, "_fetchOptInStatus");
}

- (unint64_t)numberOfRows
{
  return 2;
}

- (id)titleForHeader
{
  return (id)HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_HEADER"));
}

- (id)cellForRow:(unint64_t)a3 table:(id)a4
{
  if (a3 == 1)
    -[WDClinicalSettingsOptInSection _viewDataCellForTableView:](self, "_viewDataCellForTableView:", a4);
  else
    -[WDClinicalSettingsOptInSection _optInCellForTableView:](self, "_optInCellForTableView:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_viewDataCellForTableView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[WDClinicalSettingsViewAnalyticsDataCell defaultReuseIdentifier](WDClinicalSettingsViewAnalyticsDataCell, "defaultReuseIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setViewControllerClass:", objc_opt_class());
  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_VIEW_ANALYTICS_DATA"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v8);

  objc_msgSend(v5, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextAlignment:", 4);

  objc_msgSend(v5, "setAccessoryType:", 1);
  return v5;
}

- (id)_optInCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("_OptInCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_SWITCH_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v4, "setSelectionStyle:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
  objc_msgSend(v7, "setOn:animated:", -[WDClinicalSettingsOptInSection optIn](self, "optIn"), 0);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__handleOptInSwitchChanged_, 4096);
  objc_msgSend(v4, "setAccessoryView:", v7);

  return v4;
}

- (void)didSelectRow:(unint64_t)a3 representedByCell:(id)a4 withCompletion:(id)a5
{
  void (**v7)(id, uint64_t, _QWORD);
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (objc_class *)objc_msgSend(v15, "viewControllerClass");
    if (v8)
    {
      v9 = objc_alloc_init(v8);
      if (v9)
      {
        v10 = v9;
        -[HRWDTableViewSection delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "profile");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "healthRecordsStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setHealthRecordsStore:", v13);

        -[HRWDTableViewSection delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "pushViewController:", v10);

      }
    }
  }
  v7[2](v7, 1, 0);

}

- (void)_handleOptInSwitchChanged:(id)a3
{
  -[WDClinicalSettingsOptInSection _setOptInStatus:](self, "_setOptInStatus:", objc_msgSend(a3, "isOn"));
}

- (void)_fetchOptInStatus
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[HRWDTableViewSection delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "healthRecordsStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke;
  v6[3] = &unk_1E74D1CC8;
  v6[4] = self;
  objc_msgSend(v5, "fetchIsImproveHealthRecordsDataSubmissionAllowedWithCompletion:", v6);

}

void __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_230;
  v10[3] = &unk_1E74D1A90;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "addOperationWithBlock:", v10);

}

void __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_230(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadTable");

}

- (void)_setOptInStatus:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];
  BOOL v5;

  v3 = *MEMORY[0x1E0D28E40];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke;
  v4[3] = &unk_1E74D1CF0;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", a3, v3, v4);
}

void __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5378];
  v7 = *MEMORY[0x1E0CB5378];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v6;
      HKStringFromBool();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1BC30A000, v9, OS_LOG_TYPE_INFO, "%{public}@: Successfully saved opt-in status %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke_cold_1(a1, v6, (uint64_t)v5);
  }

}

- (BOOL)optIn
{
  return self->_optIn;
}

void __51__WDClinicalSettingsOptInSection__fetchOptInStatus__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1BC30A000, log, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching opt in status: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __50__WDClinicalSettingsOptInSection__setOptInStatus___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  HKStringFromBool();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v4;
  v10 = 2112;
  v11 = v7;
  v12 = 2114;
  v13 = a3;
  _os_log_error_impl(&dword_1BC30A000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error saving opt-in status %@: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
