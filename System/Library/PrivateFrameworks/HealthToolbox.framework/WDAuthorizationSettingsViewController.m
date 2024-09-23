@implementation WDAuthorizationSettingsViewController

- (WDAuthorizationSettingsViewController)initWithProfile:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  WDAuthorizationSettingsViewController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)WDAuthorizationSettingsViewController;
  v8 = -[HKAuthorizationSettingsViewController initWithHealthStore:style:](&v11, sel_initWithHealthStore_style_, v7, a4);

  if (v8)
  {
    -[WDAuthorizationSettingsViewController setProfile:](v8, "setProfile:", v6);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__applicationWillEnterForeground, *MEMORY[0x24BDF75D0], 0);

  }
  return v8;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WDAuthorizationSettingsViewController;
  -[HKAuthorizationSettingsViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAuthorizationSettingsViewController;
  -[HKAuthorizationSettingsViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (id)sectionsForAuthController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WDAuthorizationSettingsViewController;
  -[HKAuthorizationSettingsViewController sectionsForAuthController:](&v10, sel_sectionsForAuthController_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[WDAuthorizationSettingsViewController profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationContext");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7 != CFSTR("SettingsPrivacy"))
    objc_msgSend(v5, "addObject:", &unk_24D3A5ED0);
  if (-[WDAuthorizationSettingsViewController _isSiriAndDeviceCapable](self, "_isSiriAndDeviceCapable"))
    objc_msgSend(v5, "addObject:", &unk_24D3A5EE8);
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v7 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4);
  v8 = 0;
  if (v7 && v7 != 5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WDAuthorizationSettingsViewController;
    -[HKAuthorizationSettingsViewController tableView:titleForHeaderInSection:](&v10, sel_tableView_titleForHeaderInSection_, v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  objc_super v10;

  v6 = a3;
  v7 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4);
  v8 = v7;
  if (v7)
  {
    if (v7 == 5)
    {
      v8 = 1;
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)WDAuthorizationSettingsViewController;
      v8 = -[HKAuthorizationSettingsViewController tableView:numberOfRowsInSection:](&v10, sel_tableView_numberOfRowsInSection_, v6, a4);
    }
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  _BOOL4 v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v8 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", objc_msgSend(v7, "section"));
  if (v8 == 5)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VIEW_ALL_DATA_FROM_%@"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationSettingsViewController source](self, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDAuthorizationSettingsViewController specialCellWithIdentifier:textLabelText:](self, "specialCellWithIdentifier:textLabelText:", CFSTR("WDAuthorizationSettingsViewAllData"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessoryType:", 1);

  }
  else
  {
    v16 = v8;
    v17 = -[WDAuthorizationSettingsViewController _isSiriAndDeviceCapable](self, "_isSiriAndDeviceCapable");
    if (v16 == 2 && v17)
    {
      v18 = -[WDAuthorizationSettingsViewController _isTypeEnabledAtIndexPath](self, "_isTypeEnabledAtIndexPath");
      -[WDAuthorizationSettingsViewController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dequeueReusableCellWithIdentifier:", CFSTR("ToggleAllCell"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A8A8]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ToggleAllCell"));
        objc_msgSend(v15, "setDelegate:", self);
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SIRI_ACCESS_DATA_BUTTON"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Scribe"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

      objc_msgSend(v15, "setOn:", v18);
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)WDAuthorizationSettingsViewController;
      -[HKAuthorizationSettingsViewController tableView:cellForRowAtIndexPath:](&v24, sel_tableView_cellForRowAtIndexPath_, v6, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v15;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[WDAuthorizationSettingsViewController _isSiriAndDeviceCapable](self, "_isSiriAndDeviceCapable", a3)
    && -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4) == 2)
  {
    objc_msgSend(MEMORY[0x24BE4A638], "defaultReuseIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIRI_PRIVACY_DISCLOSURE_TEXT"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Scribe"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIRI_PRIVACY_LEARN_MORE_TEXT"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable-Scribe"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("https://support.apple.com/kb/HT213967"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4A638]), "initWithReuseIdentifier:bodyText:linkText:link:", v6, v8, v10, v11);
    objc_msgSend(v12, "setTextViewDelegate:", self);

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)_isSiriAndDeviceCapable
{
  void *v2;
  char v3;

  -[HKAuthorizationSettingsViewController source](self, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_isSiri"))
    v3 = AFDeviceSupportsSiriUOD();
  else
    v3 = 0;

  return v3;
}

- (BOOL)_isTypeEnabledAtIndexPath
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v7[5];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = dispatch_group_create();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 3;
  dispatch_group_enter(v3);
  -[WDProfile healthStore](self->_profile, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke;
  v7[3] = &unk_24D38E3F0;
  v7[4] = self;
  v9 = &v10;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "getAllHealthDataAccessForSiriWithCompletion:", v7);

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v3) = (unint64_t)(v11[3] - 4) < 0xFFFFFFFFFFFFFFFELL;

  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

void __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC0], OS_LOG_TYPE_ERROR))
      __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  double v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4);
  if (-[WDAuthorizationSettingsViewController _isSiriAndDeviceCapable](self, "_isSiriAndDeviceCapable") && v7 == 2)
  {
    v8 = *MEMORY[0x24BDF7DE0];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WDAuthorizationSettingsViewController;
    -[HKAuthorizationSettingsViewController tableView:heightForFooterInSection:](&v11, sel_tableView_heightForFooterInSection_, v6, a4);
    v8 = v9;
  }

  return v8;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  _QWORD v12[5];

  v4 = a4;
  v6 = a3;
  if (-[WDAuthorizationSettingsViewController _isSiriAndDeviceCapable](self, "_isSiriAndDeviceCapable")
    && (objc_msgSend(v6, "reuseIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ToggleAllCell")),
        v7,
        v8))
  {
    if (v4)
      v9 = 1;
    else
      v9 = 2;
    -[WDProfile healthStore](self->_profile, "healthStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke;
    v12[3] = &unk_24D38CFB0;
    v12[4] = self;
    objc_msgSend(v10, "setAllHealthDataAccessForSiri:completion:", v9, v12);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WDAuthorizationSettingsViewController;
    -[HKAuthorizationSettingsViewController switchCellValueChanged:value:](&v11, sel_switchCellValueChanged_value_, v6, v4);
  }

}

