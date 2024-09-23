@implementation HUDataAnalyticsLogListViewController

- (HUDataAnalyticsLogListViewController)initWithMediaProfileContainer:(id)a3
{
  id v5;
  void *v6;
  HUDataAnalyticsLogListViewController *v7;
  HUDataAnalyticsLogListViewController *v8;
  HUDataAnalyticsModuleController *v9;
  void *v10;
  uint64_t v11;
  HUDataAnalyticsModuleController *analyticsModuleController;
  void *v13;
  objc_super v15;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31348]), "initWithMediaProfileContainer:delegate:", v5, self);
  v15.receiver = self;
  v15.super_class = (Class)HUDataAnalyticsLogListViewController;
  v7 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v6, 1);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);
    v9 = [HUDataAnalyticsModuleController alloc];
    objc_msgSend(v6, "dataAnalyticsModule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HUDataAnalyticsModuleController initWithModule:](v9, "initWithModule:", v10);
    analyticsModuleController = v8->_analyticsModuleController;
    v8->_analyticsModuleController = (HUDataAnalyticsModuleController *)v11;

    -[HUDataAnalyticsModuleController setDataAnalyticsModuleControllerDelegate:](v8->_analyticsModuleController, "setDataAnalyticsModuleControllerDelegate:", v8);
    HFLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUDataAnalyticsLogListViewController setTitle:](v8, "setTitle:", v13);

  }
  return v8;
}

- (HUDataAnalyticsLogListViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDataAnalyticsLogListViewController.m"), 58, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDataAnalyticsLogListViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUDataAnalyticsLogListViewController)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUDataAnalyticsLogListViewController.m"), 63, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUDataAnalyticsLogListViewController init]",
    v5);

  return 0;
}

- (void)viewDidLoad
{
  HUActivityLoadingView *v3;
  HUActivityLoadingView *v4;
  HUActivityLoadingView *activityLoadingView;
  void *v6;
  void *v7;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)HUDataAnalyticsLogListViewController;
  -[HUItemTableViewController viewDidLoad](&v48, sel_viewDidLoad);
  v3 = [HUActivityLoadingView alloc];
  v4 = -[HUActivityLoadingView initWithFrame:activityIndicatorStyle:](v3, "initWithFrame:activityIndicatorStyle:", 100, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  activityLoadingView = self->_activityLoadingView;
  self->_activityLoadingView = v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUDataAnalyticsDownloadingText"), CFSTR("HUDataAnalyticsDownloadingText"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUActivityLoadingView textLabel](self->_activityLoadingView, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  -[HUActivityLoadingView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityLoadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HUActivityLoadingView sizeToFit](self->_activityLoadingView, "sizeToFit");
  v8 = (void *)objc_opt_new();
  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundView:", v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v10);

  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  v16 = (void *)objc_opt_new();
  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addLayoutGuide:", v16);

  objc_msgSend(v16, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "heightAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:multiplier:", v20, 0.3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  objc_msgSend(v16, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "backgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "centerYAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setActive:", 1);

  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "layoutMarginsGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintGreaterThanOrEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUDataAnalyticsLogListViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutMarginsGuide");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintLessThanOrEqualToAnchor:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUDataAnalyticsLogListViewController;
  -[HUItemTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HUDataAnalyticsLogListViewController _watchForReload](self, "_watchForReload");
}

- (BOOL)bypassInitialItemUpdateReload
{
  return 1;
}

- (id)itemModuleControllers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUDataAnalyticsLogListViewController analyticsModuleController](self, "analyticsModuleController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)dataAnalyticsModuleController:(id)a3 didSelectItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HUTextViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUDataAnalyticsLogListViewControllerLoadingFormatString"), CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fetchLog");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HUTextViewController initWithTextTitle:]([HUTextViewController alloc], "initWithTextTitle:", v17);
  -[HUTextViewController setShowsShareButton:](v19, "setShowsShareButton:", 1);
  objc_msgSend(v7, "latestResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUTextViewController setTitle:](v19, "setTitle:", v21);

  -[HUTextViewController loadTextFromFuture:textTitle:](v19, "loadTextFromFuture:textTitle:", v18, v17);
  -[HUDataAnalyticsLogListViewController navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pushViewController:animated:", v19, 1);

  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke;
  v26[3] = &unk_1E6F54258;
  objc_copyWeak(&v29, &location);
  v23 = v6;
  v27 = v23;
  v24 = v7;
  v28 = v24;
  v25 = (id)objc_msgSend(v18, "addFailureBlock:", v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_2;
  v5[3] = &unk_1E6F54230;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  v7 = a1[4];
  v8 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0D309F8];
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_3;
  v8[3] = &unk_1E6F4C7A8;
  objc_copyWeak(&v11, (id *)(a1 + 56));
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_4;
  v6[3] = &unk_1E6F4DD08;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v2, "handleError:operationType:options:retryBlock:cancelBlock:", v3, v4, 0, v8, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v11);
}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "dataAnalyticsModuleController:didSelectItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __84__HUDataAnalyticsLogListViewController_dataAnalyticsModuleController_didSelectItem___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popToViewController:animated:", WeakRetained, 1);

}

- (void)_kickoffReload
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D314C0];
  v6 = (void *)MEMORY[0x1E0C99E60];
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v9, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "performItemUpdateRequest:", v10);

  -[HUDataAnalyticsLogListViewController _watchForReload](self, "_watchForReload");
}

- (void)_watchForReload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[HUDataAnalyticsLogListViewController activityLoadingView](self, "activityLoadingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityIndicatorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

  objc_initWeak(&location, self);
  -[HUDataAnalyticsLogListViewController analyticsModuleController](self, "analyticsModuleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "module");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "logItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logFetchFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke;
  v11[3] = &unk_1E6F54280;
  objc_copyWeak(&v12, &location);
  v10 = (id)objc_msgSend(v9, "addCompletionBlock:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activityLoadingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 1);

  objc_msgSend(WeakRetained, "activityLoadingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activityIndicatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopAnimating");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D30A00];
    v14 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_2;
    v17[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v18, v7);
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_3;
    v15[3] = &unk_1E6F4DD08;
    objc_copyWeak(&v16, v7);
    objc_msgSend(v12, "handleError:operationType:options:retryBlock:cancelBlock:", v6, v13, 0, v17, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
  }

}

void __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_kickoffReload");

}

void __55__HUDataAnalyticsLogListViewController__watchForReload__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUActivityLoadingView)activityLoadingView
{
  return self->_activityLoadingView;
}

- (HUDataAnalyticsModuleController)analyticsModuleController
{
  return self->_analyticsModuleController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsModuleController, 0);
  objc_storeStrong((id *)&self->_activityLoadingView, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

- (HUDataAnalyticsLogListViewController)initWithAccessoryGroupItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  HUDataAnalyticsLogListViewController *v15;
  uint8_t buf[16];

  objc_msgSend(a3, "homeKitSettingsVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &unk_1EF347468;
  v7 = v5;
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  if (objc_msgSend(v7, "conformsToProtocol:", v6))
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromProtocol((Protocol *)v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 71, CFSTR("Expected protocol %@"), v13);

LABEL_7:
    v10 = 0;
  }

  if (!v10)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "-[HUDataAnalyticsLogListViewController initWithAccessoryGroupItem:] called without a HFMediaProfileContainer", buf, 2u);
    }

  }
  v15 = -[HUDataAnalyticsLogListViewController initWithMediaProfileContainer:](self, "initWithMediaProfileContainer:", v10);

  return v15;
}

@end
