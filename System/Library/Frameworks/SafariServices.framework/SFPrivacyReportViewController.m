@implementation SFPrivacyReportViewController

- (SFPrivacyReportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SFPrivacyReportViewController *v4;
  SFPrivacyReportViewController *v5;
  SFPrivacyReportViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFPrivacyReportViewController;
  v4 = -[SFPrivacyReportViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SFPrivacyReportViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 540.0, 564.0);
    v6 = v5;
  }

  return v5;
}

- (SFPrivacyReportViewController)initWithDomain:(id)a3
{
  id v4;
  SFPrivacyReportViewController *v5;
  uint64_t v6;
  NSString *domain;
  void *v8;
  id v9;
  SFPrivacyReportViewController *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SFPrivacyReportViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[SFPrivacyReportViewController registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v8, v5, sel_setNeedsUpdateRowHeight);

    v10 = v5;
  }

  return v5;
}

- (SFPrivacyReportViewController)initWithWebView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SFPrivacyReportViewController *v9;
  SFPrivacyReportViewController *v10;

  v5 = a3;
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_highLevelDomainFromHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SFPrivacyReportViewController initWithDomain:](self, "initWithDomain:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    v10 = v9;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  WBSPrivacyReportData *v8;
  WBSPrivacyReportData *privacyReportData;
  WBSPrivacyReportData *v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFPrivacyReportViewController;
  -[SFPrivacyReportViewController viewDidLoad](&v12, sel_viewDidLoad);
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportViewController setTitle:](self, "setTitle:", v3);

  -[SFPrivacyReportViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sf_preferredDismissOrDoneButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v7 = (void *)objc_msgSend(v6, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_popoverDoneButtonItem"), self, sel__doneBarButtonItemAction_);
    objc_msgSend(v4, "sf_setPreferredDismissOrDoneButtonItem:", v7);

  }
  -[SFPrivacyReportViewController _updateUsesInsetStyle](self, "_updateUsesInsetStyle");
  -[SFPrivacyReportViewController _createTableViewIfNeededLoadingReport:](self, "_createTableViewIfNeededLoadingReport:", 1);
  v8 = (WBSPrivacyReportData *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AB00]), "initWithProfileIdentifiers:histories:", self->_profileIdentifiers, self->_histories);
  privacyReportData = self->_privacyReportData;
  self->_privacyReportData = v8;

  -[WBSPrivacyReportData setWebView:](self->_privacyReportData, "setWebView:", self->_webView);
  v10 = self->_privacyReportData;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__SFPrivacyReportViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E4ABFE00;
  v11[4] = self;
  -[WBSPrivacyReportData loadDataWithCompletionHandler:](v10, "loadDataWithCompletionHandler:", v11);

}

void __44__SFPrivacyReportViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFPrivacyReportViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E4ABFE00;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __44__SFPrivacyReportViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDataLoadingReport:", 0);
}

