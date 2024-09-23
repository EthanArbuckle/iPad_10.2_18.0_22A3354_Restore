@implementation LAPSPasscodeOptionsSheetViewController

- (LAPSPasscodeOptionsSheetViewController)initWithConfiguration:(id)a3
{
  return -[LAPSPasscodeOptionsSheetViewController initWithConfiguration:style:](self, "initWithConfiguration:style:", a3, 0);
}

- (LAPSPasscodeOptionsSheetViewController)initWithConfiguration:(id)a3 style:(int64_t)a4
{
  id v7;
  LAPSPasscodeOptionsSheetViewController *v8;
  LAPSPasscodeOptionsSheetViewController *v9;
  id *p_config;
  uint64_t v11;
  NSOrderedSet *allowedPasscodeTypes;
  NSOrderedSet *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)LAPSPasscodeOptionsSheetViewController;
  v8 = -[LAPSPasscodeOptionsSheetViewController init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    p_config = (id *)&v8->_config;
    objc_storeStrong((id *)&v8->_config, a3);
    v9->_style = a4;
    objc_msgSend(*p_config, "allowedPasscodeTypes");
    v11 = objc_claimAutoreleasedReturnValue();
    allowedPasscodeTypes = v9->_allowedPasscodeTypes;
    v9->_allowedPasscodeTypes = (NSOrderedSet *)v11;

    v13 = v9->_allowedPasscodeTypes;
    objc_msgSend(*p_config, "selectedPasscodeType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_selectedPasscodeTypeIndex = -[NSOrderedSet indexOfObject:](v13, "indexOfObject:", v14);

  }
  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LAPSPasscodeOptionsSheetViewController;
  -[LAPSPasscodeOptionsSheetViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[LAPSPasscodeOptionsSheetViewController _setup](self, "_setup");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LAPSPasscodeOptionsSheetViewController;
  -[LAPSPasscodeOptionsSheetViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeOptionsViewControllerDidDisappear:", self);

}

- (CGSize)preferredContentSize
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  objc_msgSend(WeakRetained, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 30;
  else
    return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!-[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoverySupported](self->_config, "isPasscodeRecoverySupported", a3))return 1;
  if (-[LAPSPasscodeOptionsViewControllerConfiguration isPasscodeRecoveryOptionVisible](self->_config, "isPasscodeRecoveryOptionVisible"))
  {
    return 2;
  }
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return -[NSOrderedSet count](self->_allowedPasscodeTypes, "count", a3);
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
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD block[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[LAPSPasscodeOptionsSheetViewController _cellIdentifierForIndexPath:](self, "_cellIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, v8);
  objc_msgSend(v9, "setAccessoryType:", 0);
  objc_msgSend(v9, "setSelectionStyle:", 0);
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") != 1)
      -[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:].cold.2();
    objc_msgSend(v9, "defaultContentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAPSPasscodeOptionsViewControllerConfiguration passcodeRecoveryTitle](self->_config, "passcodeRecoveryTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v11);

    objc_msgSend(v9, "setContentConfiguration:", v10);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    v19[3] = &unk_24FDCDC98;
    v19[4] = self;
    __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_2((uint64_t)v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessoryView:", v12);
    goto LABEL_9;
  }
  v13 = objc_msgSend(v7, "row");
  if (v13 >= -[NSOrderedSet count](self->_allowedPasscodeTypes, "count"))
    -[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:].cold.1();
  objc_msgSend(v9, "defaultContentConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsSheetViewController _tableCellTextColor](self, "_tableCellTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setColor:", v15);

  -[NSOrderedSet objectAtIndex:](self->_allowedPasscodeTypes, "objectAtIndex:", objc_msgSend(v7, "row"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v17);

  objc_msgSend(v9, "setContentConfiguration:", v10);
  if (objc_msgSend(v7, "row") == self->_selectedPasscodeTypeIndex)
  {
    objc_msgSend(v9, "setSelected:", 1);
    objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v7, 0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke;
    block[3] = &unk_24FDCDC48;
    block[4] = self;
    v21 = v6;
    v22 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v12 = v21;
LABEL_9:

  }
  return v9;
}

uint64_t __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tableView:didSelectRowAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v2 = objc_alloc_init(MEMORY[0x24BEBD9B8]);
  objc_msgSend(v2, "setPreferredStyle:", 2);
  objc_msgSend(v2, "setOn:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryEnabled"));
  objc_msgSend(v2, "setEnabled:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "isPasscodeRecoveryRestricted") ^ 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = (void *)MEMORY[0x24BEBD388];
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v9 = &unk_24FDCDC70;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "actionWithHandler:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAction:forControlEvents:", v4, 4096, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v2;
}

void __74__LAPSPasscodeOptionsSheetViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_changePasscodeRecoveryStatus:", v4);
}

- (id)_cellIdentifierForIndexPath:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
  {
    if (objc_msgSend(v3, "section") != 1)
      -[LAPSPasscodeOptionsSheetViewController _cellIdentifierForIndexPath:].cold.1();
    v4 = CFSTR("PasscodeRecovery");
  }
  else
  {
    v4 = CFSTR("PasscodeType");
  }

  return (id)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    v7 = objc_msgSend(v6, "row");
    if (v7 < -[NSOrderedSet count](self->_allowedPasscodeTypes, "count"))
    {
      -[LAPSPasscodeOptionsSheetViewController _changeSelectedPasscodeTypeIndex:](self, "_changeSelectedPasscodeTypeIndex:", objc_msgSend(v6, "row"));
      objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryType:", 3);

    }
  }

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "indexPathForSelectedRow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v6))
      v9 = 0;
    else
      v9 = v6;
    v7 = v9;

  }
  return v7;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (!objc_msgSend(v5, "section"))
  {
    objc_msgSend(v9, "indexPathForSelectedRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v9, "cellForRowAtIndexPath:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryType:", 0);

    }
  }

}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  double result;

  -[LAPSPasscodeOptionsSheetViewController _heightForHeaderInSection:](self, "_heightForHeaderInSection:", a4);
  return result;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;

  -[LAPSPasscodeOptionsSheetViewController _heightForHeaderInSection:](self, "_heightForHeaderInSection:", a4);
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return (id)objc_opt_new();
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  double result;

  -[LAPSPasscodeOptionsSheetViewController _heightForFooterInSection:](self, "_heightForFooterInSection:", a4);
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  -[LAPSPasscodeOptionsSheetViewController _heightForFooterInSection:](self, "_heightForFooterInSection:", a4);
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return (id)objc_opt_new();
}

