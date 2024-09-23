@implementation HKObjectDataAccessViewController

- (HKObjectDataAccessViewController)initWithSample:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  HKObjectDataAccessViewController *v9;
  HKObjectDataAccessViewController *v10;
  uint64_t v11;
  HKAuthorizationStore *authorizationStore;
  void *v13;
  void *v14;
  uint64_t v15;
  HKDisplayType *displayType;
  void *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HKObjectDataAccessViewController;
  v9 = -[HKTableViewController initWithUsingInsetStyling:](&v19, sel_initWithUsingInsetStyling_, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sample, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6330]), "initWithHealthStore:", v8);
    authorizationStore = v10->_authorizationStore;
    v10->_authorizationStore = (HKAuthorizationStore *)v11;

    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sampleType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayTypeForObjectType:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    displayType = v10->_displayType;
    v10->_displayType = (HKDisplayType *)v15;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKObjectDataAccessViewController;
  -[HKObjectDataAccessViewController dealloc](&v4, sel_dealloc);
}

- (void)_setupHeaderViewSize
{
  HKTitledIconHeaderView *v3;
  HKTitledIconHeaderView *headerView;
  HKTitledIconHeaderView *v5;
  void *v6;
  void *v7;
  HKTitledIconHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  HKTitledIconHeaderView *v12;
  void *v13;
  void *v14;
  HKTitledIconHeaderView *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  HKTitledIconHeaderView *v20;
  void *v21;
  HKTitledIconHeaderView *v22;
  void *v23;
  id v24;

  v3 = objc_alloc_init(HKTitledIconHeaderView);
  headerView = self->_headerView;
  self->_headerView = v3;

  v5 = self->_headerView;
  -[HKDisplayType localization](self->_displayType, "localization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setTitle:](v5, "setTitle:", v7);

  v8 = self->_headerView;
  -[HKObjectDataAccessViewController _headerSubtitle](self, "_headerSubtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setSubtitle:](v8, "setSubtitle:", v9);

  -[HKTitledIconHeaderView setCentersSubtitle:](self->_headerView, "setCentersSubtitle:", 1);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 50.0);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType shareIcon](self->_displayType, "shareIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageByApplyingSymbolConfiguration:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKTitledIconHeaderView setIconImage:](self->_headerView, "setIconImage:", v11);
  v12 = self->_headerView;
  -[HKDisplayType displayCategory](self->_displayType, "displayCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setIconImageTint:](v12, "setIconImageTint:", v14);

  v15 = self->_headerView;
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  LODWORD(v17) = 1148846080;
  LODWORD(v19) = 1112014848;
  -[HKTitledIconHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v15, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v18, 0.0, v17, v19);

  -[HKTitledIconHeaderView bounds](self->_headerView, "bounds");
  -[HKTitledIconHeaderView setBounds:](self->_headerView, "setBounds:");
  v20 = self->_headerView;
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledIconHeaderView setLayoutMarginsWithTableView:](v20, "setLayoutMarginsWithTableView:", v21);

  v22 = self->_headerView;
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTableHeaderView:", v22);

}

- (id)bodyFont
{
  UIFont *bodyFont;
  UIFont *v4;
  UIFont *v5;

  bodyFont = self->_bodyFont;
  if (!bodyFont)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bodyFont;
    self->_bodyFont = v4;

    bodyFont = self->_bodyFont;
  }
  return bodyFont;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKObjectDataAccessViewController;
  -[HKTableViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);

  v4 = *MEMORY[0x1E0DC53D8];
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRowHeight:", v4);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_ACCESS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObjectDataAccessViewController setTitle:](self, "setTitle:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKObjectDataAccessViewController;
  -[HKObjectDataAccessViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HKObjectDataAccessViewController _refreshAppAuthorizationData](self, "_refreshAppAuthorizationData");
  -[HKObjectDataAccessViewController _setupHeaderViewSize](self, "_setupHeaderViewSize");
}

- (id)_headerSubtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  HKSample *sample;
  void *v9;
  void *v10;
  HKSample *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HKSample startDate](self->_sample, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v3, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSample sampleType](self->_sample, "sampleType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB6100]);

  if (v7)
  {
    sample = self->_sample;
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (void *)MEMORY[0x1E0CB34D0];
    v11 = sample;
    objc_msgSend(v10, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OBJECT_DESCRIPTION_%1$@_AND_DATE_%2$@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKVisionPrescriptionTypeDetailedLongLocalizedString(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringWithFormat:", v13, v14, v4);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v4;
  }

  return v15;
}

- (void)_refreshAppAuthorizationData
{
  HKAuthorizationStore *authorizationStore;
  HKSample *sample;
  _QWORD v4[5];

  authorizationStore = self->_authorizationStore;
  sample = self->_sample;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke;
  v4[3] = &unk_1E9C44E60;
  v4[4] = self;
  -[HKAuthorizationStore fetchAuthorizationStatusesForSample:completion:](authorizationStore, "fetchAuthorizationStatusesForSample:completion:", sample, v4);
}

void __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  _QWORD block[5];
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", v5, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "sourceRevision");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "sourceRevision");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "source");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "_isApplication"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "sourceRevision");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "source");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v13, "_requiresAuthorization");

        if (!v19)
        {
LABEL_11:
          objc_msgSend(v7, "allKeys");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_71);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_2;
          block[3] = &unk_1E9C3FB90;
          block[4] = *(_QWORD *)(a1 + 32);
          v21 = v7;
          v22 = v15;
          v16 = v15;
          v17 = v7;
          dispatch_async(MEMORY[0x1E0C80D38], block);

          goto LABEL_12;
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "sourceRevision");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E9CECF68, v9);
      }
      else
      {

      }
    }

    goto LABEL_11;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_cold_1();
