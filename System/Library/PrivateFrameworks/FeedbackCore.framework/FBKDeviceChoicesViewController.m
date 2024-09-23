@implementation FBKDeviceChoicesViewController

- (FBKDeviceChoicesViewController)init
{
  FBKDeviceChoicesViewController *v2;
  FBKDeviceChoicesViewController *v3;
  uint64_t v4;
  NSMutableSet *selectedDevices;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBKDeviceChoicesViewController;
  v2 = -[FBKDeviceChoicesViewController initWithStyle:](&v7, sel_initWithStyle_, 2);
  v3 = v2;
  if (v2)
  {
    v2->_isMultiSelect = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 10);
    v4 = objc_claimAutoreleasedReturnValue();
    selectedDevices = v3->_selectedDevices;
    v3->_selectedDevices = (NSMutableSet *)v4;

  }
  return v3;
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  objc_class *v8;
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
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)FBKDeviceChoicesViewController;
  -[FBKDeviceChoicesViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[FBKDeviceChoicesViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 1);
  +[FBKDevicePairingCell estimatedRowHeight](FBKDevicePairingCell, "estimatedRowHeight");
  v4 = v3;
  -[FBKDeviceChoicesViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEstimatedRowHeight:", v4);

  v6 = *MEMORY[0x24BEBE770];
  -[FBKDeviceChoicesViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRowHeight:", v6);

  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BEBD7B0];
  objc_msgSend(MEMORY[0x24BDD1488], "feedbackCoreFramework");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nibWithNibName:bundle:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKDeviceChoicesViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerNib:forCellReuseIdentifier:", v12, v9);

  -[FBKDeviceChoicesViewController deviceChoices](self, "deviceChoices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[FBKDeviceChoicesViewController deviceChoices](self, "deviceChoices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKGroupedDevice sortedDevices:](FBKGroupedDevice, "sortedDevices:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKDeviceChoicesViewController setSortedChoices:](self, "setSortedChoices:", v17);

  }
  else
  {
    -[FBKDeviceChoicesViewController setSortedChoices:](self, "setSortedChoices:", MEMORY[0x24BDBD1A8]);
  }
  objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ADD_DEVICE"), CFSTR("Add Device"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceChoicesViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v19);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_didCancel);
  -[FBKDeviceChoicesViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLeftBarButtonItem:", v21);

  if (-[FBKDeviceChoicesViewController isMultiSelect](self, "isMultiSelect"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_didTapDone);
    -[FBKDeviceChoicesViewController navigationItem](self, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRightBarButtonItem:", v23);

    -[FBKDeviceChoicesViewController navigationItem](self, "navigationItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rightBarButtonItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setEnabled:", 0);

  }
}

- (void)didTapDone
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "Done button not supported for multi-select picker", v1, 2u);
}

- (void)didCancel
{
  id v3;

  -[FBKDeviceChoicesViewController choiceDelegate](self, "choiceDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceChoicesControllerDidCancelWithController:", self);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[FBKDeviceChoicesViewController sortedChoices](self, "sortedChoices", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    -[FBKDeviceChoicesViewController hideContentUnavailableView](self, "hideContentUnavailableView");
  else
    -[FBKDeviceChoicesViewController showContentUnavailableView](self, "showContentUnavailableView");
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  if (a4
    || !-[FBKDeviceChoicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3))
  {
    v4 = 0;
  }
  else
  {
    v6 = -[FBKDeviceChoicesViewController isMultiSelect](self, "isMultiSelect");
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v10, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  _BOOL4 v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  if (a4
    || !-[FBKDeviceChoicesViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3))
  {
    v4 = 0;
  }
  else
  {
    v6 = -[FBKDeviceChoicesViewController isMultiSelect](self, "isMultiSelect");
    objc_msgSend(MEMORY[0x24BDD1488], "FeedbackCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
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
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, v10, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = tableView_cellForRowAtIndexPath__onceToken;
  v7 = a4;
  v8 = a3;
  if (v6 != -1)
    dispatch_once(&tableView_cellForRowAtIndexPath__onceToken, &__block_literal_global_24);
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", tableView_cellForRowAtIndexPath__identifier, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKDeviceChoicesViewController sortedChoices](self, "sortedChoices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKDeviceChoicesViewController selectedDevices](self, "selectedDevices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v12);

  objc_msgSend(v9, "updateWithDevice:showsDetail:showsTransport:isSelected:", v12, 0, 0, v14);
  objc_msgSend(v9, "spaceFromSuperViewToLabel");
  objc_msgSend(v9, "updateWithSeparatorSpacing:");

  return v9;
}

void __66__FBKDeviceChoicesViewController_tableView_cellForRowAtIndexPath___block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)tableView_cellForRowAtIndexPath__identifier;
  tableView_cellForRowAtIndexPath__identifier = v1;

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
  int v13;
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
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FBKDeviceChoicesViewController sortedChoices](self, "sortedChoices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKLog ded](FBKLog, "ded");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "publicLogDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v11;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "did tap device [%{public}@] on device picker", buf, 0xCu);

  }
  if (-[FBKDeviceChoicesViewController isMultiSelect](self, "isMultiSelect"))
  {
    -[FBKDeviceChoicesViewController selectedDevices](self, "selectedDevices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v9);

    -[FBKDeviceChoicesViewController selectedDevices](self, "selectedDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "removeObject:", v9);
    }
    else
    {
      -[FBKDeviceChoicesViewController sortedChoices](self, "sortedChoices");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v19);

    }
    v23 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v20, 100);

    -[FBKDeviceChoicesViewController selectedDevices](self, "selectedDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "count") != 0;
    -[FBKDeviceChoicesViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rightBarButtonItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEnabled:", v21);

  }
  else
  {
    -[FBKDeviceChoicesViewController choiceDelegate](self, "choiceDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceChoicesController:didChooseDevices:", self, v17);
  }

}

- (void)showContentUnavailableView
{
  void *v3;
  id v4;

  -[FBKDeviceChoicesViewController contentUnavailableView](self, "contentUnavailableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKDeviceChoicesViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundView:", v4);

}

- (void)hideContentUnavailableView
{
  id v2;

  -[FBKDeviceChoicesViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
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
    v4 = objc_alloc(MEMORY[0x24BEBDBB0]);
    -[FBKDeviceChoicesViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NO_MORE_DEVICES_TITLE"), &stru_24E15EAF8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (_UIContentUnavailableView *)objc_msgSend(v4, "initWithFrame:title:style:", v15, 0, v7, v9, v11, v13);
    v17 = self->_contentUnavailableView;
    self->_contentUnavailableView = v16;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NO_MORE_DEVICES_MESSAGE"), &stru_24E15EAF8, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContentUnavailableView setMessage:](self->_contentUnavailableView, "setMessage:", v19);

    contentUnavailableView = self->_contentUnavailableView;
  }
  return contentUnavailableView;
}

- (FBKDeviceChoiceDelegate)choiceDelegate
{
  return (FBKDeviceChoiceDelegate *)objc_loadWeakRetained((id *)&self->_choiceDelegate);
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
