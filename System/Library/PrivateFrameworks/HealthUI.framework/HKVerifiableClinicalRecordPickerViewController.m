@implementation HKVerifiableClinicalRecordPickerViewController

- (HKVerifiableClinicalRecordPickerViewController)initWithClinicalRecords:(id)a3 signedRecords:(id)a4 recordTypes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HKVerifiableClinicalRecordPickerViewController *v14;
  NSMutableSet *v15;
  NSMutableSet *enabledSamples;
  uint64_t v17;
  NSSet *allSamples;
  uint64_t v19;
  NSArray *clinicalRecords;
  uint64_t v21;
  NSDictionary *signedRecordsByIdentifier;
  uint64_t v23;
  NSArray *recordTypes;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKVerifiableClinicalRecordPickerViewController _headerTitleForRecordTypes:](self, "_headerTitleForRecordTypes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVerifiableClinicalRecordPickerViewController _explanationText:](self, "_explanationText:", self->_source);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVerifiableClinicalRecordPickerViewController _headerIconForRecordTypes:](self, "_headerIconForRecordTypes:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HKVerifiableClinicalRecordPickerViewController;
  v14 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v26, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v11, v12, v13, 1);
  if (v14)
  {
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    enabledSamples = v14->_enabledSamples;
    v14->_enabledSamples = v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
    allSamples = v14->_allSamples;
    v14->_allSamples = (NSSet *)v17;

    v19 = objc_msgSend(v8, "copy");
    clinicalRecords = v14->_clinicalRecords;
    v14->_clinicalRecords = (NSArray *)v19;

    v21 = objc_msgSend(v9, "copy");
    signedRecordsByIdentifier = v14->_signedRecordsByIdentifier;
    v14->_signedRecordsByIdentifier = (NSDictionary *)v21;

    v23 = objc_msgSend(v10, "copy");
    recordTypes = v14->_recordTypes;
    v14->_recordTypes = (NSArray *)v23;

    v14->_hasData = objc_msgSend(v8, "count") != 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableClinicalRecordPickerViewController;
  -[OBTableWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  -[HKVerifiableClinicalRecordPickerViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKVerifiableClinicalRecordPickerViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  -[HKVerifiableClinicalRecordPickerViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HKVerifiableClinicalRecordPickerViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowFullWidthIcon:", 1);

  -[HKVerifiableClinicalRecordPickerViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1036831949;
  objc_msgSend(v8, "setTitleHyphenationFactor:", v9);

  -[HKVerifiableClinicalRecordPickerViewController _setUpTableView](self, "_setUpTableView");
  -[HKVerifiableClinicalRecordPickerViewController _setUpAccessoryButton](self, "_setUpAccessoryButton");
  -[HKVerifiableClinicalRecordPickerViewController _setUpFooterView](self, "_setUpFooterView");
  if (!self->_hasData)
    -[HKVerifiableClinicalRecordPickerViewController _setUpCancelBarButtonItem](self, "_setUpCancelBarButtonItem");
  if (-[NSArray count](self->_clinicalRecords, "count") == 1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKVerifiableClinicalRecordPickerViewController _enableSample:enabled:](self, "_enableSample:enabled:", v10, 1);

  }
  -[HKVerifiableClinicalRecordPickerViewController _updateShareButtonState](self, "_updateShareButtonState");
  -[HKVerifiableClinicalRecordPickerViewController _updateCancelButtonState](self, "_updateCancelButtonState");
  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKVerifiableClinicalRecordPickerViewController;
  -[OBTableWelcomeController viewWillAppear:](&v8, sel_viewWillAppear_);
  if (self->_hasData)
  {
    -[HKVerifiableClinicalRecordPickerViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isNavigationBarHidden");

    if ((v6 & 1) == 0)
    {
      -[HKVerifiableClinicalRecordPickerViewController navigationController](self, "navigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNavigationBarHidden:animated:", 1, v3);

    }
  }
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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HKVerifiableClinicalRecordPickerViewController traitCollection](self, "traitCollection");
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
  objc_msgSend(v11, "setAllowsMultipleSelection:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  +[HKObjectPickerTableViewCell defaultReuseIdentifier](HKSignedClinicalDataTableViewCell, "defaultReuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", v13, v14);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  +[HKObjectPickerShowDetailsTableViewCell defaultReuseIdentifier](HKObjectPickerShowDetailsTableViewCell, "defaultReuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", v16, v17);

  -[OBTableWelcomeController tableView](self, "tableView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_class();
  +[HKObjectPickerNoDataTableViewCell defaultReuseIdentifier](HKObjectPickerNoDataTableViewCell, "defaultReuseIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", v18, v19);

}

- (void)_setUpAccessoryButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v5, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_learnMoreButtonTapped_, 64);
  -[HKVerifiableClinicalRecordPickerViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAccessoryButton:", v7);

}

- (void)_setUpFooterView
{
  OBBoldTrayButton *v3;
  OBBoldTrayButton *shareButton;
  OBBoldTrayButton *v5;
  void *v6;
  OBBoldTrayButton *v7;
  void *v8;
  void *v9;
  void *v10;
  OBLinkTrayButton *v11;
  OBLinkTrayButton *cancelButton;
  OBLinkTrayButton *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  shareButton = self->_shareButton;
  self->_shareButton = v3;

  v5 = self->_shareButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTintColor:](v5, "setTintColor:", v6);

  v7 = self->_shareButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHARE_BUTTON_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v7, "setTitle:forState:", v9, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_shareButton, "addTarget:action:forControlEvents:", self, sel_shareButtonTapped_, 64);
  -[HKVerifiableClinicalRecordPickerViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", self->_shareButton);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v11 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  self->_cancelButton = v11;

  v13 = self->_cancelButton;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DONT_SHARE_BUTTON_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](v13, "setTitle:forState:", v15, 0);

  -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, sel_cancelButtonTapped_, 64);
  -[HKVerifiableClinicalRecordPickerViewController buttonTray](self, "buttonTray");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addButton:", self->_cancelButton);

}

- (void)_setUpCancelBarButtonItem
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (id)_explanationText:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_WITH_APP_EXPLANATION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "name");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = &stru_1E9C4C428;
  objc_msgSend(v7, "stringWithFormat:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_headerIconForRecordTypes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  int v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB60E0]))
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("scd_immunizations");
  }
  else
  {
    v7 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB60E8]);
    v4 = (void *)MEMORY[0x1E0DC3870];
    HKHealthUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = CFSTR("scd_labs");
    else
      v6 = CFSTR("health_records_all_records");
  }
  objc_msgSend(v4, "imageNamed:inBundle:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_headerTitleForRecordTypes:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SHARE_RESULT_WITH_APP_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
    -[HKVerifiableClinicalRecordPickerViewController shareButtonTapped:].cold.1(v4);
  -[HKVerifiableClinicalRecordPickerViewController _finishWithError:](self, "_finishWithError:", 0);
}

