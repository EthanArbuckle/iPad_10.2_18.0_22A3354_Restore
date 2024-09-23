@implementation HSPCNameServicesViewController

- (id)readCharacteristics:(id)a3 inServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004DAE4;
    v15[3] = &unk_1000A31E8;
    v16 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_flatMap:", v15));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController config](self, "config"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_characteristicValueManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readValuesForCharacteristics:", v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", &stru_1000A3228));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }

  return v13;
}

- (HSPCNameServicesViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  HSPCNameServicesViewController *v11;
  HSPCNameServicesViewController *v12;
  id v13;
  id WeakRetained;
  id v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  objc_super v47;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = objc_msgSend(objc_alloc((Class)PRXScrollableContentView), "initWithCardStyle:scrollView:", 0, v9);
  v47.receiver = self;
  v47.super_class = (Class)HSPCNameServicesViewController;
  v11 = -[HSPCNameServicesViewController initWithContentView:](&v47, "initWithContentView:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    objc_msgSend(v9, "setDelegate:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(WeakRetained, "setDataSource:", v12);

    v15 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v15, "setAllowsMultipleSelection:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v17, "setBackgroundColor:", v16);

    +[HSPCRow leadingSeparatorMargin](HSPCRow, "leadingSeparatorMargin");
    v19 = v18;
    v20 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v20, "setSeparatorInset:", 0.0, v19, 0.0, 0.0);

    v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v21, "_setTopPadding:", 0.0);

    v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v22, "_setBottomPadding:", 0.0);

    v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    v25 = objc_opt_class(HSPCNameServiceRow, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameServiceRow _reuseIdentifier](HSPCNameServiceRow, "_reuseIdentifier"));
    objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", v25, v26);

    v27 = objc_loadWeakRetained((id *)&v12->_tableView);
    v29 = objc_opt_class(HSPCNameServiceNoIconRow, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameServiceNoIconRow _reuseIdentifier](HSPCNameServiceNoIconRow, "_reuseIdentifier"));
    objc_msgSend(v27, "registerClass:forCellReuseIdentifier:", v29, v30);

    v31 = objc_loadWeakRetained((id *)&v12->_tableView);
    v33 = objc_opt_class(HSPCNameToggleServiceRow, v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameToggleServiceRow _reuseIdentifier](HSPCNameToggleServiceRow, "_reuseIdentifier"));
    objc_msgSend(v31, "registerClass:forCellReuseIdentifier:", v33, v34);

    v35 = objc_loadWeakRetained((id *)&v12->_tableView);
    v37 = objc_opt_class(HSPCNameIdentifyServiceRow, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[HSPCNameIdentifyServiceRow _reuseIdentifier](HSPCNameIdentifyServiceRow, "_reuseIdentifier"));
    objc_msgSend(v35, "registerClass:forCellReuseIdentifier:", v37, v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeTuple"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "accessoryCategoryOrPrimaryServiceType"));
    v41 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardNameServicesCardTitle"), v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    -[HSPCNameServicesViewController setTitle:](v12, "setTitle:", v42);

    v43 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryNameServicesSubtitle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    -[HSPCNameServicesViewController setSubtitle:](v12, "setSubtitle:", v44);

    v45 = -[HSPCNameServicesViewController addProminentButtonWithTitleKey:target:futureSelector:](v12, "addProminentButtonWithTitleKey:target:futureSelector:", CFSTR("HUContinueTitle"), v12, "commitConfiguration");
  }

  return v12;
}

