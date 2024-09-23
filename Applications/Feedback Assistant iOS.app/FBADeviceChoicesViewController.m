@implementation FBADeviceChoicesViewController

- (void)commonInit
{
  NSMutableSet *v3;
  NSMutableSet *selectedDevices;

  self->_isMultiSelect = 0;
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 10));
  selectedDevices = self->_selectedDevices;
  self->_selectedDevices = v3;

}

- (FBADeviceChoicesViewController)initWithCoder:(id)a3
{
  FBADeviceChoicesViewController *v3;
  FBADeviceChoicesViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBADeviceChoicesViewController;
  v3 = -[FBADeviceChoicesViewController initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[FBADeviceChoicesViewController commonInit](v3, "commonInit");
  return v4;
}

- (FBADeviceChoicesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  FBADeviceChoicesViewController *v4;
  FBADeviceChoicesViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBADeviceChoicesViewController;
  v4 = -[FBADeviceChoicesViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  v5 = v4;
  if (v4)
    -[FBADeviceChoicesViewController commonInit](v4, "commonInit");
  return v5;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
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
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)FBADeviceChoicesViewController;
  -[FBADeviceChoicesViewController viewDidLoad](&v26, "viewDidLoad");
  -[FBADeviceChoicesViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  +[FBADevicePairingCell estimatedRowHeight](FBADevicePairingCell, "estimatedRowHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setEstimatedRowHeight:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", UITableViewAutomaticDimension);

  v7 = (objc_class *)objc_opt_class(FBADevicePairingCell);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", v9, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController tableView](self, "tableView"));
  objc_msgSend(v12, "registerNib:forCellReuseIdentifier:", v11, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController deviceChoices](self, "deviceChoices"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController deviceChoices](self, "deviceChoices"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FBKGroupedDevice sortedDevices:](FBKGroupedDevice, "sortedDevices:", v15));
    -[FBADeviceChoicesViewController setSortedChoices:](self, "setSortedChoices:", v16);

  }
  else
  {
    -[FBADeviceChoicesViewController setSortedChoices:](self, "setSortedChoices:", &__NSArray0__struct);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ADD_DEVICE"), CFSTR("Add Device"), 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v19, "setTitle:", v18);

  v20 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "didCancel");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v21, "setLeftBarButtonItem:", v20);

  if (-[FBADeviceChoicesViewController isMultiSelect](self, "isMultiSelect"))
  {
    v22 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "didTapDone");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v23, "setRightBarButtonItem:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController navigationItem](self, "navigationItem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rightBarButtonItem"));
    objc_msgSend(v25, "setEnabled:", 0);

  }
}

- (void)didTapDone
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;

  if (-[FBADeviceChoicesViewController isMultiSelect](self, "isMultiSelect"))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController choiceDelegate](self, "choiceDelegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController selectedDevices](self, "selectedDevices"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v3));
    objc_msgSend(v6, "deviceChoicesController:didChooseDevices:", self, v4);

  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100099A44(v5);

  }
}

