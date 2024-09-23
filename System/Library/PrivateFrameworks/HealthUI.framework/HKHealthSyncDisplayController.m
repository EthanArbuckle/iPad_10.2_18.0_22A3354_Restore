@implementation HKHealthSyncDisplayController

- (HKHealthSyncDisplayController)init
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

- (HKHealthSyncDisplayController)initWithHealthStore:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  HKHealthSyncDisplayController *v11;
  HKHealthSyncDisplayController *v12;
  uint64_t v13;
  HKCloudSyncControl *cloudSyncControl;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  -[HKHealthSyncDisplayController _headerTitleForSource:](self, "_headerTitleForSource:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthSyncDisplayController _explanationTextForSource:](self, "_explanationTextForSource:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HKHealthSyncDisplayController;
  v11 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v16, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v9, v10, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_healthStore, a3);
    objc_storeStrong((id *)&v12->_source, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB63F0]), "initWithHealthStore:", v12->_healthStore);
    cloudSyncControl = v12->_cloudSyncControl;
    v12->_cloudSyncControl = (HKCloudSyncControl *)v13;

  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKHealthSyncDisplayController;
  -[OBTableWelcomeController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHealthSyncDisplayController;
  -[OBTableWelcomeController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthSyncDisplayController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[HKHealthSyncDisplayController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModalInPresentation:", 1);

  -[HKHealthSyncDisplayController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowFullWidthIcon:", 1);

  -[HKHealthSyncDisplayController _setHeaderIcon](self, "_setHeaderIcon");
  -[HKHealthSyncDisplayController _setUpFooterView](self, "_setUpFooterView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKHealthSyncDisplayController;
  -[OBBaseWelcomeController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)_setUpFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEALTHKIT_AUTHORIZATION_SYNC_ENABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v4, 0);

  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__nextButtonPressed_, 64);
  -[HKHealthSyncDisplayController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addButton:", v10);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__cancelButtonPressed_, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("HEALTHKIT_AUTHORIZATION_SYNC_DISABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v8, 0);

  -[HKHealthSyncDisplayController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v6);

}

- (id)_explanationTextForSource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HEALTHKIT_AUTHORIZATION_SYNC_DETAIL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setHeaderIcon
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
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
  void *v42;
  _QWORD v43[2];
  _QWORD v44[5];

  v44[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 5, 38.0);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("exclamationmark.icloud"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v3;
  objc_msgSend(v4, "imageByApplyingSymbolConfiguration:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v41 = (void *)v5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v5);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = v8;
  objc_msgSend(v7, "addSubview:", v8);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setContentMode:", 1);
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", 40.0);

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");

  if (v11 == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGray6Color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v12);

  -[HKHealthSyncDisplayController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customIconContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v7);

  v33 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthSyncDisplayController headerView](self, "headerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "customIconContainerView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerXAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v35;
  objc_msgSend(v7, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthSyncDisplayController headerView](self, "headerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "customIconContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v17;
  objc_msgSend(v7, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToConstant:", 80.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v19;
  objc_msgSend(v7, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v23);

  v24 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v40, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v27;
  objc_msgSend(v40, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v31);

}

- (id)_headerTitleForSource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HEALTHKIT_AUTHORIZATION_SYNC_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKClinicalAuthorizationIntroViewController _finishWithError:].cold.1(v5);
  -[HKHealthSyncDisplayController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKHealthSyncDisplayController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "promptControllerDidFinish:error:", self, v4);
  }
  else
  {
    -[HKHealthSyncDisplayController objectPickerDelegate](self, "objectPickerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didFinishWithError:", v4);
  }

}

- (void)_nextButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.Health"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, 0);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_setHasCompletedThirdPartyAuthSyncWithBooleanValue:", 1);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKHealthSyncDisplayController__nextButtonPressed___block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__HKHealthSyncDisplayController__nextButtonPressed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

- (void)_cancelButtonPressed:(id)a3
{
  void *v4;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_setHasCompletedThirdPartyAuthSyncWithBooleanValue:", 1);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HKHealthSyncDisplayController__cancelButtonPressed___block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__HKHealthSyncDisplayController__cancelButtonPressed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

- (void)_viewHealthRecordsCellTapped:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "_hk_urlForViewHealthRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:withOptions:", v3, 0);

}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  return (HKHealthPrivacyServicePromptControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKHealthPrivacyHostRemoteViewController)objectPickerDelegate
{
  return (HKHealthPrivacyHostRemoteViewController *)objc_loadWeakRetained((id *)&self->_objectPickerDelegate);
}

- (void)setObjectPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_objectPickerDelegate, a3);
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nextViewController, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (HKCloudSyncControl)cloudSyncControl
{
  return self->_cloudSyncControl;
}

- (void)setCloudSyncControl:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncControl, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_destroyWeak((id *)&self->_objectPickerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