- (id)hu_preloadContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController characteristicTypesToPreload](self, "characteristicTypesToPreload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController servicesToPreload](self, "servicesToPreload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController readCharacteristics:inServices:](self, "readCharacteristics:inServices:", v3, v4));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E038;
  v8[3] = &unk_1000A3250;
  objc_copyWeak(&v9, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v8));
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController view](self, "view"));
  objc_msgSend(v3, "endEditing:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  v6 = objc_msgSend(v5, "count");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
  v8 = objc_msgSend(v7, "count");

  if (v6 == v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController enabledServices](self, "enabledServices"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "na_setByRemovingObjectsFromSet:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController config](self, "config"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "validateNames:", v13));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10004E4B0;
    v33[3] = &unk_1000A1E80;
    v33[4] = self;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", v33));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004E520;
    v31[3] = &unk_1000A1E80;
    v32 = v11;
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "flatMap:", v31));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004E534;
    v30[3] = &unk_1000A1E80;
    v30[4] = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flatMap:", v30));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "hs_commitConfigurationFutureWithContextMessage:", CFSTR("Service updates")));

  }
  else
  {
    v20 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryNameServicesDuplicateNameErrorTitle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = HULocalizedString(CFSTR("HUProximityCardSetupAccessoryNameServicesDuplicateNameErrorMessage"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v21, v23, 1));

    v25 = HULocalizedString(CFSTR("HUOkTitle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v26, 0, 0));
    objc_msgSend(v24, "addAction:", v27);

    -[HSPCNameServicesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8B00));

  }
  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCNameServicesViewController;
  -[HSPCNameServicesViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  signed int v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HSPCNameServicesViewController;
  -[HSPCNameServicesViewController viewDidAppear:](&v16, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v6));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController enabledServices](self, "enabledServices"));
      v10 = objc_msgSend(v9, "containsObject:", v8);

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
        objc_msgSend(v12, "selectRowAtIndexPath:animated:scrollPosition:", v11, 0, 0);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
        -[HSPCNameServicesViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v13, v11);

      }
      ++v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
      v15 = objc_msgSend(v14, "count");

    }
    while (v6 < v15);
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(a3, "tag"), 0));
  -[HSPCNameServicesViewController setIndexPathOfFirstResponder:](self, "setIndexPathOfFirstResponder:", v4);

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));
  objc_msgSend(v4, "setText:", v7);

  v8 = HFLogForCategory(58);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeholder"));
    *(_DWORD *)buf = 136315650;
    v21 = "-[HSPCNameServicesViewController textFieldDidEndEditing:]";
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: Title: %@ | Placeholder: %@", buf, 0x20u);

  }
  v12 = (uint64_t)objc_msgSend(v4, "tag");
  if (v12 < 0
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames")),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v12 >= (uint64_t)v14))
  {
    v18 = HFLogForCategory(58);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100060C80(self, v12, v19);

    v16 = (id)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
    NSLog(CFSTR("Well this isn't right, textfield is tagged with an invalid row tag: %ld, totalRows: %ld"), v12, objc_msgSend(v16, "count"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
    v16 = objc_msgSend(v15, "mutableCopy");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    objc_msgSend(v16, "setObject:atIndexedSubscript:", v17, v12);

    -[HSPCNameServicesViewController setServiceNames:](self, "setServiceNames:", v16);
  }

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "tag");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
  v7 = -[HSPCNameServicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, 0);

  if ((uint64_t)v5 >= v7 - 1)
  {
    -[HSPCNameServicesViewController setIndexPathOfFirstResponder:](self, "setIndexPathOfFirstResponder:", 0);
    objc_msgSend(v4, "resignFirstResponder");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5 + 1, 0));
    -[HSPCNameServicesViewController setIndexPathOfFirstResponder:](self, "setIndexPathOfFirstResponder:", v8);
    v10 = objc_opt_class(HSPCNameServiceRow, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForRowAtIndexPath:", v8));
    if ((objc_opt_isKindOfClass(v12, v10) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textField"));
      objc_msgSend(v15, "becomeFirstResponder");
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController tableView](self, "tableView"));
      objc_msgSend(v15, "scrollToRowAtIndexPath:atScrollPosition:animated:", v8, 2, 1);
    }

  }
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController indexPathOfFirstResponder](self, "indexPathOfFirstResponder"));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    v11 = objc_opt_class(HSPCNameServiceRow, v10);
    v12 = v16;
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textField"));
    objc_msgSend(v15, "becomeFirstResponder");

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (-[HSPCNameServicesViewController _indexPathAllowsToggling:](self, "_indexPathAllowsToggling:", v5))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (-[HSPCNameServicesViewController _indexPathAllowsToggling:](self, "_indexPathAllowsToggling:", v5))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)_indexPathAllowsToggling:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceForIndexPath:](self, "serviceForIndexPath:", a3));
  v5 = -[HSPCNameServicesViewController isServiceSelectable:](self, "isServiceSelectable:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController frozenServices](self, "frozenServices"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v5 & (v7 ^ 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  v8 = objc_opt_class(HSPCNameToggleServiceRow, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v14));

  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceForIndexPath:](self, "serviceForIndexPath:", v14));
    objc_msgSend(v11, "setSelected:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController enabledServices](self, "enabledServices"));
    objc_msgSend(v13, "addObject:", v12);

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  v8 = objc_opt_class(HSPCNameToggleServiceRow, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v14));

  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceForIndexPath:](self, "serviceForIndexPath:", v14));
    objc_msgSend(v11, "setSelected:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController enabledServices](self, "enabledServices"));
    objc_msgSend(v13, "removeObject:", v12);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services", a3, a4));
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
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  char *v23;
  char *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController cellReuseIdentifierForService:](self, "cellReuseIdentifierForService:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v7));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  objc_msgSend(v11, "updateUIWithService:suggestedName:", v9, v13);
  v15 = objc_opt_class(HSPCNameToggleServiceRow, v14);
  v16 = v11;
  if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController frozenServices](self, "frozenServices"));
    objc_msgSend(v18, "setFrozen:", objc_msgSend(v19, "containsObject:", v9));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textField"));
  objc_msgSend(v20, "setDelegate:", self);

  v21 = objc_msgSend(v7, "row");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textField"));
  objc_msgSend(v22, "setTag:", v21);

  v23 = (char *)objc_msgSend(v7, "row");
  v24 = (char *)-[HSPCNameServicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, objc_msgSend(v7, "section"))- 1;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textField"));
  v26 = v25;
  if (v23 == v24)
    v27 = 9;
  else
    v27 = 4;
  objc_msgSend(v25, "setReturnKeyType:", v27);

  return v16;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 44.0;
}

