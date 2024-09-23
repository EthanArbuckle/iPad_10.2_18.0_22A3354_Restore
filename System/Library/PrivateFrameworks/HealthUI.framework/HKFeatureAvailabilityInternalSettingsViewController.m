@implementation HKFeatureAvailabilityInternalSettingsViewController

- (HKFeatureAvailabilityInternalSettingsViewController)initWithHealthStore:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  HKFeatureAvailabilityInternalSettingsViewController *v9;
  HKFeatureAvailabilityInternalSettingsViewController *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSUserDefaults *userDefaults;
  NPSManager *v15;
  NPSManager *syncManager;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKFeatureAvailabilityInternalSettingsViewController;
  v9 = -[HKFeatureAvailabilityInternalSettingsViewController initWithStyle:](&v18, sel_initWithStyle_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    if (objc_msgSend(v8, "showFeatureEnable"))
    {
      v11 = objc_alloc(MEMORY[0x1E0C99EA0]);
      objc_msgSend(v8, "userDefaultsDomain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "initWithSuiteName:", v12);
      userDefaults = v10->_userDefaults;
      v10->_userDefaults = (NSUserDefaults *)v13;

    }
    if (objc_msgSend(v8, "syncToWatch"))
    {
      v15 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
      syncManager = v10->_syncManager;
      v10->_syncManager = v15;

    }
  }

  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityInternalSettingsViewController;
  -[HKTableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKFeatureAvailabilityInternalSettingsViewController setTitle:](self, "setTitle:", CFSTR("Internal Settings"));
}

- (int64_t)_offsetSectionForSection:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "showFeatureEnable") ^ 1) + a3;

  return v5;
}

- (BOOL)_featureEnabled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HKFeatureAvailabilityInternalSettingsViewController userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDefaultsFeatureEnabledKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "BOOLForKey:", v5);

  return v6;
}

- (void)_enableFeature:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDefaultsDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_copyNonEmptyString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKFeatureAvailabilityInternalSettingsViewController userDefaults](self, "userDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userDefaultsFeatureEnabledKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBool:forKey:", v3, v10);

    -[HKFeatureAvailabilityInternalSettingsViewController syncManager](self, "syncManager");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userDefaultsDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99E60];
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userDefaultsFeatureEnabledKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObject:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "synchronizeUserDefaultsDomain:keys:", v12, v16);

  }
}

- (BOOL)_disabledOverriden
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HKFeatureAvailabilityInternalSettingsViewController userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDefaultsDisabledOverrideKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "BOOLForKey:", v5);

  return v6;
}

- (void)_disableOverride:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
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
  void *v18;
  id v19;

  v3 = a3;
  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userDefaultsDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_copyNonEmptyString");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userDefaultsDisabledOverrideKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_copyNonEmptyString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      return;
    -[HKFeatureAvailabilityInternalSettingsViewController userDefaults](self, "userDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userDefaultsDisabledOverrideKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBool:forKey:", v3, v13);

    -[HKFeatureAvailabilityInternalSettingsViewController syncManager](self, "syncManager");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userDefaultsDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userDefaultsDisabledOverrideKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "synchronizeUserDefaultsDomain:keys:", v14, v18);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "showFeatureEnable"))
    v4 = 4;
  else
    v4 = 3;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (unint64_t)-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", a4) < 4;
}

