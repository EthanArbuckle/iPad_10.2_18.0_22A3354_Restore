@implementation HKDocumentPickerViewController

- (HKDocumentPickerViewController)initWithDocuments:(id)a3 presentationStyle:(int64_t)a4
{
  id v6;
  HKDocumentPickerViewController *v7;
  uint64_t v8;
  NSMutableArray *samplesList;
  uint64_t v10;
  NSSet *allSamples;
  NSMutableSet *v12;
  NSMutableSet *enabledSamples;
  HKHealthStore *v14;
  HKHealthStore *healthStore;
  BOOL v16;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDocumentPickerViewController;
  v7 = -[HKTableViewController initWithUsingInsetStyling:](&v18, sel_initWithUsingInsetStyling_, 1);
  if (v7)
  {
    v8 = objc_msgSend(v6, "mutableCopy");
    samplesList = v7->_samplesList;
    v7->_samplesList = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    allSamples = v7->_allSamples;
    v7->_allSamples = (NSSet *)v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    enabledSamples = v7->_enabledSamples;
    v7->_enabledSamples = v12;

    v7->_presentationStyle = a4;
    v14 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E0CB6780]);
    healthStore = v7->_healthStore;
    v7->_healthStore = v14;

    if (a4)
      v16 = (unint64_t)-[NSMutableArray count](v7->_samplesList, "count") > 1;
    else
      v16 = 1;
    v7->_showCheckboxes = v16;
  }

  return v7;
}

- (HKDocumentPickerViewController)initWithDocumentAuthorizations:(id)a3
{
  id v4;
  void *v5;
  HKDocumentPickerViewController *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKDocumentPickerViewController initWithDocuments:presentationStyle:](self, "initWithDocuments:presentationStyle:", v5, 0);
  if (v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v16 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "BOOLValue");

          if (v14)
            -[NSMutableSet addObject:](v6->_enabledSamples, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v5 = v16;
  }

  return v6;
}

