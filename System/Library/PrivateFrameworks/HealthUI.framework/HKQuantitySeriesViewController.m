@implementation HKQuantitySeriesViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKQuantitySeriesViewController;
  -[HKQuantitySeriesViewController viewDidLoad](&v11, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("QUANTITY_SERIES_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesViewController setTitle:](self, "setTitle:", v4);

  -[HKQuantitySeriesViewController editButtonItem](self, "editButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  objc_initWeak(&location, self);
  -[HKQuantitySeriesViewController dataProvider](self, "dataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E9C40600;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "queryForSubsamples:", v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E9C40600;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __45__HKQuantitySeriesViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "tableView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKQuantitySeriesViewController;
  -[HKQuantitySeriesViewController setEditing:animated:](&v9, sel_setEditing_animated_);
  if (!v5)
  {
    -[HKQuantitySeriesViewController dataProvider](self, "dataProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commitDeletionsIfNeeded");

  }
  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditing:animated:", v5, v4);

}

- (void)willMoveToParentViewController:(id)a3
{
  id v3;

  -[HKQuantitySeriesViewController dataProvider](self, "dataProvider", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commitDeletionsIfNeeded");

}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)HKQuantitySeriesViewController;
  -[HKQuantitySeriesViewController loadView](&v18, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKQuantitySeriesViewController setTableView:](self, "setTableView:", v4);

  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  +[HKQuantitySeriesTableViewCell reuseIdentifier](HKQuantitySeriesTableViewCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v7);

  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedRowHeight:", 44.0);

  v9 = *MEMORY[0x1E0DC53D8];
  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRowHeight:", v9);

  -[HKQuantitySeriesViewController dataProvider](self, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDataSource:", v11);

  -[HKQuantitySeriesViewController dataProvider](self, "dataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v13);

  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsMultipleSelection:", 1);

  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsSelection:", 0);

  -[HKQuantitySeriesViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySeriesViewController setView:](self, "setView:", v17);

}

- (HKQuantitySeriesDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