- (double)_heightForHeaderInSection:(int64_t)a3
{
  return 12.0;
}

- (double)_heightForFooterInSection:(int64_t)a3
{
  return 1.0;
}

- (void)_setup
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
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
  _QWORD v28[5];
  _QWORD v29[6];

  v29[4] = *MEMORY[0x24BDAC8D0];
  -[LAPSPasscodeOptionsSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v6 = -[LAPSPasscodeOptionsSheetViewController _tableViewStyle](self, "_tableViewStyle");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:style:", v6, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v7, "setDataSource:", self);
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setAllowsMultipleSelection:", 0);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setSectionHeaderTopPadding:", 0.0);
  -[LAPSPasscodeOptionsSheetViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  v20 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v7, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsSheetViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  objc_msgSend(v7, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsSheetViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v19;
  objc_msgSend(v7, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsSheetViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v11;
  objc_msgSend(v7, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAPSPasscodeOptionsSheetViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v16);

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke;
  v28[3] = &unk_24FDCDD40;
  v28[4] = self;
  __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke((uint64_t)v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTableHeaderView:", v17);

  objc_storeWeak((id *)&self->_tableView, v7);
}

id __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke(uint64_t a1)
{
  char v2;
  id v3;
  void *v4;
  void *v5;
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
  id *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id location;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_tableViewNeedsHeaderView");
  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  if ((v2 & 1) == 0)
    return (id)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, 0.0, 60.0);
  v30 = (id *)(a1 + 32);
  v31 = objc_alloc_init(MEMORY[0x24BEBD708]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v5);

  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE250], *MEMORY[0x24BEBB5E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFont:", v6);

  objc_msgSend(v4, "addSubview:", v31);
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v31, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v10;
  objc_msgSend(v31, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 20.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateConstraints:", v14);

  v15 = (void *)MEMORY[0x24BEBD430];
  __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_2();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD388], "actionWithHandler:", &__block_literal_global_33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "buttonWithConfiguration:primaryAction:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addSubview:", v18);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v18, "centerYAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v22;
  objc_msgSend(v18, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -20.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v26);

  objc_initWeak(&location, *v30);
  v27 = (void *)MEMORY[0x24BEBD388];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_6;
  v32[3] = &unk_24FDCDC70;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v27, "actionWithHandler:", v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:forControlEvents:", v28, 64);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v4;
}

id __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD438], "grayButtonConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("xmark"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setImage:", v1);

  objc_msgSend(v0, "setImageColorTransformer:", &__block_literal_global_29);
  __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_4();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPreferredSymbolConfigurationForImage:", v2);

  objc_msgSend(v0, "setCornerStyle:", 4);
  objc_msgSend(v0, "setContentInsets:", 5.0, 5.0, 5.0, 5.0);
  return v0;
}

