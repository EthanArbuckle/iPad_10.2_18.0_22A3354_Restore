@implementation HSPCResumeSelectAccessoryViewController

- (HSPCResumeSelectAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  HSPCResumeSelectAccessoryViewController *v11;
  HSPCResumeSelectAccessoryViewController *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id WeakRetained;
  void *v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  PRXAction *continueAction;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSArray *v34;
  NSArray *accessoriesPendingConfiguration;
  uint64_t v36;
  NSMutableSet *selectedAccessories;
  _QWORD v39[4];
  id v40;
  objc_super v41;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = objc_msgSend(objc_alloc((Class)PRXScrollableContentView), "initWithCardStyle:scrollView:", 0, v9);
  v41.receiver = self;
  v41.super_class = (Class)HSPCResumeSelectAccessoryViewController;
  v11 = -[HSPCResumeSelectAccessoryViewController initWithContentView:](&v41, "initWithContentView:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v13 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryResumeSelectAccessoryVCTitle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[HSPCResumeSelectAccessoryViewController setTitle:](v12, "setTitle:", v14);

    v15 = objc_storeWeak((id *)&v12->_tableView, v9);
    objc_msgSend(v9, "setDelegate:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(WeakRetained, "setDataSource:", v12);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v18 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v18, "setBackgroundColor:", v17);

    v19 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v19, "setRowHeight:", 44.0);

    +[HSPCRow leadingSeparatorMargin](HSPCRow, "leadingSeparatorMargin");
    v21 = v20;
    v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v22, "setSeparatorInset:", 0.0, v21, 0.0, 0.0);

    v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v23, "_setTopPadding:", 0.0);

    v24 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v24, "_setBottomPadding:", 0.0);

    v25 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v25, "setAllowsMultipleSelection:", 1);

    v26 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v26, "registerClass:forCellReuseIdentifier:", objc_opt_class(HSPCAssociatedServiceRow, v27), CFSTR("Cell"));

    v28 = objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController addProminentButtonWithTitleKey:target:futureSelector:](v12, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v12, "commitConfiguration"));
    continueAction = v12->_continueAction;
    v12->_continueAction = (PRXAction *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v30));

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bridgedAccessories"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10003E06C;
    v39[3] = &unk_1000A2C70;
    v40 = v7;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "na_filter:", v39));
    objc_msgSend(v31, "addObjectsFromArray:", v33);

    v34 = (NSArray *)objc_msgSend(v31, "copy");
    accessoriesPendingConfiguration = v12->_accessoriesPendingConfiguration;
    v12->_accessoriesPendingConfiguration = v34;

    v36 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v12->_accessoriesPendingConfiguration));
    selectedAccessories = v12->_selectedAccessories;
    v12->_selectedAccessories = (NSMutableSet *)v36;

  }
  return v12;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", &stru_1000A2CB0));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003E1F4;
  v10[3] = &unk_1000A15F8;
  v11 = v3;
  v12 = v5;
  v6 = v5;
  v7 = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:](NAFuture, "futureWithBlock:", v10));

  return v8;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HSPCResumeSelectAccessoryViewController;
  -[HSPCResumeSelectAccessoryViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HSPCResumeSelectAccessoryViewController;
  -[HSPCResumeSelectAccessoryViewController viewWillAppear:](&v14, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController tableView](self, "tableView"));
  v6 = (uint64_t)objc_msgSend(v5, "numberOfRowsInSection:", 0);

  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController tableView](self, "tableView"));
      objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v8, 0, 0);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController tableView](self, "tableView"));
  objc_msgSend(v10, "layoutIfNeeded");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController contentView](self, "contentView"));
  objc_msgSend(v11, "setNeedsUpdateConstraints");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController view](self, "view"));
  objc_msgSend(v12, "bounds");
  -[HSPCResumeSelectAccessoryViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v13);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryView"));
  objc_msgSend(v8, "setHidden:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController accessoriesPendingConfiguration](self, "accessoriesPendingConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v9, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v13 = objc_msgSend(v12, "count") != 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController continueAction](self, "continueAction"));
  objc_msgSend(v14, "setEnabled:", v13);

  return v6;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryView"));
  objc_msgSend(v8, "setHidden:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController accessoriesPendingConfiguration](self, "accessoriesPendingConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v9, "removeObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v13 = objc_msgSend(v12, "count") != 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController continueAction](self, "continueAction"));
  objc_msgSend(v14, "setEnabled:", v13);

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController accessoriesPendingConfiguration](self, "accessoriesPendingConfiguration", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCResumeSelectAccessoryViewController accessoriesPendingConfiguration](self, "accessoriesPendingConfiguration"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  objc_msgSend(v7, "updateUIWithTuple:", v10);

  v11 = objc_alloc((Class)UIImageView);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle.fill")));
  v13 = objc_msgSend(v11, "initWithImage:", v12);
  objc_msgSend(v7, "setAccessoryView:", v13);

  return v7;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
  objc_storeStrong((id *)&self->_continueAction, a3);
}

- (NSArray)accessoriesPendingConfiguration
{
  return self->_accessoriesPendingConfiguration;
}

- (void)setAccessoriesPendingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesPendingConfiguration, a3);
}

- (NSMutableSet)selectedAccessories
{
  return self->_selectedAccessories;
}

- (void)setSelectedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAccessories, 0);
  objc_storeStrong((id *)&self->_accessoriesPendingConfiguration, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