void __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FC0], OS_LOG_TYPE_ERROR))
      __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (id)specialCellWithIdentifier:(id)a3 textLabelText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[WDAuthorizationSettingsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, v6);
  objc_msgSend(v9, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v7);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  WDSourceStoredDataViewController *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (-[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", objc_msgSend(v7, "section")) == 5)
  {
    v8 = objc_alloc_init(WDSourceStoredDataViewController);
    -[HKAuthorizationSettingsViewController source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDSourceStoredDataViewController setSource:](v8, "setSource:", v9);

    -[WDAuthorizationSettingsViewController profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDStoredDataByCategoryViewController setProfile:](v8, "setProfile:", v10);

    v11 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BACK_TO_SOURCE_PERMISSIONS"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, 0, 0);
    -[WDAuthorizationSettingsViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackBarButtonItem:", v14);

    -[WDAuthorizationSettingsViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pushViewController:animated:", v8, 1);

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WDAuthorizationSettingsViewController;
    -[HKAuthorizationSettingsViewController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

- (WDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

void __66__WDAuthorizationSettingsViewController__isTypeEnabledAtIndexPath__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_215814000, a2, a3, "%{public}@: Unable to get the authorization status for Siri %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

void __70__WDAuthorizationSettingsViewController_switchCellValueChanged_value___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_215814000, a2, a3, "Failed to update authorization status for Siri: %@ with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
