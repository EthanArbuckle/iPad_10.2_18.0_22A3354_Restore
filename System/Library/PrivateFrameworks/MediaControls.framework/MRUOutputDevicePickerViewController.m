@implementation MRUOutputDevicePickerViewController

- (MRUOutputDevicePickerViewController)initWithConfiguration:(id)a3 endpoint:(id)a4 dismiss:(id)a5
{
  id v9;
  id v10;
  id v11;
  MRUOutputDevicePickerViewController *v12;
  MRUOutputDevicePickerViewController *v13;
  uint64_t v14;
  NSXPCConnection *connection;
  uint64_t v16;
  MROutputDevicePickerProtocol *proxy;
  void *v18;
  id dismissal;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MRUOutputDevicePickerViewController;
  v12 = -[MRUOutputDevicePickerViewController init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    -[MRUOutputDevicePickerViewController connectionWithEndpoint:](v13, "connectionWithEndpoint:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    connection = v13->_connection;
    v13->_connection = (NSXPCConnection *)v14;

    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v13->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_45);
    v16 = objc_claimAutoreleasedReturnValue();
    proxy = v13->_proxy;
    v13->_proxy = (MROutputDevicePickerProtocol *)v16;

    v18 = _Block_copy(v11);
    dismissal = v13->_dismissal;
    v13->_dismissal = v18;

  }
  return v13;
}

void __78__MRUOutputDevicePickerViewController_initWithConfiguration_endpoint_dismiss___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl(&dword_1AA991000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error occured while atempting to retrive remote proxy to open connection: %@", (uint8_t *)&v3, 0xCu);
  }
}

