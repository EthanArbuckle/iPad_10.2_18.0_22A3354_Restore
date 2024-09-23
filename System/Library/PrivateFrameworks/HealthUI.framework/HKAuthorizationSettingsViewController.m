@implementation HKAuthorizationSettingsViewController

- (HKAuthorizationSettingsViewController)init
{
  return -[HKAuthorizationSettingsViewController initWithHealthStore:style:](self, "initWithHealthStore:style:", 0, 0);
}

- (HKAuthorizationSettingsViewController)initWithHealthStore:(id)a3 style:(int64_t)a4
{
  id v8;
  HKAuthorizationSettingsViewController *v9;
  HKAuthorizationSettingsViewController *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationSettingsViewController.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("healthStore != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HKAuthorizationSettingsViewController;
  v9 = -[HKTableViewController initWithUsingInsetStyling:](&v13, sel_initWithUsingInsetStyling_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v10->_style = a4;
  }

  return v10;
}

- (void)setSource:(id)a3
{
  id v5;
  HKSource **p_source;
  HKSourceAuthorizationController *v7;
  HKSourceAuthorizationController *sourceAuthorizationController;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  v5 = a3;
  p_source = &self->_source;
  objc_storeStrong((id *)&self->_source, a3);
  v7 = -[HKSourceAuthorizationController initWithHealthStore:source:typesForSharing:typesForReading:]([HKSourceAuthorizationController alloc], "initWithHealthStore:source:typesForSharing:typesForReading:", self->_healthStore, v5, self->_typesToShare, self->_typesToRead);
  sourceAuthorizationController = self->_sourceAuthorizationController;
  self->_sourceAuthorizationController = v7;

  -[HKSourceAuthorizationController setDelegate:](self->_sourceAuthorizationController, "setDelegate:", self);
  -[HKSourceAuthorizationController typesInSection:](self->_sourceAuthorizationController, "typesInSection:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v11);

  }
  objc_storeStrong((id *)&self->_readingTypeOrdering, v10);
  if (!-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    objc_msgSend(v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationSettingsViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

  }
  -[HKAuthorizationSettingsViewController sourceAuthorizationController](self, "sourceAuthorizationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAuthorizationSettingsViewController sectionsForAuthController:](self, "sectionsForAuthController:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAuthorizationSettingsViewController setActualSections:](self, "setActualSections:", v15);

  if (!-[HKSource _isAllowedBackgroundDelivery](*p_source, "_isAllowedBackgroundDelivery"))
  {
    self->_requiresBackgroundAppRefreshDisclosure = 0;
    goto LABEL_9;
  }
  v16 = -[HKSource _isResearchStudy](*p_source, "_isResearchStudy");
  self->_requiresBackgroundAppRefreshDisclosure = v16 ^ 1;
  if ((v16 & 1) != 0)
  {
LABEL_9:
    -[HKAuthorizationSettingsViewController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadData");

    goto LABEL_10;
  }
  self->_hasFetchedBackgroundAppRefreshStatus = 0;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__HKAuthorizationSettingsViewController_setSource___block_invoke;
  v18[3] = &unk_1E9C40628;
  objc_copyWeak(&v19, &location);
  -[HKAuthorizationSettingsViewController _fetchBackgroundAppRefreshStatusWithHandler:](self, "_fetchBackgroundAppRefreshStatusWithHandler:", v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_10:

}

void __51__HKAuthorizationSettingsViewController_setSource___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_didFetchBackgroundAppRefreshStatus:", a2);
    WeakRetained = v4;
  }

}

- (void)_didFetchBackgroundAppRefreshStatus:(BOOL)a3
{
  id v3;

  self->_isBackgroundAppRefreshEnabled = a3;
  self->_hasFetchedBackgroundAppRefreshStatus = 1;
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)reloadAuthorizationSettings
{
  id v3;

  -[HKSourceAuthorizationController reload](self->_sourceAuthorizationController, "reload");
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HKAuthorizationSettingsViewController;
  -[HKTableViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setSectionCornerRadius:", 10.0);

  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedRowHeight:", 44.0);

  if (-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    -[HKAuthorizationSettingsViewController _addCancelAndDoneButtons](self, "_addCancelAndDoneButtons");
    -[HKAuthorizationSettingsViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationSettingsViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAuthorizationSettingsViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)-[HKAuthorizationSettingsViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v10, &__block_literal_global_44);

  }
}

uint64_t __52__HKAuthorizationSettingsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateHeaderView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKAuthorizationSettingsViewController;
  -[HKAuthorizationSettingsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
    -[HKAuthorizationSettingsViewController _updateHeaderView](self, "_updateHeaderView");
  -[HKAuthorizationSettingsViewController reloadAuthorizationSettings](self, "reloadAuthorizationSettings");
}

- (void)_addCancelAndDoneButtons
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *cancelButtonItem;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *doneButtonItem;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = -[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting");
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v5 = v4;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_PROMPT_DONT_ALLOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, self, sel__done_);
    cancelButtonItem = self->_cancelButtonItem;
    self->_cancelButtonItem = v8;

    objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingString:", CFSTR(".AuthSheet.CancelButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelButtonItem, "setAccessibilityIdentifier:", v10);

    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_PROMPT_ALLOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (UIBarButtonItem *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 2, self, sel__done_);
    doneButtonItem = self->_doneButtonItem;
    self->_doneButtonItem = v14;

    objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingString:", CFSTR(".AuthSheet.DoneButton"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setAccessibilityIdentifier:](self->_doneButtonItem, "setAccessibilityIdentifier:", v16);

    -[UIBarButtonItem setEnabled:](self->_doneButtonItem, "setEnabled:", 0);
  }
  else
  {
    v17 = (UIBarButtonItem *)objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 1, self, sel__done_);
    v18 = self->_cancelButtonItem;
    self->_cancelButtonItem = v17;

    v19 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
    v20 = self->_doneButtonItem;
    self->_doneButtonItem = v19;

  }
  -[HKAuthorizationSettingsViewController navigationItem](self, "navigationItem");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLeftBarButtonItem:", self->_cancelButtonItem);
  objc_msgSend(v23, "setRightBarButtonItem:", self->_doneButtonItem);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("HEALTH_ACCESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:", v22);

}