LABEL_12:

}

uint64_t __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

void __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_2(id *a1)
{
  id v2;

  objc_storeStrong((id *)a1[4] + 131, a1[5]);
  objc_storeStrong((id *)a1[4] + 132, a1[6]);
  objc_msgSend(a1[4], "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = -[NSArray count](self->_orderedApps, "count", a3, a4);
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APPS_ALLOWED_TO_READ_DATA_HEADER"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedUppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPS_ALLOWED_TO_READ_DATA_FOOTER_%@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayType localization](self->_displayType, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "embeddedDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_loadIconForSource:(id)a3 onCell:(id)a4 ofTableView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  +[HKAppImageManager sharedImageManager](HKAppImageManager, "sharedImageManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke;
  v22[3] = &unk_1E9C44E88;
  v13 = v9;
  v23 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_2;
  v17[3] = &unk_1E9C44ED8;
  objc_copyWeak(&v21, &location);
  v14 = v8;
  v18 = v14;
  v15 = v13;
  v19 = v15;
  v16 = v10;
  v20 = v16;
  objc_msgSend(v11, "loadIconForSource:productType:syncHandler:asyncHandler:", v14, 0, v22, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

uint64_t __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImage:", a2);
}

void __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_2(id *a1, void *a2, void *a3)
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
  v9[2] = __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_3;
  v9[3] = &unk_1E9C44EB0;
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

void __74__HKObjectDataAccessViewController__loadIconForSource_onCell_ofTableView___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_handleReturnedImage:forSource:cell:tableView:fetchError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_handleReturnedImage:(id)a3 forSource:(id)a4 cell:(id)a5 tableView:(id)a6 fetchError:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v17 = a3;
  v12 = a5;
  if (v17 && !a7)
  {
    v13 = a4;
    objc_msgSend(a6, "indexPathForCell:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_orderedApps, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v13);

    if (v16)
      objc_msgSend(v12, "setIconImage:", v17);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[NSArray count](self->_orderedApps, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_orderedApps, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObjectDataAccessViewController _cellForSource:tableView:](self, "_cellForSource:tableView:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKObjectDataAccessViewController _noAppsCell](self, "_noAppsCell");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_noAppsCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", CFSTR("HKObjectDataAccessNoAppCell"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("HKObjectDataAccessNoAppCell"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NONE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  return v3;
}

- (id)_cellForSource:(id)a3 tableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKSwitchTableViewCell *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("HKObjectDataAccessCell"));
  v9 = (HKSwitchTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = -[HKSwitchTableViewCell initWithStyle:reuseIdentifier:]([HKSwitchTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("HKObjectDataAccessCell"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationByApp, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue") == 2;

  -[HKSwitchTableViewCell setDelegate:](v9, "setDelegate:", self);
  -[HKSwitchTableViewCell setCentersIcon:](v9, "setCentersIcon:", 1);
  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](v9, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSwitchTableViewCell textLabel](v9, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v14);

  -[HKSwitchTableViewCell setOn:](v9, "setOn:", v11);
  -[HKObjectDataAccessViewController _loadIconForSource:onCell:ofTableView:](self, "_loadIconForSource:onCell:ofTableView:", v7, v9, v6);

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIFont *bodyFont;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKObjectDataAccessViewController;
  -[HKObjectDataAccessViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKObjectDataAccessViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      bodyFont = self->_bodyFont;
      self->_bodyFont = 0;

    }
  }
  -[HKObjectDataAccessViewController _setupHeaderViewSize](self, "_setupHeaderViewSize");
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HKAuthorizationStore *authorizationStore;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25[2];
  BOOL v26;
  id location;
  void *v28;
  _QWORD v29[2];

  v4 = a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HKObjectDataAccessViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForCell:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_orderedApps, "objectAtIndexedSubscript:", objc_msgSend(v21, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_authorizationByApp, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v9, "integerValue");

  if (v4)
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_authorizationByApp, "setObject:forKeyedSubscript:", v11, v8);

  objc_initWeak(&location, self);
  authorizationStore = self->_authorizationStore;
  -[HKSample UUID](self->_sample, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample sampleType](self->_sample, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke;
  v22[3] = &unk_1E9C44F28;
  objc_copyWeak(v25, &location);
  v18 = v6;
  v23 = v18;
  v19 = v8;
  v24 = v19;
  v25[1] = v20;
  v26 = v4;
  -[HKAuthorizationStore setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:](authorizationStore, "setObjectAuthorizationStatuses:forObjectType:bundleIdentifier:sessionIdentifier:completion:", v15, v16, v17, 0, v22);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

}

void __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_cold_1();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_234;
    block[3] = &unk_1E9C44F00;
    block[4] = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v11 = v7;
    v12 = v8;
    v13 = *(_BYTE *)(a1 + 64);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_234(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));

  if (objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 48)))
    objc_msgSend(*(id *)(a1 + 40), "setOn:animated:", *(_BYTE *)(a1 + 64) == 0, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_orderedApps, 0);
  objc_storeStrong((id *)&self->_authorizationByApp, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __64__HKObjectDataAccessViewController__refreshAppAuthorizationData__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "Failed to retrieve authorization records for sample: %@ with error: %@");
}

void __65__HKObjectDataAccessViewController_switchCellValueChanged_value___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, v0, v1, "Failed to update authorization records for object: %@ with error: %@");
}

@end