uint64_t __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_3()
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

id __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_4()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB5E8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithFont:scale:", v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __48__LAPSPasscodeOptionsSheetViewController__setup__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_close:", v4);
}

- (void)_close:(id)a3
{
  -[LAPSPasscodeOptionsSheetViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_35);
}

- (void)_changePasscodeRecoveryStatus:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[LAPSPasscodeOptionsSheetViewController _changePasscodeRecoveryStatus:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeOptionsViewController:didSetPasscodeRecoveryEnabled:", self, objc_msgSend(v5, "isOn"));

}

- (void)_changeSelectedPasscodeTypeIndex:(int64_t)a3
{
  id WeakRetained;
  void *v6;

  if (a3 < 0 || -[NSOrderedSet count](self->_allowedPasscodeTypes, "count") <= a3)
    -[LAPSPasscodeOptionsSheetViewController _changeSelectedPasscodeTypeIndex:].cold.1();
  if (self->_selectedPasscodeTypeIndex != a3)
  {
    self->_selectedPasscodeTypeIndex = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSOrderedSet objectAtIndex:](self->_allowedPasscodeTypes, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "passcodeOptionsViewController:didSelectPasscodeType:", self, v6);

    if (-[LAPSPasscodeOptionsSheetViewController _tableRowShouldDismissOnSelection](self, "_tableRowShouldDismissOnSelection"))
    {
      -[LAPSPasscodeOptionsSheetViewController _close:](self, "_close:", 0);
    }
  }
}

- (int64_t)_tableViewStyle
{
  return 2 * (self->_style == 0);
}

- (BOOL)_tableViewNeedsHeaderView
{
  return self->_style == 0;
}

- (id)_tableCellTextColor
{
  int64_t style;

  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    self = (LAPSPasscodeOptionsSheetViewController *)objc_claimAutoreleasedReturnValue();
  }
  else if (!style)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellBlueTextColor");
    self = (LAPSPasscodeOptionsSheetViewController *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (BOOL)_tableRowShouldDismissOnSelection
{
  return self->_style != 0;
}

- (LAPSPasscodeOptionsViewControllerDelegate)delegate
{
  return (LAPSPasscodeOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allowedPasscodeTypes, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)tableView:cellForRowAtIndexPath:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:]", "LAPSPasscodeOptionsSheetViewController.m", 99, "[indexPath row] < [_allowedPasscodeTypes count]");
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController tableView:cellForRowAtIndexPath:]", "LAPSPasscodeOptionsSheetViewController.m", 112, "[indexPath section] == 1");
}

- (void)_cellIdentifierForIndexPath:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController _cellIdentifierForIndexPath:]", "LAPSPasscodeOptionsSheetViewController.m", 136, "[indexPath section] == 1");
}

- (void)_changePasscodeRecoveryStatus:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController _changePasscodeRecoveryStatus:]", "LAPSPasscodeOptionsSheetViewController.m", 275, "[sender isKindOfClass:[UISwitch class]]");
}

- (void)_changeSelectedPasscodeTypeIndex:.cold.1()
{
  __assert_rtn("-[LAPSPasscodeOptionsSheetViewController _changeSelectedPasscodeTypeIndex:]", "LAPSPasscodeOptionsSheetViewController.m", 281, "index >= 0 && index < [_allowedPasscodeTypes count]");
}

@end
