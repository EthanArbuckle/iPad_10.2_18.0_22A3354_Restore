@implementation HRAccountsTableViewController

- (HRAccountsTableViewController)init
{
  HRAccountsTableViewController *v2;
  void *v3;
  uint64_t v4;
  HRProfile *profile;
  id v6;
  void *v7;
  uint64_t v8;
  HKClinicalAccountStore *clinicalAccountStore;
  uint64_t v10;
  HRRecordViewControllerFactory *factory;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HRAccountsTableViewController;
  v2 = -[HRAccountsTableViewController initWithStyle:](&v13, sel_initWithStyle_, 2);
  if (v2)
  {
    +[HRProfileManager sharedInstance](HRProfileManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentProfile");
    v4 = objc_claimAutoreleasedReturnValue();
    profile = v2->_profile;
    v2->_profile = (HRProfile *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D2EE98]);
    -[HRProfile healthStore](v2->_profile, "healthStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithHealthStore:", v7);
    clinicalAccountStore = v2->_clinicalAccountStore;
    v2->_clinicalAccountStore = (HKClinicalAccountStore *)v8;

    +[HRViewControllerFactory shared](HRViewControllerFactory, "shared");
    v10 = objc_claimAutoreleasedReturnValue();
    factory = v2->_factory;
    v2->_factory = (HRRecordViewControllerFactory *)v10;

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HRContentStatusView *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HRAccountsTableViewController;
  -[HRAccountsTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  HRLocalizedString(CFSTR("HEALTH_RECORDS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAccountsTableViewController setTitle:](self, "setTitle:", v3);

  -[HRAccountsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setSectionCornerRadius:", 10.0);

  -[HRAccountsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[HRAccountTableViewCell reuseIdentifier](HRAccountTableViewCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

  v8 = objc_alloc_init(HRContentStatusView);
  -[HRAccountsTableViewController setLoadingView:](self, "setLoadingView:", v8);

  -[HRAccountsTableViewController _reloadAccounts](self, "_reloadAccounts");
  -[HRAccountsTableViewController clinicalAccountStore](self, "clinicalAccountStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAccountStateChangeListener:", self);

}

- (void)_reloadAccounts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HRAccountsTableViewController _showLoadingIndicator](self, "_showLoadingIndicator");
  -[HRAccountsTableViewController profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clinicalSourcesDataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HRAccountsTableViewController__reloadAccounts__block_invoke;
  v6[3] = &unk_1E74D1600;
  objc_copyWeak(&v7, &location);
  v5 = (id)objc_msgSend(v4, "fetchAccountsForDisplayWithCompletion:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__HRAccountsTableViewController__reloadAccounts__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setAccounts:", v3);

}

- (void)setAccounts:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_accounts, a3);
  -[HRAccountsTableViewController _hideLoadingIndicator](self, "_hideLoadingIndicator");
  -[HRAccountsTableViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)_showLoadingIndicator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HRAccountsTableViewController loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

  -[HRAccountsTableViewController loadingView](self, "loadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAccountsTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundView:", v4);

  -[HRAccountsTableViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEnabled:", 0);

}

- (void)_hideLoadingIndicator
{
  void *v3;
  void *v4;
  id v5;

  -[HRAccountsTableViewController loadingView](self, "loadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  -[HRAccountsTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundView:", 0);

  -[HRAccountsTableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollEnabled:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HRAccountsTableViewController accounts](self, "accounts", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  +[HRAccountTableViewCell reuseIdentifier](HRAccountTableViewCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRAccountsTableViewController accounts](self, "accounts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRAccountsTableViewController profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clinicalSourcesDataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithAccount:dataProvider:", v12, v14);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HRMedicalRecordTimelineViewController *v9;
  void *v10;
  void *v11;
  HRMedicalRecordTimelineViewController *v12;
  void *v13;
  id v14;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[HRAccountsTableViewController accounts](self, "accounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v9 = [HRMedicalRecordTimelineViewController alloc];
  -[HRAccountsTableViewController profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HRMedicalRecordTimelineViewController initWithProfile:accountId:](v9, "initWithProfile:accountId:", v10, v11);

  -[HRAccountsTableViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v12, 1);

}

- (void)clinicalAccountStore:(id)a3 accountDidChange:(id)a4 changeType:(int64_t)a5
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HRAccountsTableViewController_clinicalAccountStore_accountDidChange_changeType___block_invoke;
  block[3] = &unk_1E74D1218;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __82__HRAccountsTableViewController_clinicalAccountStore_accountDidChange_changeType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAccounts");
}

- (HRProfile)profile
{
  return self->_profile;
}

- (HKClinicalAccountStore)clinicalAccountStore
{
  return self->_clinicalAccountStore;
}

- (HRRecordViewControllerFactory)factory
{
  return self->_factory;
}

- (void)setFactory:(id)a3
{
  objc_storeStrong((id *)&self->_factory, a3);
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (HRContentStatusView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_clinicalAccountStore, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