- (id)_buttonCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ButtonCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ButtonCell"));
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

  }
  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  _BOOL4 v11;

  v6 = a3;
  switch(-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", objc_msgSend(a4, "section")))
  {
    case 0:
      v7 = -[HKFeatureAvailabilityInternalSettingsViewController _featureEnabled](self, "_featureEnabled");
      -[HKFeatureAvailabilityInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v6);
      self = (HKFeatureAvailabilityInternalSettingsViewController *)objc_claimAutoreleasedReturnValue();
      -[HKFeatureAvailabilityInternalSettingsViewController textLabel](self, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v9 = CFSTR("Disable Feature");
      else
        v9 = CFSTR("Enable Feature");
      goto LABEL_10;
    case 1:
      -[HKFeatureAvailabilityInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v6);
      self = (HKFeatureAvailabilityInternalSettingsViewController *)objc_claimAutoreleasedReturnValue();
      -[HKFeatureAvailabilityInternalSettingsViewController textLabel](self, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
      v9 = CFSTR("Delete All Samples");
      goto LABEL_11;
    case 2:
      -[HKFeatureAvailabilityInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v6);
      self = (HKFeatureAvailabilityInternalSettingsViewController *)objc_claimAutoreleasedReturnValue();
      -[HKFeatureAvailabilityInternalSettingsViewController textLabel](self, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v10;
      v9 = CFSTR("Reset Onboarding");
      goto LABEL_11;
    case 3:
      v11 = -[HKFeatureAvailabilityInternalSettingsViewController _disabledOverriden](self, "_disabledOverriden");
      -[HKFeatureAvailabilityInternalSettingsViewController _buttonCellForTableView:](self, "_buttonCellForTableView:", v6);
      self = (HKFeatureAvailabilityInternalSettingsViewController *)objc_claimAutoreleasedReturnValue();
      -[HKFeatureAvailabilityInternalSettingsViewController textLabel](self, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v9 = CFSTR("Remove Override For Remote Disabled");
      else
        v9 = CFSTR("Override Remote Disabled");
LABEL_10:
      v10 = v8;
LABEL_11:
      objc_msgSend(v10, "setText:", v9);

      break;
    default:
      break;
  }

  return self;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;

  if (-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", a4))
  {
    return 0;
  }
  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requireReboot");

  if (!v6)
    return 0;
  -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "syncToWatch");
  v9 = CFSTR("Toggling feature status requires you to reboot your device.");
  if (v8)
    v9 = CFSTR("Toggling feature status requires you to reboot your iPhone and Apple Watch.");
  v10 = v9;

  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  int64_t v5;

  v5 = -[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", objc_msgSend(a4, "section", a3));
  if ((unint64_t)(v5 - 2) < 2 || v5 == 0)
    return 1;
  if (v5 == 1)
    return !-[HKFeatureAvailabilityInternalSettingsViewController isDeletingSamples](self, "isDeletingSamples");
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];

  v6 = a4;
  if ((objc_msgSend(a3, "isEditing") & 1) == 0)
  {
    switch(-[HKFeatureAvailabilityInternalSettingsViewController _offsetSectionForSection:](self, "_offsetSectionForSection:", objc_msgSend(v6, "section")))
    {
      case 0:
        -[HKFeatureAvailabilityInternalSettingsViewController _enableFeature:](self, "_enableFeature:", -[HKFeatureAvailabilityInternalSettingsViewController _featureEnabled](self, "_featureEnabled") ^ 1);
        -[HKFeatureAvailabilityInternalSettingsViewController tableView](self, "tableView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reloadSections:withRowAnimation:", v8, 0);

        -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v9, "requireReboot");

        if ((_DWORD)v8)
        {
          -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "syncToWatch");
          v12 = CFSTR("You need to reboot your device in order for this change to take effect.");
          if (v11)
            v12 = CFSTR("You need to reboot your iPhone and Apple Watch in order for this change to take effect.");
          v13 = v12;

          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Reboot Required"), v13, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)MEMORY[0x1E0DC3448];
          v16 = CFSTR("Ok");
          v17 = 0;
          v18 = 0;
          goto LABEL_11;
        }
        break;
      case 1:
        -[HKFeatureAvailabilityInternalSettingsViewController tableView](self, "tableView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v6, 1);

        if (!-[HKFeatureAvailabilityInternalSettingsViewController isDeletingSamples](self, "isDeletingSamples"))
        {
          -[HKFeatureAvailabilityInternalSettingsViewController setDeletingSamples:](self, "setDeletingSamples:", 1);
          objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Delete All Samples"), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = MEMORY[0x1E0C809B0];
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
          v33[3] = &unk_1E9C40288;
          v33[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Delete All"), 2, v33);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addAction:", v29);

          v15 = (void *)MEMORY[0x1E0DC3448];
          v32[0] = v28;
          v32[1] = 3221225472;
          v32[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
          v32[3] = &unk_1E9C40288;
          v32[4] = self;
          v16 = CFSTR("Cancel");
          v18 = v32;
          v17 = 1;
LABEL_11:
          objc_msgSend(v15, "actionWithTitle:style:handler:", v16, v17, v18);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addAction:", v30);

          -[HKFeatureAvailabilityInternalSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
          goto LABEL_12;
        }
        break;
      case 2:
        -[HKFeatureAvailabilityInternalSettingsViewController tableView](self, "tableView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);

        v20 = (void *)MEMORY[0x1E0DC3450];
        -[HKFeatureAvailabilityInternalSettingsViewController configuration](self, "configuration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "featureIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "alertControllerWithTitle:message:preferredStyle:", v22, CFSTR("Reset onboarding state?"), 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, &__block_literal_global_23);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_7;
        v31[3] = &unk_1E9C40288;
        v31[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Reset"), 2, v31);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addAction:", v24);
        objc_msgSend(v14, "addAction:", v23);
        -[HKFeatureAvailabilityInternalSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

LABEL_12:
        break;
      case 3:
        -[HKFeatureAvailabilityInternalSettingsViewController _disableOverride:](self, "_disableOverride:", -[HKFeatureAvailabilityInternalSettingsViewController _disabledOverriden](self, "_disabledOverriden") ^ 1);
        -[HKFeatureAvailabilityInternalSettingsViewController tableView](self, "tableView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v6, "section"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "reloadSections:withRowAnimation:", v26, 0);

        break;
      default:
        break;
    }
  }

}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "samplesTypesToDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "deleteAllSamplesWithTypes:sourceBundleIdentifier:options:completion:", v4, 0, 2, v5);

}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeletingSamples:", 0);
}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeletingSamples:", 0);
}

void __89__HKFeatureAvailabilityInternalSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_7(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0CB6708]);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "initWithFeatureIdentifier:healthStore:", v4, v5);

  objc_msgSend(v6, "resetOnboardingWithCompletion:", &__block_literal_global_280);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKFeatureAvailabilityInternalSettingsConfiguration)configuration
{
  return self->_configuration;
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (BOOL)isDeletingSamples
{
  return self->_deletingSamples;
}

- (void)setDeletingSamples:(BOOL)a3
{
  self->_deletingSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