- (void)cancelButtonTapped:(id)a3
{
  void *v4;
  void *v5;

  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKVerifiableClinicalRecordPickerViewController cancelButtonTapped:].cold.1(v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 7, CFSTR("The user canceled authorization."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVerifiableClinicalRecordPickerViewController _finishWithError:](self, "_finishWithError:", v5);

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
    -[HKVerifiableClinicalRecordPickerViewController _finishWithError:].cold.1(v5);
  -[HKVerifiableClinicalRecordPickerViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HKVerifiableClinicalRecordPickerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pickerControllerDidFinish:error:", self, v4);

  }
}

- (void)setSource:(id)a3
{
  HKSource **p_source;
  id v6;
  void *v7;
  id v8;

  p_source = &self->_source;
  objc_storeStrong((id *)&self->_source, a3);
  v6 = a3;
  -[HKVerifiableClinicalRecordPickerViewController headerView](self, "headerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKVerifiableClinicalRecordPickerViewController _explanationText:](self, "_explanationText:", *p_source);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDetailText:", v7);
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
  -[OBBoldTrayButton setEnabled:](self->_shareButton, "setEnabled:", -[NSMutableSet count](self->_enabledSamples, "count") != 0);
}

- (void)_updateCancelButtonState
{
  -[OBLinkTrayButton setEnabled:](self->_cancelButton, "setEnabled:", self->_hasData);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_hasData)
    return -[NSArray count](self->_clinicalRecords, "count", a3);
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (self->_hasData)
    return 2;
  else
    return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  if (self->_hasData)
  {
    v7 = -[NSArray count](self->_clinicalRecords, "count");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 != 1)
    {
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DATA_SECTION_TABLE_HEADER_STRING_FORMAT_%1$ld_%2$ld"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v13, a4 + 1, -[NSArray count](self->_clinicalRecords, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)v13;
      goto LABEL_7;
    }
    v10 = CFSTR("DATA_SECTION_TABLE_HEADER");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("DATA_SECTION_TABLE_HEADER_NO_DATA");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedUppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *signedRecordsByIdentifier;
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
  HKObjectPickerDetailItem *v25;
  void *v26;
  HKObjectPickerDetailItem *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_hasData)
  {
    if (objc_msgSend(v7, "row") == 1)
    {
      +[HKObjectPickerShowDetailsTableViewCell defaultReuseIdentifier](HKObjectPickerShowDetailsTableViewCell, "defaultReuseIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[HKObjectPickerTableViewCell defaultReuseIdentifier](HKSignedClinicalDataTableViewCell, "defaultReuseIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      signedRecordsByIdentifier = self->_signedRecordsByIdentifier;
      objc_msgSend(v11, "originIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](signedRecordsByIdentifier, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "recordTypeDisplayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPrimaryText:", v15);

      v38 = v14;
      if (v14)
      {
        objc_msgSend(v14, "issuerDisplayStringWithSignatureStatusGlyph");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSecondaryAttributedText:", v16);

        objc_msgSend(v14, "items");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "hk_map:", &__block_literal_global_250);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDetailItems:", v19);

      }
      else
      {
        objc_msgSend(v11, "recordIssuerDisplayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSecondaryText:", v20);

        objc_msgSend(v11, "relevantDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hk_utcDateAdjustedToCalendar:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        HKLocalizedStringForDateAndTemplate(v23, 10);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = [HKObjectPickerDetailItem alloc];
        objc_msgSend(v11, "recordItemsDisplayName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[HKObjectPickerDetailItem initWithPrimaryText:secondaryText:](v25, "initWithPrimaryText:secondaryText:", v26, v24);

        v41[0] = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDetailItems:", v28);

      }
      objc_msgSend(v11, "subject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fullName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPatientName:", v30);

      objc_msgSend(v11, "subject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dateOfBirthComponents");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        objc_msgSend(v32, "hk_populatedCalendarGregorianCalendarDefault");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "dateFromComponents:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        HKLocalizedStringForDateAndTemplate(v34, 10);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v35;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPatientDetails:", v36);

      }
      objc_msgSend(v10, "setChecked:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v11));

    }
  }
  else
  {
    -[HKVerifiableClinicalRecordPickerViewController _noDataTableViewCell](self, "_noDataTableViewCell");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __82__HKVerifiableClinicalRecordPickerViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "relevantDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relevantDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

HKObjectPickerDetailItem *__82__HKVerifiableClinicalRecordPickerViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  HKObjectPickerDetailItem *v6;
  void *v7;
  void *v8;
  void *v9;
  HKObjectPickerDetailItem *v10;

  v2 = a2;
  objc_msgSend(v2, "relevantDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_utcDateAdjustedToCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [HKObjectPickerDetailItem alloc];
  objc_msgSend(v2, "primaryConcept");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedPreferredName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v5, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKObjectPickerDetailItem initWithPrimaryText:secondaryText:](v6, "initWithPrimaryText:secondaryText:", v8, v9);

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x1E0DC53D8];
  if (!a4)
    return 10.0;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);
  if (self->_hasData)
  {
    if (objc_msgSend(v6, "row") == 1)
    {
      -[HKVerifiableClinicalRecordPickerViewController showDetailsButtonTappedAtIndexPath:](self, "showDetailsButtonTappedAtIndexPath:", v6);
    }
    else
    {
      objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKVerifiableClinicalRecordPickerViewController _enableSample:enabled:](self, "_enableSample:enabled:", v8, objc_msgSend(v7, "checked") ^ 1);
      objc_msgSend(v7, "setChecked:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v8));
      -[HKVerifiableClinicalRecordPickerViewController _updateShareButtonState](self, "_updateShareButtonState");

    }
  }

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

  -[HKVerifiableClinicalRecordPickerViewController _noDataExplanationTextForRecordTypes:](self, "_noDataExplanationTextForRecordTypes:", self->_recordTypes);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExplanationText:", v6);

  objc_msgSend(v5, "learnMoreButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_noDataLearnMoreButtonTapped_, 64);

  return v5;
}

- (id)_noDataExplanationTextForRecordTypes:(id)a3
{
  id v3;
  char v4;
  void *v5;
  const __CFString *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB60D8]);
  if (objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB60E0]))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4 & 1) != 0)
      v6 = CFSTR("NO_DATA_TEXT_COVID_IMMUNIZATION");
    else
      v6 = CFSTR("NO_DATA_TEXT_IMMUNIZATION");
  }
  else
  {
    v7 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB60E8]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((v4 & 1) != 0)
        v6 = CFSTR("NO_DATA_TEXT_COVID_LABORATORY");
      else
        v6 = CFSTR("NO_DATA_TEXT_LABORATORY");
    }
    else if ((v4 & 1) != 0)
    {
      v6 = CFSTR("NO_DATA_TEXT_COVID_RECORD");
    }
    else
    {
      v6 = CFSTR("NO_DATA_TEXT_RECORD");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)noDataLearnMoreButtonTapped:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E98];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithString:", CFSTR("https://support.apple.com/en-us/HT212752"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v8);
  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  objc_msgSend(v6, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceView:", v5);

  objc_msgSend(v6, "setDismissButtonStyle:", 0);
  -[HKVerifiableClinicalRecordPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)showDetailsButtonTappedAtIndexPath:(id)a3
{
  void *v4;
  NSDictionary *signedRecordsByIdentifier;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  HKVerifiableClinicalRecordDetailViewController *v12;
  void *v13;
  void *v14;
  void *v15;

  -[NSArray objectAtIndexedSubscript:](self->_clinicalRecords, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  signedRecordsByIdentifier = self->_signedRecordsByIdentifier;
  objc_msgSend(v4, "originIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](signedRecordsByIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKVerifiableClinicalRecordPickerViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HKVerifiableClinicalRecordPickerViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "medicalRecordsForVerifiableClinicalRecord:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
LABEL_3:
      v12 = -[HKVerifiableClinicalRecordDetailViewController initWithSignedRecord:medicalRecords:]([HKVerifiableClinicalRecordDetailViewController alloc], "initWithSignedRecord:medicalRecords:", v7, v11);
      -[HKVerifiableClinicalRecordPickerViewController navigationController](self, "navigationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pushViewController:animated:", v12, 1);

      goto LABEL_9;
    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
      -[HKVerifiableClinicalRecordPickerViewController showDetailsButtonTappedAtIndexPath:].cold.2(v14);
    v11 = 0;
    if (v7)
      goto LABEL_3;
  }
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKVerifiableClinicalRecordPickerViewController showDetailsButtonTappedAtIndexPath:].cold.1(v15, (uint64_t)self, v4);
LABEL_9:

}

- (HKSource)source
{
  return self->_source;
}

- (NSSet)allSamples
{
  return self->_allSamples;
}

- (NSMutableSet)enabledSamples
{
  return self->_enabledSamples;
}

- (void)setEnabledSamples:(id)a3
{
  objc_storeStrong((id *)&self->_enabledSamples, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledSamples, 0);
  objc_storeStrong((id *)&self->_allSamples, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
  objc_storeStrong((id *)&self->_signedRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_clinicalRecords, 0);
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
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Finished signed clinical data authorizations", v6, v7, v8, v9, v10);

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
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Canceled signed clinical data authorization", v6, v7, v8, v9, v10);

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
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Dismissing signed clinical data picker", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)showDetailsButtonTappedAtIndexPath:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v4 = OUTLINED_FUNCTION_4(a1);
  v5 = (void *)objc_opt_class();
  v6 = v5;
  objc_msgSend(a3, "originIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEBUG, "%{public}@: No HKSignedClinicalDataRecord found for HKVerifiableClinicalRecord with sync identifier %@", (uint8_t *)&v8, 0x16u);

}

- (void)showDetailsButtonTappedAtIndexPath:(void *)a1 .cold.2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1D7813000, v4, v5, "%{public}@: Delegate does not respond to medicalRecordsForVerifiableClinicalRecord:", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

@end