- (id)cellReuseIdentifierForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __objc2_class **v8;
  void *v9;

  v4 = a3;
  if (-[HSPCNameServicesViewController isServiceSelectable:](self, "isServiceSelectable:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController config](self, "config"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addedAccessory"));

    v8 = off_1000A0620;
    if (v5 == v7)
      v8 = off_1000A0638;
  }
  else
  {
    v8 = off_1000A0630;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class _reuseIdentifier](*v8, "_reuseIdentifier"));

  return v9;
}

- (id)serviceForIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  return v7;
}

- (BOOL)isServiceSelectable:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serviceType"));
  if ((objc_msgSend(v3, "isEqualToString:", HMServiceTypeInputSource) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", HMServiceTypeValve);

  return v4;
}

- (id)serviceComparator
{
  return +[HMService hf_serviceComparator](HMService, "hf_serviceComparator");
}

- (NSSet)servicesToPreload
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addedAccessory"));

  v6 = objc_msgSend((id)objc_opt_class(self, v5), "applicableServicesForAccessory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSSet *)v7;
}

- (NSSet)characteristicTypesToPreload
{
  void *v2;
  void *v3;
  _QWORD v5[3];

  v5[0] = HMCharacteristicTypeIsConfigured;
  v5[1] = HMCharacteristicTypeConfiguredName;
  v5[2] = HMCharacteristicTypeName;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

+ (id)applicableServicesForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_primaryService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_visibleServices"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hf_childServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v6));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004F550;
  v15[3] = &unk_1000A3278;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", HMServiceTypeIrrigationSystem, HMServiceTypeValve, HMServiceTypeTelevision, HMServiceTypeInputSource, HMServiceTypeHeaterCooler, 0));
  v8 = v16;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_filter:", v15));
  v10 = HFLogForCategory(58);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v7, "count");
    v13 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 136315650;
    v18 = "+[HSPCNameServicesViewController applicableServicesForAccessory:]";
    v19 = 2048;
    v20 = v12;
    v21 = 2048;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s found %ld total services, %ld should be shown to user", buf, 0x20u);
  }

  return v9;
}

- (BOOL)shouldServiceStartEnabled:(id)a3
{
  return 1;
}

- (id)_enabledServicesSetFromServices:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F5F8;
  v4[3] = &unk_1000A3278;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_filter:", v4));
}

- (BOOL)shouldServiceBeFrozen:(id)a3
{
  return 0;
}

- (id)_frozenServicesFromServices:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F668;
  v4[3] = &unk_1000A3278;
  v4[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_filter:", v4));
}

- (id)suggestedNamesForServices:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004F724;
  v8[3] = &unk_1000A32A0;
  v8[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v4, "count")));
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", v8));

  return v6;
}

- (id)_givenNameForService:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuredName"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuredName"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceType"));
    v8 = objc_msgSend(v7, "isEqualToString:", HMServiceTypeInputSource);

    if (v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultName")),
          v10 = objc_msgSend(v9, "length"),
          v9,
          v10))
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultName"));
    }
    else
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hf_userFriendlyLocalizedCapitalizedDescription"));
    }
  }
  v11 = (void *)v6;

  return v11;
}

- (void)_logDetailedServices
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  __int128 v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  void *v29;

  v3 = HFLogForCategory(58);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "HSPCNameServicesViewController is operating on the following services:", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138413058;
    v21 = v7;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services", v21));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v8));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController serviceNames](self, "serviceNames"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v8));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController frozenServices](self, "frozenServices"));
      v14 = objc_msgSend(v13, "containsObject:", v10);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController enabledServices](self, "enabledServices"));
      v16 = objc_msgSend(v15, "containsObject:", v10);

      v17 = HFLogForCategory(58);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v21;
        v23 = v12;
        v24 = 1024;
        v25 = v14;
        v26 = 1024;
        v27 = v16;
        v28 = 2112;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ : isFrozen: %d : startsEnabled: %d : %@", buf, 0x22u);
      }

      ++v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameServicesViewController services](self, "services"));
      v20 = objc_msgSend(v19, "count");

    }
    while (v8 < (unint64_t)v20);
  }
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

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_storeStrong((id *)&self->_services, a3);
}

- (NSSet)frozenServices
{
  return self->_frozenServices;
}

- (void)setFrozenServices:(id)a3
{
  objc_storeStrong((id *)&self->_frozenServices, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (NSArray)serviceNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)enabledServices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEnabledServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSIndexPath)indexPathOfFirstResponder
{
  return self->_indexPathOfFirstResponder;
}

- (void)setIndexPathOfFirstResponder:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathOfFirstResponder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathOfFirstResponder, 0);
  objc_storeStrong((id *)&self->_enabledServices, 0);
  objc_storeStrong((id *)&self->_serviceNames, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_frozenServices, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