- (void)_createTableViewIfNeededLoadingReport:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  UITableView *tableView;
  void *v7;
  id v8;
  UITableView *v9;
  UITableView *v10;
  id v11;
  id v12;
  UITableView *v13;
  SFTableViewDiffableDataSource *v14;
  SFTableViewDiffableDataSource *diffableDataSource;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t, uint64_t, void *, void *);
  void *v19;
  id v20;
  id location;

  v3 = a3;
  if (self->_usesInsetStyle)
    v5 = 2;
  else
    v5 = 1;
  tableView = self->_tableView;
  if (tableView && -[UITableView style](tableView, "style") == v5)
  {
    -[SFPrivacyReportViewController _updateLayoutMargins](self, "_updateLayoutMargins");
  }
  else
  {
    objc_initWeak(&location, self);
    -[UITableView removeFromSuperview](self->_tableView, "removeFromSuperview");
    -[SFPrivacyReportViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0DC3D48]);
    objc_msgSend(v7, "bounds");
    v9 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", v5);
    v10 = self->_tableView;
    self->_tableView = v9;

    v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v11);

    -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
    objc_msgSend(v7, "addSubview:", self->_tableView);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("trackingProtectionExplanationCell"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("noReportAvailableCell"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("gridViewCellIdentifier"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("detailTypeToggleCell"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("websiteCell"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("trackerCell"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("subheaderCell"));
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("privacyProxyTipCell"));
    -[SFPrivacyReportViewController _updateLayoutMargins](self, "_updateLayoutMargins");
    v12 = objc_alloc(MEMORY[0x1E0D4EE40]);
    v13 = self->_tableView;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __71__SFPrivacyReportViewController__createTableViewIfNeededLoadingReport___block_invoke;
    v19 = &unk_1E4ABFE28;
    objc_copyWeak(&v20, &location);
    v14 = (SFTableViewDiffableDataSource *)objc_msgSend(v12, "initWithTableView:cellProvider:", v13, &v16);
    diffableDataSource = self->_diffableDataSource;
    self->_diffableDataSource = v14;

    -[SFTableViewDiffableDataSource setDefaultRowAnimation:](self->_diffableDataSource, "setDefaultRowAnimation:", 0, v16, v17, v18, v19);
    -[SFTableViewDiffableDataSource setDelegate:](self->_diffableDataSource, "setDelegate:", self);
    -[SFPrivacyReportViewController _reloadDataLoadingReport:](self, "_reloadDataLoadingReport:", v3);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
}

id __71__SFPrivacyReportViewController__createTableViewIfNeededLoadingReport___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_cellForRowWithIndexPath:itemIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateUsesInsetStyle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;

  -[SFPrivacyReportViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SFPrivacyReportViewController preferredContentSize](self, "preferredContentSize");
  v9 = v5 >= v8;
  if (v7 < v10)
    v9 = 0;
  self->_usesInsetStyle = v9;
}

- (void)_updateLayoutMargins
{
  double v3;
  id v4;

  if (self->_usesInsetStyle)
    v3 = 48.0;
  else
    v3 = 16.0;
  -[UITableView tableHeaderView](self->_tableView, "tableHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v4);
  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 35.0, v3, 40.0, v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__SFPrivacyReportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E4ABFE50;
  v4[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

uint64_t __84__SFPrivacyReportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateUsesInsetStyle");
  objc_msgSend(*(id *)(a1 + 32), "_createTableViewIfNeededLoadingReport:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "reloadData");
}

- (void)_reloadDataLoadingReport:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  SFPrivacyReportItem *v7;
  void *v8;
  SFPrivacyReportItem **v9;
  SFPrivacyReportItem *v10;
  void *v11;
  SFPrivacyReportItem *v12;
  void *v13;
  SFPrivacyReportItem *v14;
  void *v15;
  SFPrivacyReportItem *v16;
  void *v17;
  int64_t listDetailType;
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
  uint64_t v30;
  uint64_t v31;
  SFPrivacyReportItem *v32;
  SFPrivacyReportItem *v33;
  SFPrivacyReportItem *v34;
  void *v35;
  SFPrivacyReportItem *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[2];
  SFPrivacyReportItem *v44;
  SFPrivacyReportItem *v45;
  SFPrivacyReportItem *v46;
  SFPrivacyReportItem *v47;
  SFPrivacyReportItem *v48;
  _QWORD v49[2];

  v3 = a3;
  v49[1] = *MEMORY[0x1E0C80C00];
  self->_showingCurrentWebsite = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v6 = v5;
  if (!v3)
  {
    if ((-[WBSPrivacyReportData hasData](self->_privacyReportData, "hasData") & 1) == 0)
    {
      objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E4B26998);
      v7 = -[SFPrivacyReportItem initWithType:]([SFPrivacyReportItem alloc], "initWithType:", 1);
      v48 = v7;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = &v48;
      goto LABEL_10;
    }
    objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E4B269B0);
    v10 = -[SFPrivacyReportItem initWithType:]([SFPrivacyReportItem alloc], "initWithType:", 2);
    v47 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItemsWithIdentifiers:", v11);

    if (self->_showExplanationDetailView)
    {
      v12 = -[SFPrivacyReportItem initWithType:]([SFPrivacyReportItem alloc], "initWithType:", 3);
      v46 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendItemsWithIdentifiers:", v13);

    }
    objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E4B269C8);
    v14 = -[SFPrivacyReportItem initWithType:]([SFPrivacyReportItem alloc], "initWithType:", 4);
    v45 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItemsWithIdentifiers:", v15);

    objc_msgSend(v6, "appendSectionsWithIdentifiers:", &unk_1E4B269E0);
    v16 = -[SFPrivacyReportItem initWithType:]([SFPrivacyReportItem alloc], "initWithType:", 5);
    v44 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItemsWithIdentifiers:", v17);

    listDetailType = self->_listDetailType;
    if (listDetailType)
    {
      if (listDetailType != 1)
      {
LABEL_16:
        self->_maxCountForDetailList = fmax(self->_maxCountForDetailList, 10.0);
        goto LABEL_17;
      }
      -[WBSPrivacyReportData knownTrackers](self->_privacyReportData, "knownTrackers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstParties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      self->_maxCountForDetailList = (double)(unint64_t)objc_msgSend(v21, "count");

      -[WBSPrivacyReportData knownTrackers](self->_privacyReportData, "knownTrackers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = &__block_literal_global_1;
    }
    else
    {
      -[WBSPrivacyReportData trackedFirstParties](self->_privacyReportData, "trackedFirstParties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trackers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      self->_maxCountForDetailList = (double)(unint64_t)objc_msgSend(v28, "count");

      -[WBSPrivacyReportData trackedFirstParties](self->_privacyReportData, "trackedFirstParties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v29;
      if (self->_domain)
      {
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke_2;
        v42[3] = &unk_1E4ABFEB8;
        v42[4] = self;
        v30 = objc_msgSend(v29, "indexOfObjectPassingTest:", v42);
        if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = v30;
          self->_showingCurrentWebsite = 1;
          v32 = [SFPrivacyReportItem alloc];
          objc_msgSend(v23, "objectAtIndexedSubscript:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[SFPrivacyReportItem initWithType:userInfo:](v32, "initWithType:userInfo:", 6, v41);
          v43[0] = v33;
          v34 = [SFPrivacyReportItem alloc];
          _WBSLocalizedString();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[SFPrivacyReportItem initWithType:userInfo:](v34, "initWithType:userInfo:", 8, v35);
          v43[1] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendItemsWithIdentifiers:", v37);

          v38 = (void *)objc_msgSend(v23, "mutableCopy");
          objc_msgSend(v38, "removeObjectAtIndex:", v31);
          v39 = objc_msgSend(v38, "copy");

          v23 = (void *)v39;
        }
      }
      v24 = &__block_literal_global_66;
      v22 = v23;
    }
    objc_msgSend(v22, "safari_mapObjectsUsingBlock:", v24);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendItemsWithIdentifiers:", v40);

    goto LABEL_16;
  }
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E4B26980);
  v7 = -[SFPrivacyReportItem initWithType:]([SFPrivacyReportItem alloc], "initWithType:", 0);
  v49[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = (SFPrivacyReportItem **)v49;
LABEL_10:
  objc_msgSend(v8, "arrayWithObjects:count:", v9, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendItemsWithIdentifiers:", v25);

LABEL_17:
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v6, !v3);

}

SFPrivacyReportItem *__58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SFPrivacyReportItem *v3;

  v2 = a2;
  v3 = -[SFPrivacyReportItem initWithType:userInfo:]([SFPrivacyReportItem alloc], "initWithType:userInfo:", 7, v2);

  return v3;
}

uint64_t __58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));

  return v4;
}

SFPrivacyReportItem *__58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SFPrivacyReportItem *v3;

  v2 = a2;
  v3 = -[SFPrivacyReportItem initWithType:userInfo:]([SFPrivacyReportItem alloc], "initWithType:userInfo:", 6, v2);

  return v3;
}