- (void)_done:(id)a3
{
  UIBarButtonItem *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (UIBarButtonItem *)a3;
  if (self->_doneButtonItem == v4)
  {
    -[HKSourceAuthorizationController commitAuthorizationStatuses](self->_sourceAuthorizationController, "commitAuthorizationStatuses");
    -[HKAuthorizationSettingsViewController _finishWithError:](self, "_finishWithError:", 0);
  }
  else
  {
    if (-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[HKSourceAuthorizationController typesInSection:](self->_sourceAuthorizationController, "typesInSection:", 6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v31;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v31 != v8)
              objc_enumerationMutation(v5);
            -[HKSourceAuthorizationController setEnabled:forType:inSection:commit:](self->_sourceAuthorizationController, "setEnabled:forType:inSection:commit:", 0, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9++), 6, 0);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v7);
      }

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      -[HKSourceAuthorizationController typesInSection:](self->_sourceAuthorizationController, "typesInSection:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v27;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v10);
            -[HKSourceAuthorizationController setEnabled:forType:inSection:commit:](self->_sourceAuthorizationController, "setEnabled:forType:inSection:commit:", 0, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14++), 4, 0);
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v12);
      }

      -[HKSourceAuthorizationController commitAuthorizationStatuses](self->_sourceAuthorizationController, "commitAuthorizationStatuses");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_DONT_ALLOW_ALERT_MESSAGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_DONT_ALLOW_ALERT_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v19, v16, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_DONT_ALLOW_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __47__HKAuthorizationSettingsViewController__done___block_invoke;
      v25[3] = &unk_1E9C40288;
      v25[4] = self;
      objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "addAction:", v24);
      -[HKAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("The user canceled authorization."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAuthorizationSettingsViewController _finishWithError:](self, "_finishWithError:", v16);
    }

  }
}

uint64_t __47__HKAuthorizationSettingsViewController__done___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);
}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  HKHealthSyncDisplayController *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isiPad"))
  {
    v6 = +[HKiPadHealthSyncEnablement isSyncPromptedForHealthKit:](HKiPadHealthSyncEnablement, "isSyncPromptedForHealthKit:", self->_healthStore);

    if (!v6)
    {
      v7 = -[HKHealthSyncDisplayController initWithHealthStore:source:]([HKHealthSyncDisplayController alloc], "initWithHealthStore:source:", self->_healthStore, self->_source);
      -[HKAuthorizationSettingsViewController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthSyncDisplayController setDelegate:](v7, "setDelegate:", v8);

      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        *(_DWORD *)v13 = 138412290;
        *(_QWORD *)&v13[4] = objc_opt_class();
        v11 = *(id *)&v13[4];
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_DEFAULT, "%@: Prompting health sync view controller", v13, 0xCu);

      }
      -[HKAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, *(_OWORD *)v13);
      goto LABEL_10;
    }
  }
  else
  {

  }
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKAuthorizationSettingsViewController _finishWithError:].cold.1(v12);
  -[HKAuthorizationSettingsViewController delegate](self, "delegate");
  v7 = (HKHealthSyncDisplayController *)objc_claimAutoreleasedReturnValue();
  -[HKHealthSyncDisplayController promptControllerDidFinish:error:](v7, "promptControllerDidFinish:error:", self, v4);
