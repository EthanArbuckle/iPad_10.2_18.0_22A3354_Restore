@implementation HSPCAssociatedTypeSelectionViewController

- (HSPCAssociatedTypeSelectionViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  HSPCAssociatedTypeSelectionViewController *v11;
  HSPCAssociatedTypeSelectionViewController *v12;
  id v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HMService *service;
  uint64_t v29;
  NSString *defaultAssociatedServiceType;
  void *v31;
  uint64_t v32;
  NSArray *possibleAssociatedServiceTypes;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  HMService *v43;
  HSPCAssociatedTypeSelectionViewController *v44;
  objc_super v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  HMService *v50;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = objc_msgSend(objc_alloc((Class)PRXScrollableContentView), "initWithCardStyle:scrollView:", 0, v9);
  v46.receiver = self;
  v46.super_class = (Class)HSPCAssociatedTypeSelectionViewController;
  v11 = -[HSPCAssociatedTypeSelectionViewController initWithContentView:](&v46, "initWithContentView:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    objc_msgSend(v9, "setDelegate:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(WeakRetained, "setDataSource:", v12);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v16 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v16, "setBackgroundColor:", v15);

    v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v17, "setRowHeight:", 44.0);

    +[HSPCRow leadingSeparatorMargin](HSPCRow, "leadingSeparatorMargin");
    v19 = v18;
    v20 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v20, "setSeparatorInset:", 0.0, v19, 0.0, 0.0);

    v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v21, "_setTopPadding:", 0.0);

    v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v22, "_setBottomPadding:", 0.0);

    v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(HSPCAssociatedServiceRow, v24), CFSTR("Cell"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController config](v12, "config"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "addedAccessory"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "hf_primaryService"));
    service = v12->_service;
    v12->_service = (HMService *)v27;

    v29 = objc_claimAutoreleasedReturnValue(-[HMService serviceType](v12->_service, "serviceType"));
    defaultAssociatedServiceType = v12->_defaultAssociatedServiceType;
    v12->_defaultAssociatedServiceType = (NSString *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[HMService serviceType](v12->_service, "serviceType"));
    v32 = objc_claimAutoreleasedReturnValue(+[HFAssociatedServiceTypeFactory associatedServiceTypesArrayFor:](HFAssociatedServiceTypeFactory, "associatedServiceTypesArrayFor:", v31));
    possibleAssociatedServiceTypes = v12->_possibleAssociatedServiceTypes;
    v12->_possibleAssociatedServiceTypes = (NSArray *)v32;

    v34 = HULocalizedString(CFSTR("HUProximityCardAssociatedTypeCardTitle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[HSPCAssociatedTypeSelectionViewController setTitle:](v12, "setTitle:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "accessoryCategoryOrPrimaryServiceType"));
    v38 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardAssociatedTypeCardSubtitle"), v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    -[HSPCAssociatedTypeSelectionViewController setSubtitle:](v12, "setSubtitle:", v39);

    v40 = -[HSPCAssociatedTypeSelectionViewController addProminentButtonWithTitleKey:target:futureSelector:](v12, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v12, "commitConfiguration");
    v41 = HFLogForCategory(58);
    v42 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v12->_service;
      *(_DWORD *)buf = 136315394;
      v48 = "-[HSPCAssociatedTypeSelectionViewController initWithCoordinator:config:]";
      v49 = 2112;
      v50 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s acting on %@", buf, 0x16u);
    }

    v44 = v12;
  }

  return v12;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForSelectedRow"));
  v5 = objc_msgSend(v4, "row");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController possibleAssociatedServiceTypes](self, "possibleAssociatedServiceTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8560));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController service](self, "service"));
  v10 = v9;
  if (v9)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100045E08;
    v26[3] = &unk_1000A19B8;
    v11 = v9;
    v27 = v11;
    v12 = v7;
    v28 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithErrorOnlyHandlerAdapterBlock:](NAFuture, "futureWithErrorOnlyHandlerAdapterBlock:", v26));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100045E18;
    v22[3] = &unk_1000A2AE0;
    v23 = v12;
    v24 = v11;
    v14 = v8;
    v25 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flatMap:", v22));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100045ED0;
    v20[3] = &unk_1000A10D0;
    v21 = v14;
    v16 = v14;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recover:", v20));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController config](self, "config"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "addedAccessory"));
    NSLog(CFSTR("Attempting to set an associated service on an accessory without any services that support that: %@"), v18);

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCAssociatedTypeSelectionViewController;
  -[HSPCAssociatedTypeSelectionViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HSPCAssociatedTypeSelectionViewController;
  -[HSPCAssociatedTypeSelectionViewController viewWillAppear:](&v19, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = 0;
  do
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController possibleAssociatedServiceTypes](self, "possibleAssociatedServiceTypes"));
    v8 = objc_msgSend(v7, "count");

    if (v6 >= (uint64_t)v8)
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController possibleAssociatedServiceTypes](self, "possibleAssociatedServiceTypes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v6));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController defaultAssociatedServiceType](self, "defaultAssociatedServiceType"));
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    v5 = v6 + 1;
  }
  while (!v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v14, "selectRowAtIndexPath:animated:scrollPosition:", v13, 1, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController tableView](self, "tableView"));
  objc_msgSend(v15, "layoutIfNeeded");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController contentView](self, "contentView"));
  objc_msgSend(v16, "setNeedsUpdateConstraints");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController view](self, "view"));
  objc_msgSend(v17, "bounds");
  -[HSPCAssociatedTypeSelectionViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v18);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v5));
  objc_msgSend(v6, "setAccessoryType:", 3);

  return v5;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v5));
  objc_msgSend(v6, "setAccessoryType:", 0);

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController possibleAssociatedServiceTypes](self, "possibleAssociatedServiceTypes", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
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

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCAssociatedTypeSelectionViewController possibleAssociatedServiceTypes](self, "possibleAssociatedServiceTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  objc_msgSend(v8, "updateUIWithServiceType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForSelectedRow"));

  LODWORD(v7) = objc_msgSend(v11, "isEqual:", v6);
  if ((_DWORD)v7)
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v8, "setAccessoryType:", v12);

  return v8;
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

- (HMService)service
{
  return self->_service;
}

- (NSString)defaultAssociatedServiceType
{
  return self->_defaultAssociatedServiceType;
}

- (NSArray)possibleAssociatedServiceTypes
{
  return self->_possibleAssociatedServiceTypes;
}

- (NSString)associatedServiceType
{
  return self->_associatedServiceType;
}

- (void)setAssociatedServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_associatedServiceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedServiceType, 0);
  objc_storeStrong((id *)&self->_possibleAssociatedServiceTypes, 0);
  objc_storeStrong((id *)&self->_defaultAssociatedServiceType, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