- (HKDocumentPickerViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKDocumentPickerViewController;
  return -[HKDocumentPickerViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKDocumentPickerViewController;
  -[HKTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  if (-[HKDocumentPickerViewController _isPrompting](self, "_isPrompting"))
    -[HKDocumentPickerViewController _addCancelAndDoneButtons](self, "_addCancelAndDoneButtons");
  if (-[NSMutableArray count](self->_samplesList, "count") == 1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_samplesList, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDocumentPickerViewController _enableDocumentSample:enabled:](self, "_enableDocumentSample:enabled:", v3, 1);

  }
  -[HKDocumentPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedRowHeight:", 114.0);

  -[HKDocumentPickerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setSectionCornerRadius:", 10.0);

  -[HKDocumentPickerViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKDocumentPickerViewController;
  -[HKDocumentPickerViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[HKDocumentPickerViewController adjustHeaderViewFrame](self, "adjustHeaderViewFrame");
}

- (void)_updateForCurrentSizeCategory
{
  void *v3;
  _BOOL4 IsLargerThanSizeCategory;
  double v5;

  -[HKDocumentPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsLargerThanSizeCategory = HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory((void *)*MEMORY[0x1E0DC4918]);
  v5 = *MEMORY[0x1E0DC53D8];
  if (!IsLargerThanSizeCategory)
    v5 = 114.0;
  objc_msgSend(v3, "setRowHeight:", v5);

  if (self->_tableHeaderView)
    -[HKDocumentPickerViewController adjustHeaderViewFrame](self, "adjustHeaderViewFrame");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKDocumentPickerViewController;
  -[HKDocumentPickerViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  if (!-[HKDocumentPickerViewController _isPrompting](self, "_isPrompting"))
  {
    -[HKDocumentPickerViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[HKDocumentPickerViewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pickerControllerDidFinish:error:", self, 0);

    }
  }
}

- (void)_addCancelAndDoneButtons
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_PROMPT_DONT_ALLOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__cancel_);

  v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AUTHORIZATION_PROMPT_ALLOW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 2, self, sel__done_);

  objc_msgSend(v9, "setEnabled:", 0);
  -[HKDocumentPickerViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v13);
  objc_msgSend(v10, "setRightBarButtonItem:", v9);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HEALTH_ACCESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

}

- (BOOL)_isPrompting
{
  return self->_presentationStyle == 1;
}

- (BOOL)_needsSampleRequestDescription
{
  return self->_presentationStyle != 2;
}

- (void)_cancel:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKDocumentPickerViewController _cancel:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  if (-[HKDocumentPickerViewController _isPrompting](self, "_isPrompting"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("The user canceled authorization."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDocumentPickerViewController _finishWithError:](self, "_finishWithError:", v12);

  }
  else
  {
    -[HKDocumentPickerViewController _finishWithError:](self, "_finishWithError:", 0);
  }
}

- (void)_done:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKDocumentPickerViewController _done:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
  -[HKDocumentPickerViewController _finishWithError:](self, "_finishWithError:", 0);
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKDocumentPickerViewController _finishWithError:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  -[HKDocumentPickerViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[HKDocumentPickerViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pickerControllerDidFinish:error:", self, v4);

  }
}

- (void)setSource:(id)a3
{
  HKSource *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  HKSource *v11;

  v5 = (HKSource *)a3;
  if (self->_source != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_source, a3);
    -[HKDocumentPickerViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    v7 = -[HKDocumentPickerViewController _isPrompting](self, "_isPrompting");
    v5 = v11;
    if (v7)
    {
      -[HKDocumentPickerViewController _tableHeaderView](self, "_tableHeaderView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDocumentPickerViewController configureHeaderView:](self, "configureHeaderView:", v8);
      if (v11)
        v9 = v8;
      else
        v9 = 0;
      -[HKDocumentPickerViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTableHeaderView:", v9);

      v5 = v11;
    }
  }

}

- (id)_tableHeaderView
{
  HKTitledIconHeaderView *tableHeaderView;
  HKTitledIconHeaderView *v4;
  HKTitledIconHeaderView *v5;

  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = objc_alloc_init(HKTitledIconHeaderView);
    v5 = self->_tableHeaderView;
    self->_tableHeaderView = v4;

    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (void)configureHeaderView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[HKDocumentPickerViewController _needsSampleRequestDescription](self, "_needsSampleRequestDescription"))
  {
    v4 = -[NSMutableArray count](self->_samplesList, "count");
    if (v4 == 2)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("CLINICAL_DOCUMENTS_REQUEST_DESCRIPTION_DUAL");
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      if (v4 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("CLINICAL_DOCUMENTS_REQUEST_DESCRIPTION_SINGULAR");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("CLINICAL_DOCUMENTS_REQUEST_DESCRIPTION_PLURAL");
      }
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSource name](self->_source, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setSubtitle:", v11);
  }
  else
  {
    objc_msgSend(v15, "setSubtitle:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("HEALTH"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v13);

  -[HKDocumentPickerViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLayoutMarginsWithTableView:", v14);

}

- (void)adjustHeaderViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  HKTitledIconHeaderView *tableHeaderView;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[HKTitledIconHeaderView frame](self->_tableHeaderView, "frame");
  v4 = v3;
  v6 = v5;
  tableHeaderView = self->_tableHeaderView;
  -[HKDocumentPickerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[HKTitledIconHeaderView sizeThatFits:](tableHeaderView, "sizeThatFits:", v9, v10);
  v12 = v11;
  v14 = v13;

  -[HKTitledIconHeaderView setFrame:](self->_tableHeaderView, "setFrame:", v4, v6, v12, v14 + 16.0);
}

- (void)_enableDocumentSample:(id)a3 enabled:(BOOL)a4
{
  NSMutableSet *enabledSamples;
  _BOOL8 v6;
  void *v7;
  id v8;

  enabledSamples = self->_enabledSamples;
  if (a4)
    -[NSMutableSet addObject:](enabledSamples, "addObject:", a3);
  else
    -[NSMutableSet removeObject:](enabledSamples, "removeObject:", a3);
  v6 = -[NSMutableSet count](self->_enabledSamples, "count") != 0;
  -[HKDocumentPickerViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDocumentPickerViewController;
  -[HKDocumentPickerViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKDocumentPickerViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      -[HKDocumentPickerViewController _updateForCurrentSizeCategory](self, "_updateForCurrentSizeCategory");
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *samplesList;
  id v7;
  void *v8;
  const __CFString *v9;
  HKCDADocumentTableViewCell *v10;
  _BOOL4 showCheckboxes;
  HKCDADocumentTableViewCell *v12;
  HKCDADocumentTableViewCell *v13;
  uint64_t v14;

  samplesList = self->_samplesList;
  v7 = a3;
  -[NSMutableArray objectAtIndex:](samplesList, "objectAtIndex:", objc_msgSend(a4, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showCheckboxes)
    v9 = CFSTR("DocumentMultipleSelectionTableViewCellIdentifier");
  else
    v9 = CFSTR("DocumentSingleSelectionTableViewCellIdentifier");
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (HKCDADocumentTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    showCheckboxes = self->_showCheckboxes;
    v12 = [HKCDADocumentTableViewCell alloc];
    if (showCheckboxes)
    {
      v10 = -[HKCDADocumentTableViewCell initWithStyle:reuseIdentifier:](v12, "initWithStyle:reuseIdentifier:", 0, CFSTR("DocumentMultipleSelectionTableViewCellIdentifier"));
      -[HKCDADocumentTableViewCell setDelegate:](v10, "setDelegate:", self);
      v13 = v10;
      v14 = 1;
    }
    else
    {
      v13 = -[HKCDADocumentTableViewCell initWithStyle:reuseIdentifier:](v12, "initWithStyle:reuseIdentifier:", 0, CFSTR("DocumentSingleSelectionTableViewCellIdentifier"));
      v10 = v13;
      v14 = 0;
    }
    -[HKCDADocumentTableViewCell setShowsCheckbox:](v13, "setShowsCheckbox:", v14);
  }
  -[HKCDADocumentTableViewCell setCellValuesForDocumentSample:](v10, "setCellValuesForDocumentSample:", v8);
  -[HKCDADocumentTableViewCell setChecked:](v10, "setChecked:", -[NSMutableSet containsObject:](self->_enabledSamples, "containsObject:", v8));
  -[HKCDADocumentTableViewCell setAccessoryType:](v10, "setAccessoryType:", 1);

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSMutableArray count](self->_samplesList, "count", a3, a4);
}

- (void)pushDetailForDocumentSample:(id)a3
{
  id v4;
  HKCDADocumentDetailViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  HKCDADocumentDetailViewController *v9;

  v4 = a3;
  v5 = [HKCDADocumentDetailViewController alloc];
  objc_msgSend(v4, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "documentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKCDADocumentDetailViewController initWithReportData:](v5, "initWithReportData:", v7);

  -[HKDocumentPickerViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v9, 1);

}

- (id)dataMetadataViewControllerForSample:(id)a3
{
  id v4;
  HKDataMetadataViewController *v5;

  v4 = a3;
  v5 = -[HKDataMetadataViewController initWithSample:usingInsetStyling:profileName:delegate:]([HKDataMetadataViewController alloc], "initWithSample:usingInsetStyling:profileName:delegate:", v4, 1, 0, self);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[NSMutableArray objectAtIndex:](self->_samplesList, "objectAtIndex:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HKDocumentPickerViewController dataMetadataViewControllerForSample:](self, "dataMetadataViewControllerForSample:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDocumentPickerViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

  }
  else if (!self->_hasPendingDocumentFetch)
  {
    self->_hasPendingDocumentFetch = 1;
    v12 = objc_alloc(MEMORY[0x1E0CB6638]);
    objc_msgSend(MEMORY[0x1E0CB6978], "documentTypeForIdentifier:", *MEMORY[0x1E0CB4D00]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB6A78];
    objc_msgSend(v7, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "predicateForObjectWithUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v18[3] = &unk_1E9C45380;
    v18[4] = self;
    v19 = v6;
    v20 = v7;
    v17 = (void *)objc_msgSend(v12, "initWithDocumentType:predicate:limit:sortDescriptors:includeDocumentData:resultsHandler:", v13, v16, 1, 0, 1, v18);

    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v17);
  }

}

void __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v7[3] = &unk_1E9C44AB8;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __68__HKDocumentPickerViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setObject:atIndexedSubscript:", v2, objc_msgSend(*(id *)(a1 + 48), "row"));

    objc_msgSend(*(id *)(a1 + 32), "dataMetadataViewControllerForSample:", *(_QWORD *)(a1 + 56));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushViewController:animated:", v4, 1);

  }
}

- (void)cdaDocumentTableViewCellDidChangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[HKDocumentPickerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray objectAtIndex:](self->_samplesList, "objectAtIndex:", objc_msgSend(v8, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isChecked");

  -[HKDocumentPickerViewController _enableDocumentSample:enabled:](self, "_enableDocumentSample:enabled:", v6, v7);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enabledSamples, 0);
  objc_storeStrong((id *)&self->_allSamples, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_samplesList, 0);
}

- (void)_cancel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, a1, a3, "Cancelled document authorization", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

- (void)_done:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, a1, a3, "Finished document authorizations", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

- (void)_finishWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, a1, a3, "dismissing document picker", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8_0();
}

@end