LABEL_10:

}

- (BOOL)isPrompting
{
  return self->_style == 1;
}

- (void)updateAllowButtonEnabledState
{
  if (-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
    -[UIBarButtonItem setEnabled:](self->_doneButtonItem, "setEnabled:", -[HKSourceAuthorizationController anyTypeEnabled](self->_sourceAuthorizationController, "anyTypeEnabled"));
}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__HKAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_1E9C42860;
  v17 = v3;
  v13 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v14);
  -[HKAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __78__HKAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_requiresBackgroundAppRefreshDisclosure && !self->_hasFetchedBackgroundAppRefreshStatus)
    return 0;
  else
    return -[NSArray count](self->_actualSections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  _BOOL4 v9;

  v5 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4);
  v6 = v5 - 1;
  if ((unint64_t)(v5 - 1) < 8 && ((0xC7u >> v6) & 1) != 0)
    return qword_1D7B81BE8[v6];
  -[HKSourceAuthorizationController typesInSection:](self->_sourceAuthorizationController, "typesInSection:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = -[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting");
  if (v5 == 6 && v9)
    v8 -= -[HKSourceAuthorizationController isRequestingDocumentAuthorization](self->_sourceAuthorizationController, "isRequestingDocumentAuthorization");
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  int64_t v4;

  v4 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4);
  if (v4 == 5 || v4 == 2)
    return HKUIOnePixel();
  else
    return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4);
  if (v5 == 6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v10 = CFSTR("SHARE_DATA_WITH_%@");
LABEL_7:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSource name](self->_source, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v11, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (v5 == 4)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    v10 = CFSTR("ALLOW_%@_TO_UPDATE");
    goto LABEL_7;
  }
  if (v5 != 1)
  {
    v7 = 0;
    return v7;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("STUDY_EXPLANATION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *updateDescription;
  HKAuthorizationSettingsViewController *v11;
  uint64_t v12;
  NSString *v13;

  v5 = 0;
  switch(-[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a4))
  {
    case 3:
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENTS_REQUEST_AUTH_DESCRIPTION %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSource name](self->_source, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    case 4:
      updateDescription = self->_updateDescription;
      v11 = self;
      v12 = 0;
      goto LABEL_5;
    case 6:
      updateDescription = self->_shareDescription;
      v11 = self;
      v12 = 1;
LABEL_5:
      -[HKAuthorizationSettingsViewController _localizedSourceExplanationWithDescription:forReadingSection:](v11, "_localizedSourceExplanationWithDescription:forReadingSection:", updateDescription, v12);
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 7:
      v13 = self->_researchStudyUsageDescription;
LABEL_7:
      v5 = v13;
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)_localizedSourceExplanationWithDescription:(id)a3 forReadingSection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL4 isBackgroundAppRefreshEnabled;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v6 = a3;
  v7 = -[HKSource _isResearchStudy](self->_source, "_isResearchStudy");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v10 = CFSTR("STUDY_EXPLANATION_%@");
  else
    v10 = CFSTR("APP_EXPLANATION_%@");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = !v4;
    else
      v13 = 1;
    if (!v13 && self->_requiresBackgroundAppRefreshDisclosure)
    {
      if (self->_hasFetchedBackgroundAppRefreshStatus)
      {
        isBackgroundAppRefreshEnabled = self->_isBackgroundAppRefreshEnabled;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (isBackgroundAppRefreshEnabled)
          v17 = CFSTR("BACKGROUND_DELIVERY_BAR_ON");
        else
          v17 = CFSTR("BACKGROUND_DELIVERY_BAR_OFF");
        objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "stringByAppendingString:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v19;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
          -[HKAuthorizationSettingsViewController _localizedSourceExplanationWithDescription:forReadingSection:].cold.1();
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_fetchBackgroundAppRefreshStatusWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  HKSource *source;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  HKSource *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
  {
    source = self->_source;
    *(_DWORD *)buf = 138543362;
    v15 = source;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_INFO, "Fetching BAR eligiblity for %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0D1D928], "sharedScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSource bundleIdentifier](self->_source, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke;
  v11[3] = &unk_1E9C42ED8;
  v12 = v8;
  v13 = v4;
  v9 = v4;
  v10 = v8;
  objc_msgSend(v7, "backgroundAppRefreshEnabledForApp:withHandler:", v10, v11);

}

void __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke(uint64_t a1, char a2, char a3)
{
  _QWORD block[4];
  id v7;
  id v8;
  char v9;
  char v10;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke_2;
  block[3] = &unk_1E9C42EB0;
  v7 = *(id *)(a1 + 32);
  v9 = a2;
  v10 = a3;
  v8 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__HKAuthorizationSettingsViewController__fetchBackgroundAppRefreshStatusWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v2;
    HKStringFromBool();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKStringFromBool();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v3;
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_INFO, "Duet BAR eligiblity for '%{public}@': global=%{public}@, app=%{public}@", (uint8_t *)&v9, 0x20u);

  }
  if (*(_BYTE *)(a1 + 48))
    v7 = *(_BYTE *)(a1 + 49) != 0;
  else
    v7 = 0;
  return (*(uint64_t (**)(_QWORD, _BOOL8))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  v6 = 0;
  switch(-[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", objc_msgSend(v5, "section")))
  {
    case 1:
      -[HKAuthorizationSettingsViewController _researchStudyExplanationCell](self, "_researchStudyExplanationCell");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      -[HKAuthorizationSettingsViewController _toggleAllCell](self, "_toggleAllCell");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
    case 4:
    case 6:
      -[HKAuthorizationSettingsViewController _authorizationSettingCellForRowAtIndexPath:](self, "_authorizationSettingCellForRowAtIndexPath:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
      -[HKAuthorizationSettingsViewController _openAppCell](self, "_openAppCell");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (void *)v7;
      break;
    default:
      break;
  }
  if (-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v8);

  }
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    HKErrorTableViewCell(CFSTR("HKAuthorizationSettingsViewController"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)_researchStudyExplanationCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("ResearchStudyExplanation"));
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 0);

  -[HKAuthorizationSettingsViewController researchStudyUsageDescription](self, "researchStudyUsageDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  return v3;
}

- (id)_toggleAllCell
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HKAuthorizationSettingsViewController _specialCellWithIdentifier:](self, "_specialCellWithIdentifier:", CFSTR("ToggleAllCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKSourceAuthorizationController allTypesEnabled](self->_sourceAuthorizationController, "allTypesEnabled");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("DISABLE_ALL_CATEGORIES");
  else
    v7 = CFSTR("ENABLE_ALL_CATEGORIES");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(CFSTR("UIA.Health"), "stringByAppendingString:", CFSTR(".AuthSheet.AllCategoryButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v10);

  return v3;
}

- (id)_openAppCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HKAuthorizationSettingsViewController _specialCellWithIdentifier:](self, "_specialCellWithIdentifier:", CFSTR("OpenAppCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  HKHealthKitFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OPEN_%@"), &stru_1E9C4C428, *MEMORY[0x1E0CB5158]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAuthorizationSettingsViewController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  return v3;
}

- (id)_specialCellWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v4);
  HKHealthKeyColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  return v6;
}

- (id)_localizedNameForSection:(int64_t)a3 type:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (-[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", a3) == 3&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CLINICAL_DOCUMENT_REQUESTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isClinicalType"))
    {
      objc_msgSend(v6, "hk_localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", self->_healthStore);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v8;
}

- (id)_authorizationSettingCellForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  HKSwitchTableViewCell *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;

  v4 = a3;
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("AuthorizationSettingsCell"));
  v6 = (HKSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = -[HKSwitchTableViewCell initWithStyle:reuseIdentifier:]([HKSwitchTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AuthorizationSettingsCell"));
    -[HKSwitchTableViewCell setDelegate:](v6, "setDelegate:", self);
    -[HKSwitchTableViewCell setCentersIcon:](v6, "setCentersIcon:", 1);
  }
  -[HKAuthorizationSettingsViewController _typeForIndexPath:section:](self, "_typeForIndexPath:section:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", self->_healthStore);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", objc_msgSend(v4, "section"));
  v32 = v9;
  if (v10 == 6)
    v11 = objc_msgSend(v9, "isDocument");
  else
    v11 = 0;
  -[HKSwitchTableViewCell setShouldHideSwitch:](v6, "setShouldHideSwitch:", v11);
  -[HKSourceAuthorizationController objectAuthorizationStatusesForDocuments](self->_sourceAuthorizationController, "objectAuthorizationStatusesForDocuments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if ((_DWORD)v11 && v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v13, v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSwitchTableViewCell setCountText:](v6, "setCountText:", v14);

    v15 = 1;
  }
  else
  {
    -[HKSwitchTableViewCell setCountText:](v6, "setCountText:", 0);
    v15 = 0;
  }
  -[HKSwitchTableViewCell setAccessoryType:](v6, "setAccessoryType:", v15);
  if (v10 == 3)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v7, "parentType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", self->_healthStore);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parentType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v19);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v32;
    }
  }
  -[HKAuthorizationSettingsViewController _localizedNameForSection:type:](self, "_localizedNameForSection:type:", objc_msgSend(v4, "section"), v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell setDisplayText:](v6, "setDisplayText:", v20);
  objc_msgSend(v16, "listIcon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell setIconImage:](v6, "setIconImage:", v21);
  if (v21)
  {
    v22 = 59.0;
  }
  else
  {
    -[HKAuthorizationSettingsViewController tableView](self, "tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "separatorInset");
    v22 = v24;

  }
  -[HKSwitchTableViewCell setSeparatorInset:](v6, "setSeparatorInset:", 0.0, v22, 0.0, 0.0);
  v25 = CFSTR("UIA.Health.Default");
  if (v10 == 6)
    v25 = CFSTR("UIA.Health.Read");
  if (v10 == 4)
    v25 = CFSTR("UIA.Health.Write");
  v26 = (void *)MEMORY[0x1E0CB3500];
  v27 = v25;
  objc_msgSend(v26, "whitespaceAndNewlineCharacterSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hk_stringByRemovingCharactersInSet:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFString stringByAppendingFormat:](v27, "stringByAppendingFormat:", CFSTR(".%@.SwitchCell"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSwitchTableViewCell setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", v30);
  -[HKSwitchTableViewCell setOn:](v6, "setOn:", -[HKAuthorizationSettingsViewController _isTypeEnabledAtIndexPath:](self, "_isTypeEnabledAtIndexPath:", v4));
  -[HKSwitchTableViewCell setAdjustsFontSizeToFitWidth:](v6, "setAdjustsFontSizeToFitWidth:", 1);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  _BOOL4 v10;
  BOOL v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HKDocumentPickerViewController *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", objc_msgSend(v7, "section"));
  -[HKAuthorizationSettingsViewController _typeForIndexPath:section:](self, "_typeForIndexPath:section:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v8)
  {
    case 8:
      -[HKAuthorizationSettingsViewController source](self, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v24[3] = &unk_1E9C42F00;
      v25 = v15;
      v17 = v15;
      objc_msgSend(v16, "openApplication:withOptions:completion:", v17, 0, v24);

      break;
    case 6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[HKSourceAuthorizationController objectAuthorizationStatusesForDocuments](self->_sourceAuthorizationController, "objectAuthorizationStatusesForDocuments");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          -[HKSourceAuthorizationController objectAuthorizationStatusesForDocuments](self->_sourceAuthorizationController, "objectAuthorizationStatusesForDocuments");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[HKDocumentPickerViewController initWithDocumentAuthorizations:]([HKDocumentPickerViewController alloc], "initWithDocumentAuthorizations:", v20);
          -[HKDocumentPickerViewController setSource:](v21, "setSource:", self->_source);
          objc_msgSend(v9, "hk_localizedName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKDocumentPickerViewController setTitle:](v21, "setTitle:", v22);

          -[HKAuthorizationSettingsViewController navigationController](self, "navigationController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "pushViewController:animated:", v21, 1);

        }
      }
      break;
    case 2:
      v10 = -[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting");
      v11 = v10;
      v12 = !v10;
      v13 = -[HKSourceAuthorizationController allTypesEnabled](self->_sourceAuthorizationController, "allTypesEnabled") ^ 1;
      -[HKSourceAuthorizationController setEnabled:forAllTypesInSection:commit:](self->_sourceAuthorizationController, "setEnabled:forAllTypesInSection:commit:", v13, 4, v12);
      -[HKSourceAuthorizationController setEnabled:forAllTypesInSection:commit:](self->_sourceAuthorizationController, "setEnabled:forAllTypesInSection:commit:", v13, 6, v12);
      if ((v13 & 1) == 0 && !v11)
        -[HKSourceAuthorizationController resetObjectAuthorizationStatuses](self->_sourceAuthorizationController, "resetObjectAuthorizationStatuses");
      objc_msgSend(v6, "reloadData");
      -[HKAuthorizationSettingsViewController updateAllowButtonEnabledState](self, "updateAllowButtonEnabledState");
      break;
  }

}

void __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  -[HKAuthorizationSettingsViewController _typeForIndexPath:section:](self, "_typeForIndexPath:section:", v8, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting");
  if (v12 == 3)
  {
    v12 = 6;
    if (!v10)
      -[HKSourceAuthorizationController resetObjectAuthorizationStatuses](self->_sourceAuthorizationController, "resetObjectAuthorizationStatuses");
  }
  -[HKSourceAuthorizationController setEnabled:forType:inSection:commit:](self->_sourceAuthorizationController, "setEnabled:forType:inSection:commit:", v4, v9);
  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[HKAuthorizationSettingsViewController updateAllowButtonEnabledState](self, "updateAllowButtonEnabledState");
}

- (void)pickerControllerDidFinish:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKAuthorizationSettingsViewController pickerControllerDidFinish:error:].cold.1();
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "allSamples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      v13 = MEMORY[0x1E0C9AAA0];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "UUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "enabledSamples", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      v20 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "UUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v22);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

    -[HKSourceAuthorizationController commitObjectAuthorizationStatuses:](self->_sourceAuthorizationController, "commitObjectAuthorizationStatuses:", v8);
  }

}

- (void)authorizationController:(id)a3 parentTypeIsDisabled:(id)a4 forType:(id)a5 inSection:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  __CFString *v15;
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
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  int64_t v41;

  v36 = a3;
  v35 = a4;
  v9 = a5;
  objc_msgSend(v9, "hk_localizedNameForAuthSheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hk_localizedNameForAuthSheet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("ENABLING_%@_TO_WRITE_WILL_ENABLE_%@");
  if (a6 == 6)
    v12 = CFSTR("ENABLING_%@_TO_READ_WILL_ENABLE_%@");
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = (void *)MEMORY[0x1E0CB34D0];
  v15 = v12;
  objc_msgSend(v14, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", v17, v10, v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v32, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_STATUS_CHANGE_CANCEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v22);

  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_STATUS_ENABLE_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", v25, v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0DC3448];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __104__HKAuthorizationSettingsViewController_authorizationController_parentTypeIsDisabled_forType_inSection___block_invoke;
  v37[3] = &unk_1E9C42F28;
  v37[4] = self;
  v38 = v36;
  v40 = v9;
  v41 = a6;
  v39 = v35;
  v28 = v9;
  v29 = v35;
  v30 = v36;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v26, 0, v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v31);

  -[HKAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);
}

uint64_t __104__HKAuthorizationSettingsViewController_authorizationController_parentTypeIsDisabled_forType_inSection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isPrompting") ^ 1;
  objc_msgSend(*(id *)(a1 + 40), "setEnabled:forType:inSection:commit:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), v2);
  objc_msgSend(*(id *)(a1 + 40), "setEnabled:forType:inSection:commit:", 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateAllowButtonEnabledState");
}

- (void)authorizationController:(id)a3 subTypesEnabled:(id)a4 forType:(id)a5 inSection:(int64_t)a6
{
  id v8;
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
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v31;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  int64_t v38;

  v29 = a3;
  v28 = a4;
  v8 = a5;
  objc_msgSend(v8, "hk_localizedNameForAuthSheet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_localizedNameForAuthSheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DISABLING_%@_WILL_DISABLE_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v33, v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v31, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_STATUS_CHANGE_CANCEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_STATUS_DISABLE_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", v21, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0DC3448];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __99__HKAuthorizationSettingsViewController_authorizationController_subTypesEnabled_forType_inSection___block_invoke;
  v34[3] = &unk_1E9C42F28;
  v34[4] = self;
  v35 = v28;
  v37 = v8;
  v38 = a6;
  v36 = v29;
  v24 = v8;
  v25 = v29;
  v26 = v28;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v22, 0, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v27);

  -[HKAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

uint64_t __99__HKAuthorizationSettingsViewController_authorizationController_subTypesEnabled_forType_inSection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isPrompting") ^ 1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 48), "setEnabled:forType:inSection:commit:", 0, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++), *(_QWORD *)(a1 + 64), v2, (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 48), "setEnabled:forType:inSection:commit:", 0, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateAllowButtonEnabledState");
}

- (id)sectionsForAuthController:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[HKAuthorizationSettingsViewController source](self, "source", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_isSiri"))
  {
    v5 = -[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting");

    if (!v5)
    {
      v6 = &unk_1E9CE9ED8;
      return v6;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAuthorizationSettingsViewController source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_isResearchStudy"))
  {
    v8 = -[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting");

    if (v8)
      objc_msgSend(v6, "addObject:", &unk_1E9CEC650);
  }
  else
  {

  }
  v9 = -[HKSourceAuthorizationController countOfTypesInSection:](self->_sourceAuthorizationController, "countOfTypesInSection:", 4);
  if (v9 | -[HKSourceAuthorizationController countOfTypesInSection:](self->_sourceAuthorizationController, "countOfTypesInSection:", 6))objc_msgSend(v6, "addObject:", &unk_1E9CEC668);
  if (-[HKAuthorizationSettingsViewController _shouldDisplayHealthRecordsRequests](self, "_shouldDisplayHealthRecordsRequests"))
  {
    objc_msgSend(v6, "addObject:", &unk_1E9CEC680);
  }
  if (-[HKAuthorizationSettingsViewController _shouldDisplaySharingSection](self, "_shouldDisplaySharingSection"))
    objc_msgSend(v6, "addObject:", &unk_1E9CEC698);
  if (-[HKAuthorizationSettingsViewController _shouldDisplayReadingSection](self, "_shouldDisplayReadingSection"))
    objc_msgSend(v6, "addObject:", &unk_1E9CEC6B0);
  -[HKAuthorizationSettingsViewController source](self, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "_isApplication") & 1) != 0)
  {
    -[HKAuthorizationSettingsViewController researchStudyUsageDescription](self, "researchStudyUsageDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v6, "addObject:", &unk_1E9CEC6C8);
      if (!-[HKAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
        objc_msgSend(v6, "addObject:", &unk_1E9CEC6E0);
    }
  }
  else
  {

  }
  return v6;
}

- (BOOL)_shouldDisplayHealthRecordsRequests
{
  return -[HKSourceAuthorizationController isRequestingDocumentAuthorization](self->_sourceAuthorizationController, "isRequestingDocumentAuthorization");
}

- (BOOL)_shouldDisplaySharingSection
{
  void *v2;
  BOOL v3;

  -[HKSourceAuthorizationController typesInSection:](self->_sourceAuthorizationController, "typesInSection:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_shouldDisplayReadingSection
{
  return -[NSArray count](self->_readingTypeOrdering, "count") != 0;
}

- (int64_t)authorizationSectionForSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_actualSections, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)_typeForIndexPath:(id)a3 section:(int64_t *)a4
{
  id v7;
  int64_t v8;
  void *v9;
  NSArray *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v15;

  v7 = a3;
  v8 = -[HKAuthorizationSettingsViewController authorizationSectionForSection:](self, "authorizationSectionForSection:", objc_msgSend(v7, "section"));
  if (a4)
    *a4 = v8;
  v9 = 0;
  switch(v8)
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 7:
    case 8:
      goto LABEL_13;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      -[HKSourceAuthorizationController typesInSection:](self->_sourceAuthorizationController, "typesInSection:", 4);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 6:
      v10 = self->_readingTypeOrdering;
LABEL_7:
      v9 = v10;
      goto LABEL_8;
    default:
LABEL_8:
      v11 = objc_msgSend(v7, "row");
      if (v11 >= objc_msgSend(v9, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAuthorizationSettingsViewController.m"), 842, CFSTR("Requested index %ld in section %ld does not exist in %@"), objc_msgSend(v7, "row"), objc_msgSend(v7, "section"), v9);

      }
      v12 = objc_msgSend(v7, "row");
      if (v12 >= objc_msgSend(v9, "count"))
      {

        v9 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v13;
      }
LABEL_13:

      return v9;
  }
}

- (BOOL)_isTypeEnabledAtIndexPath:(id)a3
{
  void *v4;
  BOOL v5;
  uint64_t v7;

  v7 = 0;
  -[HKAuthorizationSettingsViewController _typeForIndexPath:section:](self, "_typeForIndexPath:section:", a3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 3)
    v7 = 6;
  v5 = -[HKSourceAuthorizationController isTypeEnabled:inSection:](self->_sourceAuthorizationController, "isTypeEnabled:inSection:", v4);

  return v5;
}

- (BOOL)shouldPresent
{
  return -[HKAuthorizationSettingsViewController _shouldDisplayHealthRecordsRequests](self, "_shouldDisplayHealthRecordsRequests")|| -[HKAuthorizationSettingsViewController _shouldDisplaySharingSection](self, "_shouldDisplaySharingSection")|| -[HKAuthorizationSettingsViewController _shouldDisplayReadingSection](self, "_shouldDisplayReadingSection");
}

- (void)_updateHeaderView
{
  HKTitledIconHeaderView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  -[HKAuthorizationSettingsViewController tableView](self, "tableView");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(HKTitledIconHeaderView);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setTitle:](v3, "setTitle:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@_WOULD_LIKE_TO_ACCESS_YOUR_HEALTH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSource name](self->_source, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setSubtitle:](v3, "setSubtitle:", v10);

  -[HKTitledIconHeaderView setPrefersLargeTitle:](v3, "setPrefersLargeTitle:", 1);
  -[HKTitledIconHeaderView setLayoutMarginsWithTableView:](v3, "setLayoutMarginsWithTableView:", v19);
  -[HKTitledIconHeaderView frame](v3, "frame");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v19, "bounds");
  -[HKTitledIconHeaderView sizeThatFits:](v3, "sizeThatFits:", v15, v16);
  -[HKTitledIconHeaderView setFrame:](v3, "setFrame:", v12, v14, v17, v18);
  objc_msgSend(v19, "setTableHeaderView:", v3);

}

- (void)_configurationFailedWithError:(id)a3
{
  id v4;

  v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    -[HKAuthorizationSettingsViewController _configurationFailedWithError:].cold.1();
  -[HKAuthorizationSettingsViewController _finishWithError:](self, "_finishWithError:", v4);

}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  return (HKHealthPrivacyServicePromptControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSource)source
{
  return self->_source;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)updateDescription
{
  return self->_updateDescription;
}

- (void)setUpdateDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (NSString)shareDescription
{
  return self->_shareDescription;
}

- (void)setShareDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSString)researchStudyUsageDescription
{
  return self->_researchStudyUsageDescription;
}

- (void)setResearchStudyUsageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSSet)typesToShare
{
  return self->_typesToShare;
}

- (void)setTypesToShare:(id)a3
{
  objc_storeStrong((id *)&self->_typesToShare, a3);
}

- (NSSet)typesToRead
{
  return self->_typesToRead;
}

- (void)setTypesToRead:(id)a3
{
  objc_storeStrong((id *)&self->_typesToRead, a3);
}

- (HKSourceAuthorizationController)sourceAuthorizationController
{
  return self->_sourceAuthorizationController;
}

- (void)setSourceAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAuthorizationController, a3);
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonItem, a3);
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_doneButtonItem, a3);
}

