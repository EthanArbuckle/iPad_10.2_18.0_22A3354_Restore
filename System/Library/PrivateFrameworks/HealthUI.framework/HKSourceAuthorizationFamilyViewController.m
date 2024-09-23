@implementation HKSourceAuthorizationFamilyViewController

- (HKSourceAuthorizationFamilyViewController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKSourceAuthorizationFamilyViewController)initWithStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (HKSourceAuthorizationFamilyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HKSourceAuthorizationFamilyViewController)initWithHealthStore:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  HKSourceAuthorizationFamilyViewController *v9;
  HKSourceAuthorizationFamilyViewController *v10;
  uint64_t v11;
  HKSource *source;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKSourceAuthorizationFamilyViewController;
  v9 = -[HKTableViewController initWithUsingInsetStyling:](&v16, sel_initWithUsingInsetStyling_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v11 = objc_msgSend(v8, "copy");
    source = v10->_source;
    v10->_source = (HKSource *)v11;

    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSourceAuthorizationFamilyViewController navigationItem](v10, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v13);

  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKSourceAuthorizationFamilyViewController;
  -[HKSourceAuthorizationFamilyViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HKSourceAuthorizationFamilyViewController _reloadAuthorizationSettings](self, "_reloadAuthorizationSettings");
}

- (void)_reloadAuthorizationSettings
{
  void *v3;
  void *v4;
  id v5;

  -[HKSourceAuthorizationFamilyViewController clinicalAuthorizationController](self, "clinicalAuthorizationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reload");

  -[HKSourceAuthorizationFamilyViewController healthDataAuthorizationController](self, "healthDataAuthorizationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reload");

  -[HKSourceAuthorizationFamilyViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (id)_createFamilyCell
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("_FamilyCellReuseIdentifier"));
  objc_msgSend(v2, "setAccessoryType:", 1);
  return v2;
}

- (id)_valueStringForAnyCategoryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("AUTHORIZATION_ANY_CATEGORY_ON");
  else
    v6 = CFSTR("AUTHORIZATION_ALL_CATEGORIES_OFF");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("_FamilyCellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[HKSourceAuthorizationFamilyViewController _createFamilyCell](self, "_createFamilyCell");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v6, "row");
  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_NON_CLINICAL_HEALTH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    v22 = (void *)MEMORY[0x1E0DC3870];
    v23 = *MEMORY[0x1E0CB7630];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scale");
    objc_msgSend(v22, "_applicationIconImageForBundleIdentifier:format:scale:", v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setImage:", v25);

    -[HKSourceAuthorizationFamilyViewController healthDataAuthorizationController](self, "healthDataAuthorizationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSourceAuthorizationFamilyViewController _valueStringForAnyCategoryEnabled:](self, "_valueStringForAnyCategoryEnabled:", objc_msgSend(v16, "anyTypeEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);
    goto LABEL_7;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_CLINICAL_HEALTH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v10);

    -[HKSourceAuthorizationFamilyViewController clinicalAuthorizationController](self, "clinicalAuthorizationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSourceAuthorizationFamilyViewController _valueStringForAnyCategoryEnabled:](self, "_valueStringForAnyCategoryEnabled:", objc_msgSend(v12, "anyTypeEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:inBundle:", CFSTR("health_records_category"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setImage:", v17);
LABEL_7:

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  if (v7 == 1)
  {
    -[HKSourceAuthorizationFamilyViewController healthDataAuthorizationSettingsViewController](self, "healthDataAuthorizationSettingsViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[HKSourceAuthorizationFamilyViewController clinicalAuthorizationSettingsViewController](self, "clinicalAuthorizationSettingsViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_7:
  objc_msgSend(v15, "cellForRowAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v12);

  -[HKSourceAuthorizationFamilyViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v9, 1);

}

- (HKSource)source
{
  return self->_source;
}

- (HKClinicalSourceAuthorizationController)clinicalAuthorizationController
{
  return self->_clinicalAuthorizationController;
}

- (void)setClinicalAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalAuthorizationController, a3);
}

- (HKSourceAuthorizationController)healthDataAuthorizationController
{
  return self->_healthDataAuthorizationController;
}

- (void)setHealthDataAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_healthDataAuthorizationController, a3);
}

- (UIViewController)clinicalAuthorizationSettingsViewController
{
  return self->_clinicalAuthorizationSettingsViewController;
}

- (void)setClinicalAuthorizationSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_clinicalAuthorizationSettingsViewController, a3);
}

- (UIViewController)healthDataAuthorizationSettingsViewController
{
  return self->_healthDataAuthorizationSettingsViewController;
}

- (void)setHealthDataAuthorizationSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_healthDataAuthorizationSettingsViewController, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_healthDataAuthorizationSettingsViewController, 0);
  objc_storeStrong((id *)&self->_clinicalAuthorizationSettingsViewController, 0);
  objc_storeStrong((id *)&self->_healthDataAuthorizationController, 0);
  objc_storeStrong((id *)&self->_clinicalAuthorizationController, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