- (void)didCancel
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController choiceDelegate](self, "choiceDelegate"));
  objc_msgSend(v3, "deviceChoicesControllerDidCancelWithController:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController sortedChoices](self, "sortedChoices", a3, a4));
  v6 = objc_msgSend(v5, "count");

  if (v6)
    -[FBADeviceChoicesViewController hideContentUnavailableView](self, "hideContentUnavailableView");
  else
    -[FBADeviceChoicesViewController showContentUnavailableView](self, "showContentUnavailableView");
  return (int64_t)v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  if (a4
    || !-[FBADeviceChoicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3))
  {
    v4 = 0;
  }
  else
  {
    v6 = -[FBADeviceChoicesViewController isMultiSelect](self, "isMultiSelect");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v6)
    {
      v9 = CFSTR("DEVICE_PICKER_FOOTER_MULTI_SELECT");
      v10 = CFSTR("To share diagnostic logs with Apple, select all of the devices experiencing this issue. If your device is not listed, make sure it is nearby, online, and signed in to your iCloud account.");
    }
    else
    {
      v9 = CFSTR("DEVICE_PICKER_FOOTER_SINGLE_SELECT");
      v10 = CFSTR("To share diagnostic logs with Apple, select the device experiencing this issue. If your device is not listed, make sure it is nearby, online, and signed in to your iCloud account.");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v10, 0));

  }
  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  if (a4
    || !-[FBADeviceChoicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3))
  {
    v4 = 0;
  }
  else
  {
    v6 = -[FBADeviceChoicesViewController isMultiSelect](self, "isMultiSelect");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v6)
    {
      v9 = CFSTR("DEVICE_PICKER_HEADER_MULTI_SELECT");
      v10 = CFSTR("Select Devices");
    }
    else
    {
      v9 = CFSTR("DEVICE_PICKER_HEADER_SINGLE_SELECT");
      v10 = CFSTR("Select Device");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v10, 0));

  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = qword_100117FF0;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&qword_100117FF0, &stru_1000E67F8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", qword_100117FF8, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController sortedChoices](self, "sortedChoices"));
  v11 = objc_msgSend(v7, "row");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController selectedDevices](self, "selectedDevices"));
  v14 = objc_msgSend(v13, "containsObject:", v12);

  objc_msgSend(v9, "updateWithDevice:showsDetail:showsTransport:isSelected:", v12, 0, 0, v14);
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController sortedChoices](self, "sortedChoices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

  v10 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publicLogDescription"));
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "did tap device [%{public}@] on device picker", buf, 0xCu);

  }
  if (-[FBADeviceChoicesViewController isMultiSelect](self, "isMultiSelect"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController selectedDevices](self, "selectedDevices"));
    v13 = objc_msgSend(v12, "containsObject:", v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController selectedDevices](self, "selectedDevices"));
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "removeObject:", v9);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController sortedChoices](self, "sortedChoices"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      objc_msgSend(v15, "addObject:", v19);

    }
    v23 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v20, 100);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController selectedDevices](self, "selectedDevices"));
    v21 = objc_msgSend(v16, "count") != 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController navigationItem](self, "navigationItem"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rightBarButtonItem"));
    objc_msgSend(v22, "setEnabled:", v21);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController choiceDelegate](self, "choiceDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v9));
    objc_msgSend(v16, "deviceChoicesController:didChooseDevices:", self, v17);
  }

}

- (void)showContentUnavailableView
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController contentUnavailableView](self, "contentUnavailableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setBackgroundView:", v4);

}

- (void)hideContentUnavailableView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController tableView](self, "tableView"));
  objc_msgSend(v2, "setBackgroundView:", 0);

}

- (_UIContentUnavailableView)contentUnavailableView
{
  _UIContentUnavailableView *contentUnavailableView;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _UIContentUnavailableView *v16;
  _UIContentUnavailableView *v17;
  void *v18;
  void *v19;

  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    v4 = objc_alloc((Class)_UIContentUnavailableView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADeviceChoicesViewController view](self, "view"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NO_MORE_DEVICES_TITLE"), &stru_1000EA660, 0));
    v16 = (_UIContentUnavailableView *)objc_msgSend(v4, "initWithFrame:title:style:", v15, 0, v7, v9, v11, v13);
    v17 = self->_contentUnavailableView;
    self->_contentUnavailableView = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NO_MORE_DEVICES_MESSAGE"), &stru_1000EA660, 0));
    -[_UIContentUnavailableView setMessage:](self->_contentUnavailableView, "setMessage:", v19);

    contentUnavailableView = self->_contentUnavailableView;
  }
  return contentUnavailableView;
}

- (FBADeviceChoiceDelegate)choiceDelegate
{
  return (FBADeviceChoiceDelegate *)objc_loadWeakRetained((id *)&self->_choiceDelegate);
}

- (void)setChoiceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_choiceDelegate, a3);
}

- (NSSet)deviceChoices
{
  return self->_deviceChoices;
}

- (void)setDeviceChoices:(id)a3
{
  objc_storeStrong((id *)&self->_deviceChoices, a3);
}

- (BOOL)isMultiSelect
{
  return self->_isMultiSelect;
}

- (void)setIsMultiSelect:(BOOL)a3
{
  self->_isMultiSelect = a3;
}

- (NSMutableSet)selectedDevices
{
  return self->_selectedDevices;
}

- (void)setSelectedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDevices, a3);
}

- (void)setContentUnavailableView:(id)a3
{
  objc_storeStrong((id *)&self->_contentUnavailableView, a3);
}

- (NSArray)sortedChoices
{
  return self->_sortedChoices;
}

- (void)setSortedChoices:(id)a3
{
  objc_storeStrong((id *)&self->_sortedChoices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedChoices, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
  objc_storeStrong((id *)&self->_selectedDevices, 0);
  objc_storeStrong((id *)&self->_deviceChoices, 0);
  objc_destroyWeak((id *)&self->_choiceDelegate);
}

@end
