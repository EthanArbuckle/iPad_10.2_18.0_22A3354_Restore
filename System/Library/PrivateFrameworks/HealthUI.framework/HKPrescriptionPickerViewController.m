@implementation HKPrescriptionPickerViewController

- (HKPrescriptionPickerViewController)initWithHealthStore:(id)a3 samples:(id)a4 enabledSamples:(id)a5 source:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HKPrescriptionPickerViewController *v18;
  HKPrescriptionPickerViewController *v19;
  uint64_t v20;
  NSMutableSet *enabledSamples;
  uint64_t v22;
  NSArray *samples;
  NSMutableSet *v24;
  NSMutableSet *samplesPendingAuthorizationUpdate;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[HKPrescriptionPickerViewController _headerTitleForSource:](self, "_headerTitleForSource:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPrescriptionPickerViewController _explanationTextForSource:](self, "_explanationTextForSource:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPrescriptionPickerViewController _headerIcon](self, "_headerIcon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)HKPrescriptionPickerViewController;
  v18 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v27, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v15, v16, v17, 1);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_healthStore, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
    enabledSamples = v19->_enabledSamples;
    v19->_enabledSamples = (NSMutableSet *)v20;

    -[HKPrescriptionPickerViewController _sortedPrescriptions:](v19, "_sortedPrescriptions:", v12);
    v22 = objc_claimAutoreleasedReturnValue();
    samples = v19->_samples;
    v19->_samples = (NSArray *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    samplesPendingAuthorizationUpdate = v19->_samplesPendingAuthorizationUpdate;
    v19->_samplesPendingAuthorizationUpdate = v24;

    objc_storeStrong((id *)&v19->_source, a6);
    v19->_hasData = -[NSArray count](v19->_samples, "count") != 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKPrescriptionPickerViewController;
  -[OBTableWelcomeController viewDidLoad](&v10, sel_viewDidLoad);
  -[HKPrescriptionPickerViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKPrescriptionPickerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  -[HKPrescriptionPickerViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setModalInPresentation:", 1);

  -[HKPrescriptionPickerViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowFullWidthIcon:", 1);

  -[HKPrescriptionPickerViewController _setUpCancelBarButtonItem](self, "_setUpCancelBarButtonItem");
  -[HKPrescriptionPickerViewController _setUpTableView](self, "_setUpTableView");
  -[HKPrescriptionPickerViewController _setUpFooterView](self, "_setUpFooterView");
  -[HKPrescriptionPickerViewController _updateShareButtonState](self, "_updateShareButtonState");
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)_setUpCancelBarButtonItem
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("UIA.Health.Cancel.Button"));
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (void)_setUpTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HKPrescriptionPickerViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  +[HKPrescriptionPickerCell defaultReuseIdentifier](HKPrescriptionPickerCell, "defaultReuseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerClass:forCellReuseIdentifier:", v12, v13);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier](HKObjectPickerNoDataTableViewCell, "defaultReuseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", v14, v15);

}

- (void)_setUpFooterView
{
  OBBoldTrayButton *v3;
  OBBoldTrayButton *shareButton;
  OBBoldTrayButton *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  shareButton = self->_shareButton;
  self->_shareButton = v3;

  v5 = self->_shareButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DONE_BUTTON_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-VRX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v5, "setTitle:forState:", v7, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_shareButton, "addTarget:action:forControlEvents:", self, sel_shareButtonTapped_, 64);
  -[OBBoldTrayButton setAccessibilityIdentifier:](self->_shareButton, "setAccessibilityIdentifier:", CFSTR("UIA.Health.Done.Button"));
  -[HKPrescriptionPickerViewController buttonTray](self, "buttonTray");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", self->_shareButton);

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
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_WITH_APP_EXPLANATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-VRX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_headerIcon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("health_privacy_icon_other_data"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_PRESCRIPTION_WITH_APP_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-VRX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)learnMoreButtonTapped:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.healthapp"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)shareButtonTapped:(id)a3
{
  void *v4;

  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKPrescriptionPickerViewController shareButtonTapped:].cold.1(v4);
  -[HKPrescriptionPickerViewController _finishWithError:](self, "_finishWithError:", 0);
}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  void *v5;

  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKPrescriptionPickerViewController cancelButtonTapped:].cold.1(v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 7, CFSTR("The user canceled authorization."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPrescriptionPickerViewController _finishWithError:](self, "_finishWithError:", v5);

}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKPrescriptionPickerViewController _finishWithError:].cold.1(v5);
  -[HKPrescriptionPickerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HKPrescriptionPickerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pickerControllerDidFinish:error:", self, v4);

  }
}

- (void)_enableSample:(id)a3 enabled:(BOOL)a4
{
  NSMutableSet *enabledSamples;

  enabledSamples = self->_enabledSamples;
  if (a4)
    -[NSMutableSet addObject:](enabledSamples, "addObject:", a3);
  else
    -[NSMutableSet removeObject:](enabledSamples, "removeObject:", a3);
}

- (void)_updateShareButtonState
{
  -[OBBoldTrayButton setEnabled:](self->_shareButton, "setEnabled:", -[NSMutableSet count](self->_samplesPendingAuthorizationUpdate, "count") != 0);
}

- (NSSet)allSamples
{
  return (NSSet *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", self->_samples);
}

- (NSMutableSet)enabledSamples
{
  return (NSMutableSet *)(id)-[NSMutableSet copy](self->_enabledSamples, "copy");
}

- (void)didTapShowDetailsButtonForCell:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "prescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKPrescriptionPickerViewController _loadPreviewControllerForPrescription:](self, "_loadPreviewControllerForPrescription:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[HKPrescriptionPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
    v5 = v6;
  }

}