- (void)_doneBarButtonItemAction:(id)a3
{
  -[SFPrivacyReportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int64_t)_sectionTypeFromSectionIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (id)_cellForRowWithIndexPath:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
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
  char isKindOfClass;
  SFPrivacyReportExplanationDetailView *v19;
  void *v20;
  char v21;
  SFPrivacyReportExplanationDetailView *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  switch(objc_msgSend(v7, "type"))
  {
    case 0:
      -[UITableView dequeueReusableCellWithIdentifier:](self->_tableView, "dequeueReusableCellWithIdentifier:", CFSTR("loadingReportCell"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("loadingReportCell"));
        objc_msgSend(v8, "setBackgroundView:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v9);

        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
        objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(v8, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v10);
        v27 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(v10, "centerXAnchor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "centerXAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "constraintEqualToAnchor:", v30);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v29;
        objc_msgSend(v10, "centerYAnchor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "centerYAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintEqualToAnchor:", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v12;
        objc_msgSend(v11, "heightAnchor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "heightAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "constraintEqualToAnchor:multiplier:constant:", v14, 1.0, 20.0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activateConstraints:", v16);

        objc_msgSend(v10, "startAnimating");
        goto LABEL_7;
      }
      break;
    case 1:
      -[UITableView dequeueReusableCellWithIdentifier:](self->_tableView, "dequeueReusableCellWithIdentifier:", CFSTR("noReportAvailableCell"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", 0);
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v11);
LABEL_7:

      goto LABEL_20;
    case 2:
      -[UITableView dequeueReusableCellWithIdentifier:](self->_tableView, "dequeueReusableCellWithIdentifier:", CFSTR("trackingProtectionExplanationCell"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setExpanded:", self->_showExplanationDetailView);
      break;
    case 3:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("gridViewCellIdentifier"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "gridView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        goto LABEL_14;
      v19 = objc_alloc_init(SFPrivacyReportExplanationDetailView);
      goto LABEL_13;
    case 4:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("gridViewCellIdentifier"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "gridView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v21 = objc_opt_isKindOfClass();

      if ((v21 & 1) != 0)
        goto LABEL_14;
      v19 = (SFPrivacyReportExplanationDetailView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4ED00]), "initWithPrivacyReportDataProvider:", self->_privacyReportData);
LABEL_13:
      v22 = v19;
      -[SFPrivacyReportGridView setDelegate:](v19, "setDelegate:", self);
      objc_msgSend(v8, "setGridView:", v22);

LABEL_14:
      objc_msgSend(v8, "gridView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setUsesInsetStyle:", self->_usesInsetStyle);

      break;
    case 5:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("detailTypeToggleCell"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDetailType:", self->_listDetailType);
      objc_msgSend(v8, "setDelegate:", self);
      objc_msgSend(v8, "setUseCurrentWebsiteHeader:", self->_showingCurrentWebsite);
      break;
    case 6:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("websiteCell"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWebsite:", v24);
      goto LABEL_18;
    case 7:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("trackerCell"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTracker:", v24);
LABEL_18:

      objc_msgSend(v8, "setMaxCount:", self->_maxCountForDetailList);
      break;
    case 8:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("subheaderCell"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSubheaderText:", v10);
LABEL_20:

      break;
    case 9:
    case 10:
    case 11:
    case 12:
      -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("privacyProxyTipCell"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUsesInsetStyle:", self->_usesInsetStyle);
      objc_msgSend(v8, "setDelegate:", self);
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (BOOL)_privacyProxyTip:(int64_t *)a3
{
  void *v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int64_t v9;
  void *v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isPrivacyProxyActive"))
    goto LABEL_3;
  v5 = objc_msgSend(v4, "state");
  v6 = objc_msgSend(v4, "isUserAccountInSubscriberTierForPrivacyProxy");
  if (v5 == 2)
    goto LABEL_3;
  if (v6)
  {
    if (v5 == 1)
    {
      v9 = 12;
      goto LABEL_15;
    }
    if (!v5)
    {
      v9 = 11;
LABEL_15:
      *a3 = v9;
      v7 = 1;
      goto LABEL_4;
    }
  }
  else
  {
    if (v5 != 1)
    {
      v9 = 9;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("PrivacyReportPrivacyProxyDismissed"));

    if ((v11 & 1) == 0 && (objc_msgSend(v4, "isPrivacyProxyPaidTierUnavailableInUserCountry") & 1) == 0)
    {
      v9 = 10;
      goto LABEL_15;
    }
  }
LABEL_3:
  v7 = 0;
LABEL_4:

  return v7;
}

- (void)cellDidToggleDetailType:(id)a3
{
  self->_listDetailType = objc_msgSend(a3, "detailType");
  -[SFPrivacyReportViewController _reloadDataLoadingReport:](self, "_reloadDataLoadingReport:", 0);
}

- (void)cellDidToggleExpandDetailedExplanation:(id)a3
{
  self->_showExplanationDetailView = objc_msgSend(a3, "isExpanded");
  -[SFPrivacyReportViewController _reloadDataLoadingReport:](self, "_reloadDataLoadingReport:", 0);
}

- (void)cellPrivacyProxyUpsellDismissed:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("PrivacyReportPrivacyProxyDismissed"));

  -[SFPrivacyReportViewController _reloadDataLoadingReport:](self, "_reloadDataLoadingReport:", 0);
}

- (void)cellPrivacyProxyStateChanged:(id)a3
{
  -[SFPrivacyReportViewController _reloadDataLoadingReport:](self, "_reloadDataLoadingReport:", 0);
}

- (void)setNeedsUpdateRowHeight
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_needsRowHeightUpdate)
  {
    objc_initWeak(&location, self);
    self->_needsRowHeightUpdate = 1;
    v3 = dispatch_time(0, 0);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __56__SFPrivacyReportViewController_setNeedsUpdateRowHeight__block_invoke;
    v4[3] = &unk_1E4ABFF20;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E0C80D38], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __56__SFPrivacyReportViewController_setNeedsUpdateRowHeight__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[121], "beginUpdates");
    objc_msgSend(v2[121], "endUpdates");
    WeakRetained = v2;
    *((_BYTE *)v2 + 1000) = 0;
  }

}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  if (-[SFPrivacyReportViewController _sectionTypeFromSectionIndex:](self, "_sectionTypeFromSectionIndex:", a4) == 3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, 30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  int64_t v4;

  v4 = -[SFPrivacyReportViewController _sectionTypeFromSectionIndex:](self, "_sectionTypeFromSectionIndex:", a4);
  return v4 == 1 || v4 == 4;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  int64_t v4;

  v4 = -[SFPrivacyReportViewController _sectionTypeFromSectionIndex:](self, "_sectionTypeFromSectionIndex:", a4);
  return v4 == 1 || v4 == 4;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  return (v5 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  SFPrivacyReportTrackerDetailViewController *v8;
  void *v9;
  SFPrivacyReportWebsiteDetailViewController *v10;
  SFPrivacyReportWebsiteDetailViewController *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v14, "type");
  if (v7 == 6)
  {
    v11 = [SFPrivacyReportWebsiteDetailViewController alloc];
    objc_msgSend(v14, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFPrivacyReportWebsiteDetailViewController initWithWebsite:](v11, "initWithWebsite:", v12);

    -[SFPrivacyReportWebsiteDetailViewController setSeparatesBlockedTrackers:](v10, "setSeparatesBlockedTrackers:", self->_websiteDetailShouldSeparateBlockedTrackers);
    goto LABEL_5;
  }
  if (v7 == 7)
  {
    v8 = [SFPrivacyReportTrackerDetailViewController alloc];
    objc_msgSend(v14, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFPrivacyReportTrackerDetailViewController initWithTracker:](v8, "initWithTracker:", v9);

LABEL_5:
    -[SFPrivacyReportViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v10, 1);

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  double Height;
  double v11;
  CGRect v13;
  CGRect v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = a4;
  objc_msgSend(v6, "indexPathForRow:inSection:", 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    objc_msgSend(v5, "frame");
    Height = CGRectGetHeight(v13);
    objc_msgSend(v5, "frame");
    v11 = fmax(Height, CGRectGetWidth(v14));
  }
  else
  {
    v11 = *MEMORY[0x1E0DC53D8];
  }

  return v11;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)websiteDetailShouldSeparateBlockedTrackers
{
  return self->_websiteDetailShouldSeparateBlockedTrackers;
}

- (void)setWebsiteDetailShouldSeparateBlockedTrackers:(BOOL)a3
{
  self->_websiteDetailShouldSeparateBlockedTrackers = a3;
}

- (NSSet)histories
{
  return self->_histories;
}

- (void)setHistories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (void)setProfileIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
  objc_storeStrong((id *)&self->_histories, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_privacyReportData, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