- (void)loadView
{
  MRUOutputDeviceView *v3;

  v3 = objc_alloc_init(MRUOutputDeviceView);
  -[MRUOutputDevicePickerViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSArray *v18;
  NSArray *collators;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MROutputDeviceConfiguration *configuration;
  uint64_t v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)MRUOutputDevicePickerViewController;
  -[MRUOutputDevicePickerViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[MRUOutputDevicePickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forHeaderFooterViewReuseIdentifier:", v5, v7);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", v10, v12);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[MROutputDevicePickerProtocol openConnection](self->_proxy, "openConnection");
  v17 = objc_alloc_init(MEMORY[0x1E0D4C5D8]);
  v33[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  collators = self->_collators;
  self->_collators = v18;

  -[MRUOutputDevicePickerViewController createOutputDevicesController](self, "createOutputDevicesController");
  -[MRUOutputDevicePickerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "segmentedControl");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_segmentedControlDidChange_, 4096);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "segmentedControl");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "insertSegmentWithTitle:atIndex:animated:", CFSTR("Audio"), 0, 0);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "segmentedControl");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "insertSegmentWithTitle:atIndex:animated:", CFSTR("Screen"), 1, 0);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "segmentedControl");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "insertSegmentWithTitle:atIndex:animated:", CFSTR("Photos"), 2, 0);

  configuration = self->_configuration;
  if (configuration)
  {
    v29 = -[MROutputDeviceConfiguration surface](configuration, "surface");
    -[MRUOutputDevicePickerViewController view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "segmentedControl");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSelectedSegmentIndex:", v29);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUOutputDevicePickerViewController;
  -[MRUOutputDevicePickerViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[MRUOutputDevicePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "materialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeighting:", 1.0);

  -[MROutputDevicesController setDiscoveryMode:](self->_outputDevicesController, "setDiscoveryMode:", 3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRUOutputDevicePickerViewController;
  -[MRUOutputDevicePickerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[MRUOutputDevicePickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "materialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeighting:", 0.0);

  -[MROutputDevicesController setDiscoveryMode:](self->_outputDevicesController, "setDiscoveryMode:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void)segmentedControlDidChange:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  MROutputDeviceConfiguration *v9;
  MROutputDeviceConfiguration *configuration;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0D4C5C0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = *MEMORY[0x1E0D4C220];
  v8 = objc_msgSend(v5, "selectedSegmentIndex");

  v9 = (MROutputDeviceConfiguration *)objc_msgSend(v6, "initWithSessionID:presentingAppBundleID:surface:", v7, 0, v8);
  configuration = self->_configuration;
  self->_configuration = v9;

  -[MRUOutputDevicePickerViewController createOutputDevicesController](self, "createOutputDevicesController");
  -[MRUOutputDevicePickerViewController view](self, "view");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (void)outputDevicesController:(id)a3 didChangeAvailableOutputDevices:(id)a4
{
  void *v4;
  id v5;

  -[MRUOutputDevicePickerViewController view](self, "view", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)outputDevicesController:(id)a3 didChangePendingOutputDevices:(id)a4
{
  void *v4;
  id v5;

  -[MRUOutputDevicePickerViewController view](self, "view", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)outputDevicesController:(id)a3 didChangeSelectedOutputDevices:(id)a4
{
  void *v4;
  id v5;

  -[MRUOutputDevicePickerViewController view](self, "view", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)updateConfiguration:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_configuration, a3);
  -[MRUOutputDevicePickerViewController createOutputDevicesController](self, "createOutputDevicesController");
  -[MRUOutputDevicePickerViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[MROutputDevicesController availableOutputDevices](self->_outputDevicesController, "availableOutputDevices", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[MROutputDevicesController availableOutputDevices](self->_outputDevicesController, "availableOutputDevices", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x1E0DC53D8];
  if (!a4)
    return 0.0;
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 52.0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingTitleFont", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_routingSubtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");

  -[MRUOutputDevicePickerViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  UIRoundToScale();
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUOutputDevicePickerViewController updateCell:forIndexPath:](self, "updateCell:forIndexPath:", v10, v6);
  return v10;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v6 = a3;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRUOutputDevicePickerViewController updateHeaderView:forSection:](self, "updateHeaderView:forSection:", v9, a4);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[MROutputDevicesController availableOutputDevices](self->_outputDevicesController, "availableOutputDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  -[MROutputDevicesController selectedOutputDevices](self->_outputDevicesController, "selectedOutputDevices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v22);

  v12 = objc_msgSend(v22, "isGroupable");
  v13 = 2;
  if (v12)
    v13 = 0;
  if (v11)
    v14 = 1;
  else
    v14 = v13;
  v15 = objc_alloc(MEMORY[0x1E0D4C608]);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithName:requestID:reason:userInitiated:", v17, 0, 0, 1);

  v19 = objc_alloc(MEMORY[0x1E0D4C5C8]);
  -[MROutputDevicesController configuration](self->_outputDevicesController, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithRequestDetails:configuration:type:outputDevice:", v18, v20, v14, v22);

  -[MROutputDevicesController performModification:completion:](self->_outputDevicesController, "performModification:completion:", v21, &__block_literal_global_22_0);
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return objc_msgSend(a3, "numberOfSections") - 1 == a4;
}

- (void)updateCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  MROutputDevicesController *outputDevicesController;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD v30[2];
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  outputDevicesController = self->_outputDevicesController;
  v8 = a4;
  -[MROutputDevicesController availableOutputDevices](outputDevicesController, "availableOutputDevices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v13);

  v14 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v12, "symbolName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "systemImageNamed:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIconImage:", v16);

  -[MRUOutputDevicePickerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stylingProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStylingProvider:", v18);

  objc_msgSend(v6, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 24.0);
  v19 = objc_msgSend(v12, "isGroupable");
  -[MROutputDevicesController selectedOutputDevices](self->_outputDevicesController, "selectedOutputDevices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v12);

  -[MROutputDevicesController pendingOutputDevices](self->_outputDevicesController, "pendingOutputDevices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", v12);

  MCLogCategoryRouting();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v30[0] = 67109632;
    v30[1] = v19;
    v31 = 1024;
    v32 = v21;
    v33 = 1024;
    v34 = v23;
    _os_log_impl(&dword_1AA991000, v24, OS_LOG_TYPE_DEFAULT, "MROutputDevice groupable: %{BOOL}u | selected: %{BOOL}u | pending: %{BOOL}u", (uint8_t *)v30, 0x14u);
  }

  objc_msgSend(v6, "routingAccessoryView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  v27 = 3;
  if ((v21 & v19) != 0)
    v27 = 4;
  v28 = v19;
  if (v23)
    v28 = 2;
  if (v21)
    v29 = v27;
  else
    v29 = v28;
  objc_msgSend(v25, "setState:", v29);

}

- (void)updateHeaderView:(id)a3 forSection:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  if (a4 == 1)
  {
    v7 = CFSTR("Speakers & TVs");
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v7 = CFSTR("Other");
LABEL_5:
    objc_msgSend(v6, "setTitle:", v7);
    v6 = v10;
  }
  objc_msgSend(v6, "setContentEdgeInsets:", 0.0, 24.0, 0.0, 24.0);
  -[MRUOutputDevicePickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stylingProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStylingProvider:", v9);

}

- (void)createOutputDevicesController
{
  void *v3;
  MROutputDevicesController *outputDevicesController;
  id v5;

  if (self->_configuration)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4C5E0]), "initWithConfiguration:", self->_configuration);
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v3, "setCollators:", self->_collators);
    outputDevicesController = self->_outputDevicesController;
    self->_outputDevicesController = (MROutputDevicesController *)v3;
    v5 = v3;

    -[MROutputDevicesController setDiscoveryMode:](self->_outputDevicesController, "setDiscoveryMode:", 3);
  }
}

- (id)connectionWithEndpoint:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id buf[2];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1AA991000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Creating XPC connection to host app.", (uint8_t *)buf, 2u);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
  objc_msgSend(v5, "_setEndpoint:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC00918);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEBE8098);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v8);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_initWeak(buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__MRUOutputDevicePickerViewController_connectionWithEndpoint___block_invoke;
  v10[3] = &unk_1E5818E18;
  objc_copyWeak(&v11, buf);
  objc_msgSend(v6, "setInvalidationHandler:", v10);
  objc_msgSend(v6, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);

  return v6;
}

void __62__MRUOutputDevicePickerViewController_connectionWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void (**v2)(void);
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1AA991000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "XPC connection to host app invalidated.", v3, 2u);
    }
    objc_msgSend(WeakRetained, "dismissal");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

- (MROutputDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (id)dismissal
{
  return self->_dismissal;
}

- (id)customRowTappedBlock
{
  return self->_customRowTappedBlock;
}

- (void)setCustomRowTappedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (MROutputDevicesController)outputDevicesController
{
  return self->_outputDevicesController;
}

- (void)setOutputDevicesController:(id)a3
{
  objc_storeStrong((id *)&self->_outputDevicesController, a3);
}

- (NSArray)collators
{
  return self->_collators;
}

- (void)setCollators:(id)a3
{
  objc_storeStrong((id *)&self->_collators, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (MROutputDevicePickerProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_collators, 0);
  objc_storeStrong((id *)&self->_outputDevicesController, 0);
  objc_storeStrong(&self->_customRowTappedBlock, 0);
  objc_storeStrong(&self->_dismissal, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