- (void)didToggleSwitchForCell:(id)a3 isOn:(BOOL)a4
{
  _BOOL4 v4;
  int v6;
  NSMutableSet *samplesPendingAuthorizationUpdate;
  NSMutableSet *enabledSamples;
  id v9;

  v4 = a4;
  objc_msgSend(a3, "prescription");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[NSMutableSet containsObject:](self->_samplesPendingAuthorizationUpdate, "containsObject:");
  samplesPendingAuthorizationUpdate = self->_samplesPendingAuthorizationUpdate;
  if (v6)
    -[NSMutableSet removeObject:](samplesPendingAuthorizationUpdate, "removeObject:", v9);
  else
    -[NSMutableSet addObject:](samplesPendingAuthorizationUpdate, "addObject:", v9);
  enabledSamples = self->_enabledSamples;
  if (v4)
    -[NSMutableSet addObject:](enabledSamples, "addObject:", v9);
  else
    -[NSMutableSet removeObject:](enabledSamples, "removeObject:", v9);
  -[HKPrescriptionPickerViewController _updateShareButtonState](self, "_updateShareButtonState");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_hasData)
    return -[NSArray count](self->_samples, "count", a3);
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RECORDS_LIST_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-VRX"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedUppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  if (self->_hasData)
  {
    +[HKPrescriptionPickerCell defaultReuseIdentifier](HKPrescriptionPickerCell, "defaultReuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSArray objectAtIndexedSubscript:](self->_samples, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrescription:", v10);
    objc_msgSend(v9, "prescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "prescriptionType");

    if (v12 == 2)
    {
      v13 = CFSTR("UIA.Health.Contacts.Cell");
    }
    else
    {
      objc_msgSend(v9, "prescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "prescriptionType");

      if (v15 != 1)
      {
LABEL_8:
        objc_msgSend(v9, "setOn:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v10));
        objc_msgSend(v9, "setDelegate:", self);

        goto LABEL_9;
      }
      v13 = CFSTR("UIA.Health.Glasses.Cell");
    }
    objc_msgSend(v9, "setAccessibilityIdentifier:", v13);
    goto LABEL_8;
  }
  -[HKPrescriptionPickerViewController _noDataTableViewCell](self, "_noDataTableViewCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (a4)
    return HKUIOnePixel();
  else
    return 10.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)_noDataTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier](HKObjectPickerNoDataTableViewCell, "defaultReuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NO_MATCHING_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-VRX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExplanationText:", v7);

  objc_msgSend(v5, "setShowLearnMoreButton:", 0);
  return v5;
}

- (id)_loadPreviewControllerForPrescription:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSBundle *v8;
  NSBundle *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSBundle *visionBundle;
  id v17;

  v4 = a3;
  if (self->_visionBundle)
    goto LABEL_2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Health/FeedItemPlugins/VisionHealthAppPlugin.healthplugin"));
  v8 = (NSBundle *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKPrescriptionPickerViewController _loadPreviewControllerForPrescription:].cold.1(v14);
    goto LABEL_15;
  }
  v9 = v8;
  v17 = 0;
  -[NSBundle loadAndReturnError:](v8, "loadAndReturnError:", &v17);
  v10 = v17;
  if (v10)
  {
    v11 = v10;
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKPrescriptionPickerViewController _loadPreviewControllerForPrescription:].cold.3(v12, (uint64_t)self, (uint64_t)v11);

LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  visionBundle = self->_visionBundle;
  self->_visionBundle = v9;

LABEL_2:
  v5 = objc_alloc(NSClassFromString(CFSTR("VisionHealthAppPlugin.VisionPrescriptionDetailsViewController")));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "initWithHealthStore:visionPrescription:canEdit:", self->_healthStore, v4, 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);

  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      -[HKPrescriptionPickerViewController _loadPreviewControllerForPrescription:].cold.2(v13);
    v7 = 0;
  }

LABEL_16:
  return v7;
}

- (id)_sortedPrescriptions:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_22);
}

uint64_t __59__HKPrescriptionPickerViewController__sortedPrescriptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "dateIssued");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateIssued");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (HKHealthPrivacyServicePickerControllerDelegate)delegate
{
  return (HKHealthPrivacyServicePickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (void)setEnabledSamples:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSamples, a3);
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_visionBundle, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_samplesPendingAuthorizationUpdate, 0);
  objc_storeStrong((id *)&self->_enabledSamples, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)shareButtonTapped:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2();
  v3 = OUTLINED_FUNCTION_3(v2);
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Finished prescription authorization", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)cancelButtonTapped:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2();
  v3 = OUTLINED_FUNCTION_3(v2);
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Canceled prescription authorization", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2();
  v3 = OUTLINED_FUNCTION_3(v2);
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Dismissing prescription picker", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_loadPreviewControllerForPrescription:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2();
  v3 = OUTLINED_FUNCTION_3(v2);
  OUTLINED_FUNCTION_5_1(&dword_1D7813000, v4, v5, "%{public}@: Unable to initialize vision bundle for previewing prescriptions", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_loadPreviewControllerForPrescription:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4(a1);
  v2 = (void *)OUTLINED_FUNCTION_2();
  v3 = OUTLINED_FUNCTION_3(v2);
  OUTLINED_FUNCTION_5_1(&dword_1D7813000, v4, v5, "%{public}@: Unable to initialize vision prescription details view controller", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)_loadPreviewControllerForPrescription:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;

  v4 = OUTLINED_FUNCTION_4(a1);
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_1D7813000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to load vision bundle for previewing prescriptions with error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