- (NSArray)actualSections
{
  return (NSArray *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setActualSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceAuthorizationController, 0);
  objc_storeStrong((id *)&self->_typesToRead, 0);
  objc_storeStrong((id *)&self->_typesToShare, 0);
  objc_storeStrong((id *)&self->_researchStudyUsageDescription, 0);
  objc_storeStrong((id *)&self->_shareDescription, 0);
  objc_storeStrong((id *)&self->_updateDescription, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_readingTypeOrdering, 0);
  objc_storeStrong((id *)&self->_actualSections, 0);
  objc_storeStrong((id *)&self->_documents, 0);
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_3_5();
  v3 = v2;
  _os_log_debug_impl(&dword_1D7813000, v1, OS_LOG_TYPE_DEBUG, "%@: dismissing", v4, 0xCu);

}

- (void)_localizedSourceExplanationWithDescription:forReadingSection:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "%{public}@: Attempt to synthesize explanation for %{public}@ before fetching BAR status");
  OUTLINED_FUNCTION_7_0();
}

void __75__HKAuthorizationSettingsViewController_tableView_didSelectRowAtIndexPath___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, a2, a3, "Failed to launch \"%{public}@\": %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_7_0();
}

- (void)pickerControllerDidFinish:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Document selection failed with error: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

- (void)_configurationFailedWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_1D7813000, v0, v1, "Failed to complete configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7_0();
}

@end
