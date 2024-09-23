@implementation ProfileCharacteristicTypePermissionsViewController

- (ProfileCharacteristicTypePermissionsViewController)initWithHealthStore:(id)a3 characteristicType:(id)a4 firstName:(id)a5
{
  id v9;
  id v10;
  id v11;
  ProfileCharacteristicTypePermissionsViewController *v12;
  ProfileCharacteristicTypePermissionsViewController *v13;
  HKHealthStore **p_healthStore;
  uint64_t v15;
  HKDisplayTypeController *displayTypeController;
  uint64_t v17;
  HKAuthorizationStore *authorizationStore;
  uint64_t v19;
  HKDisplayType *displayType;
  void *v21;
  uint64_t v22;
  NSArray *orderedSectionIdentifiers;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  v12 = -[ProfileCharacteristicTypePermissionsViewController initWithStyle:](&v25, sel_initWithStyle_, 1);
  v13 = v12;
  if (v12)
  {
    p_healthStore = &v12->_healthStore;
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_msgSend(MEMORY[0x1E0D2F700], "sharedInstanceForHealthStore:", *p_healthStore);
    v15 = objc_claimAutoreleasedReturnValue();
    displayTypeController = v13->_displayTypeController;
    v13->_displayTypeController = (HKDisplayTypeController *)v15;

    objc_storeStrong((id *)&v13->_firstName, a5);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6330]), "initWithHealthStore:", *p_healthStore);
    authorizationStore = v13->_authorizationStore;
    v13->_authorizationStore = (HKAuthorizationStore *)v17;

    objc_storeStrong((id *)&v13->_characteristicType, a4);
    v13->_isLoaded = 0;
    -[HKDisplayTypeController displayTypeForObjectType:](v13->_displayTypeController, "displayTypeForObjectType:", v13->_characteristicType);
    v19 = objc_claimAutoreleasedReturnValue();
    displayType = v13->_displayType;
    v13->_displayType = (HKDisplayType *)v19;

    objc_msgSend(v9, "profileIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[ProfileCharacteristicTypePermissionsViewController orderedSectionIdentifiersForProfile:](ProfileCharacteristicTypePermissionsViewController, "orderedSectionIdentifiersForProfile:", objc_msgSend(v21, "type"));
    v22 = objc_claimAutoreleasedReturnValue();
    orderedSectionIdentifiers = v13->_orderedSectionIdentifiers;
    v13->_orderedSectionIdentifiers = (NSArray *)v22;

  }
  return v13;
}

- (ProfileCharacteristicTypePermissionsViewController)initWithStyle:(int64_t)a3
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

- (ProfileCharacteristicTypePermissionsViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  return -[ProfileCharacteristicTypePermissionsViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (ProfileCharacteristicTypePermissionsViewController)initWithNibName:(id)a3 bundle:(id)a4
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

- (void)setSourceListDataSource:(id)a3
{
  HKSourceListDataSource *v5;
  HKSourceListDataSource *sourceListDataSource;
  HKSourceListDataSource *v7;

  v5 = (HKSourceListDataSource *)a3;
  sourceListDataSource = self->_sourceListDataSource;
  if (sourceListDataSource != v5)
  {
    v7 = v5;
    -[HKSourceListDataSource unregisterObserver:](sourceListDataSource, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_sourceListDataSource, a3);
    -[HKSourceListDataSource registerObserver:](self->_sourceListDataSource, "registerObserver:", self);
    v5 = v7;
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  HKDisplayType *v5;
  HKDisplayType *displayType;
  void *v7;
  void *v8;
  uint64_t v9;
  WDDisplayTypeDescriptionTableFooterView *v10;
  WDDisplayTypeDescriptionTableFooterView *footerView;
  double v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  -[ProfileCharacteristicTypePermissionsViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);

  -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedSectionFooterHeight:", 0.0);

  -[HKDisplayTypeController displayTypeForObjectType:](self->_displayTypeController, "displayTypeForObjectType:", self->_characteristicType);
  v5 = (HKDisplayType *)objc_claimAutoreleasedReturnValue();
  displayType = self->_displayType;
  self->_displayType = v5;

  -[HKDisplayType localization](self->_displayType, "localization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (WDDisplayTypeDescriptionTableFooterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2C8]), "initWithDisplayType:", self->_displayType);
    footerView = self->_footerView;
    self->_footerView = v10;

  }
  v12 = *MEMORY[0x1E0D2F500];
  -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEstimatedRowHeight:", v12);

  -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  WDDisplayTypeDescriptionTableFooterView *footerView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  -[ProfileCharacteristicTypePermissionsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[ProfileCharacteristicTypePermissionsViewController _gatherDataAndRefreshUI](self, "_gatherDataAndRefreshUI");
  if (self->_footerView)
  {
    -[ProfileCharacteristicTypePermissionsViewController _adjustFooterHeight](self, "_adjustFooterHeight");
    footerView = self->_footerView;
    -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableFooterView:", footerView);

  }
}

- (void)_adjustFooterHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  WDDisplayTypeDescriptionTableFooterView *footerView;
  void *v8;
  CGFloat Width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;

  -[WDDisplayTypeDescriptionTableFooterView frame](self->_footerView, "frame");
  v4 = v3;
  v6 = v5;
  footerView = self->_footerView;
  -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v16);
  LODWORD(v10) = 1148846080;
  LODWORD(v11) = 1132068864;
  -[WDDisplayTypeDescriptionTableFooterView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](footerView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v10, v11);
  v13 = v12;
  v15 = v14;

  -[WDDisplayTypeDescriptionTableFooterView setFrame:](self->_footerView, "setFrame:", v4, v6, v13, v15);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfileCharacteristicTypePermissionsViewController;
  -[ProfileCharacteristicTypePermissionsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[ProfileCharacteristicTypePermissionsViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__ProfileCharacteristicTypePermissionsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E5575398;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __79__ProfileCharacteristicTypePermissionsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "_adjustFooterHeight");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endUpdates");

}

- (void)_gatherDataAndRefreshUI
{
  -[ProfileCharacteristicTypePermissionsViewController _fetchAuthorizationRecordsBySourceForCharacteristic:](self, "_fetchAuthorizationRecordsBySourceForCharacteristic:", self->_characteristicType);
}

- (void)_fetchAuthorizationRecordsBySourceForCharacteristic:(id)a3
{
  HKAuthorizationStore *authorizationStore;
  _QWORD v4[5];

  authorizationStore = self->_authorizationStore;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke;
  v4[3] = &unk_1E5575948;
  v4[4] = self;
  -[HKAuthorizationStore fetchAuthorizationRecordsForType:completion:](authorizationStore, "fetchAuthorizationRecordsForType:completion:", a3, v4);
}

void __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_cold_1((uint64_t)v6, v7);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_198;
  v9[3] = &unk_1E55757D8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_198(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setSourceToAuthRecord:", *(_QWORD *)(a1 + 40));
  v2 = objc_alloc(MEMORY[0x1E0D2F890]);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = v3[127];
  objc_msgSend(v3, "sourceToAuthRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "initWithHealthStore:sources:queue:", v4, v6, MEMORY[0x1E0C80D38]);

  objc_msgSend(v8, "setShouldFetchAppIcons:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSourceListDataSource:", v8);
  objc_msgSend(*(id *)(a1 + 32), "sourceListDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchSources");

}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v12 = a5;
  if (v17 && !a7)
  {
    v13 = a4;
    objc_msgSend(a6, "indexPathForCell:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProfileCharacteristicTypePermissionsViewController _sourceForIndexPath:](self, "_sourceForIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v15) = objc_msgSend(v16, "isEqual:", v13);
    if ((_DWORD)v15)
      objc_msgSend(v12, "setIconImage:", v17);

  }
}

+ (id)orderedSectionIdentifiersForProfile:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", &unk_1E55CD0E8, 0);
  v5 = v4;
  if (a3 == 1)
    objc_msgSend(v4, "addObject:", &unk_1E55CD100);
  return v5;
}

- (int64_t)_profileSectionIdentifierForIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_orderedSectionIdentifiers, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (BOOL)_shouldDisplayNameInFooters
{
  void *v2;
  BOOL v3;

  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 3;

  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_orderedSectionIdentifiers, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int64_t v11;

  v5 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", a4);
  if (v5 == 1)
  {
    -[ProfileCharacteristicTypePermissionsViewController sourceListDataSource](self, "sourceListDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedResearchStudySources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
      return 0;
    -[ProfileCharacteristicTypePermissionsViewController sourceListDataSource](self, "sourceListDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedAppSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = objc_msgSend(v8, "count");
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;

  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_isLoaded)
  {
    v9 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", objc_msgSend(v7, "section"));
    if (v9 == 1)
    {
      -[ProfileCharacteristicTypePermissionsViewController sourceListDataSource](self, "sourceListDataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sources");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "orderedResearchStudySources");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (!v21)
      {
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
        WDBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("RESEARCH_STUDIES_NONE");
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
      -[ProfileCharacteristicTypePermissionsViewController sourceListDataSource](self, "sourceListDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "orderedAppSources");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
      {
        v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, 0);
        WDBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = CFSTR("APPS_NONE");
LABEL_15:
        objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setText:", v33);

        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "textLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setTextColor:", v35);

        objc_msgSend(v14, "setSelectionStyle:", 0);
        goto LABEL_16;
      }
    }
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("source"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F8B0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("source"));
      objc_msgSend(v22, "setSelectionStyle:", 0);
      objc_msgSend(v22, "setDelegate:", self);
    }
    -[ProfileCharacteristicTypePermissionsViewController _sourceForIndexPath:](self, "_sourceForIndexPath:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_characteristicAuthorizationRecordsBySource, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "source");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setDisplayText:", v26);
      objc_msgSend(v24, "status");
      objc_msgSend(v22, "setOn:", HKAuthorizationStatusAllowsReading());
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D2F5B8], "sharedImageManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "source");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = MEMORY[0x1E0C809B0];
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v43[3] = &unk_1E5575970;
      v30 = v22;
      v44 = v30;
      v38[0] = v29;
      v38[1] = 3221225472;
      v38[2] = __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
      v38[3] = &unk_1E55759C0;
      objc_copyWeak(&v42, &location);
      v39 = v23;
      v31 = v30;
      v40 = v31;
      v41 = v6;
      objc_msgSend(v27, "loadIconForSource:syncHandler:asyncHandler:", v28, v43, v38);

      v14 = v31;
      objc_destroyWeak(&v42);

      objc_destroyWeak(&location);
    }
    else
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HKErrorTableViewCell();
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D2F2E8]);
  }
LABEL_16:

  return v14;
}

uint64_t __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImage:", a2);
}

void __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v9[3] = &unk_1E5575998;
  objc_copyWeak(&v15, a1 + 7);
  v10 = v5;
  v11 = a1[4];
  v12 = a1[5];
  v13 = a1[6];
  v14 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v15);
}

void __86__ProfileCharacteristicTypePermissionsViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:tableView:fetchError:", v2, v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "iconSize");
    v6 = v5;
    objc_msgSend(v8, "layoutMargins");
    objc_msgSend(v8, "setSeparatorInset:", 0.0, v6 + v7 * 2.0, 0.0, 0.0);
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v4 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", a4);
  if (v4 == 1)
  {
    WDBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("RESEARCH_STUDIES_READ_ACCESS_HEADER");
  }
  else
  {
    if (v4)
    {
      v10 = &stru_1E55A2388;
      return v10;
    }
    WDBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("APPS_READ_ACCESS_HEADER");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseStringWithLocale:", v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v18;

  v5 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", a4);
  if (v5 == 1)
  {
    if (-[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier") == 218)
    {
      WDBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      v12 = CFSTR("DATA_TYPE_SHARING_RESEARCH_STUDIES_EXPLANATION_THIS");
LABEL_10:
      objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      return v13;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    WDBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v16 = CFSTR("DATA_TYPE_SHARING_RESEARCH_STUDIES_EXPLANATION");
LABEL_13:
    objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayType localization](self->_displayType, "localization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "embeddedDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v8, v10, v18);
    goto LABEL_14;
  }
  if (!v5)
  {
    if (-[ProfileCharacteristicTypePermissionsViewController _shouldDisplayNameInFooters](self, "_shouldDisplayNameInFooters"))
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      WDBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DATA_TYPE_SHARING_APPS_EXPLANATION_%@%@"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable-Tinker"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKDisplayType localization](self->_displayType, "localization");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "embeddedDisplayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v8, v10, self->_firstName);
LABEL_14:
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (-[HKDisplayType displayTypeIdentifier](self->_displayType, "displayTypeIdentifier") == 218)
    {
      WDBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      v12 = CFSTR("DATA_TYPE_SHARING_APPS_EXPLANATION_THIS");
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E0CB3940];
    WDBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v16 = CFSTR("DATA_TYPE_SHARING_APPS_EXPLANATION");
    goto LABEL_13;
  }
  v13 = &stru_1E55A2388;
  return v13;
}

- (id)_sourceForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[ProfileCharacteristicTypePermissionsViewController _profileSectionIdentifierForIndex:](self, "_profileSectionIdentifierForIndex:", objc_msgSend(v4, "section"));
  if (v5 == 1)
  {
    -[ProfileCharacteristicTypePermissionsViewController sourceListDataSource](self, "sourceListDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedResearchStudySources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v10 = 0;
      goto LABEL_7;
    }
    -[ProfileCharacteristicTypePermissionsViewController sourceListDataSource](self, "sourceListDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orderedAppSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  HKCharacteristicType *v13;
  HKAuthorizationStore *authorizationStore;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HKCharacteristicType *v19;
  _QWORD v20[4];
  HKCharacteristicType *v21;
  HKCharacteristicType *v22;
  _QWORD v23[2];

  v4 = a4;
  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ProfileCharacteristicTypePermissionsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ProfileCharacteristicTypePermissionsViewController _sourceForIndexPath:](self, "_sourceForIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_characteristicAuthorizationRecordsBySource, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "requestedSharing");
  if (v4)
  {
    if (v11 && (objc_msgSend(v10, "status"), (HKAuthorizationStatusAllowsSharing() & 1) != 0))
      v12 = 101;
    else
      v12 = 103;
  }
  else if (v11 && (objc_msgSend(v10, "status"), (HKAuthorizationStatusAllowsSharing() & 1) != 0))
  {
    v12 = 102;
  }
  else
  {
    v12 = 104;
  }
  objc_msgSend(v10, "setStatus:", v12);
  v13 = self->_characteristicType;
  authorizationStore = self->_authorizationStore;
  v22 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke;
  v20[3] = &unk_1E5575760;
  v21 = v13;
  v19 = v13;
  -[HKAuthorizationStore setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:](authorizationStore, "setAuthorizationStatuses:authorizationModes:forBundleIdentifier:options:completion:", v16, MEMORY[0x1E0C9AA70], v18, 0, v20);

}

void __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (void)sourceListDataSourceDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ProfileCharacteristicTypePermissionsViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__ProfileCharacteristicTypePermissionsViewController_sourceListDataSourceDidUpdate___block_invoke;
  v6[3] = &unk_1E55757D8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __84__ProfileCharacteristicTypePermissionsViewController_sourceListDataSourceDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _BYTE *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "sourceToAuthRecord");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "source");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2A0]), "initWithInternalAuthorizationRecord:", v12);
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 1056);
  *(_QWORD *)(v14 + 1056) = v2;
  v16 = v2;

  v17 = *(_BYTE **)(a1 + 40);
  if (!v17[1080])
  {
    v17[1080] = 1;
    v17 = *(_BYTE **)(a1 + 40);
  }
  objc_msgSend(v17, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "reloadData");
}

- (HKSourceListDataSource)sourceListDataSource
{
  return self->_sourceListDataSource;
}

- (NSDictionary)sourceToAuthRecord
{
  return self->_sourceToAuthRecord;
}

- (void)setSourceToAuthRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceToAuthRecord, 0);
  objc_storeStrong((id *)&self->_sourceListDataSource, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_characteristicAuthorizationRecordsBySource, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __106__ProfileCharacteristicTypePermissionsViewController__fetchAuthorizationRecordsBySourceForCharacteristic___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A95F5000, a2, OS_LOG_TYPE_ERROR, "Error fetching authorization records: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __83__ProfileCharacteristicTypePermissionsViewController_switchCellValueChanged_value___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1A95F5000, log, OS_LOG_TYPE_ERROR, "Error setting authorization for %@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
