@implementation MSDStoreInfoListViewController

- (MSDStoreInfoListViewController)initWithStoreInfoList:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  MSDStoreInfoListViewController *v8;
  MSDStoreInfoListViewController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDStoreInfoListViewController;
  v8 = -[MSDStoreInfoListViewController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MSDStoreInfoListViewController setStoreList:](v8, "setStoreList:", v6);
    -[MSDStoreInfoListViewController setDelegate:](v9, "setDelegate:", v7);
    -[MSDStoreInfoListViewController setTableView:](v9, "setTableView:", 0);
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
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
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  objc_super v81;
  _QWORD v82[4];
  _QWORD v83[4];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x24BDAC8D0];
  v81.receiver = self;
  v81.super_class = (Class)MSDStoreInfoListViewController;
  -[MSDStoreInfoListViewController viewDidLoad](&v81, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("xmark"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:forState:", v79, 0);
  objc_msgSend(MEMORY[0x24BDF6950], "systemGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__close_, 64);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDStoreInfoListViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);

  v80 = v5;
  objc_msgSend(v5, "trailingAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:constant:", v9, -30.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v10;
  objc_msgSend(v5, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v14, 30.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v78);
  v16 = objc_alloc(MEMORY[0x24BDF6B68]);
  v17 = *MEMORY[0x24BDBF090];
  v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v21 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], v18, v19, v20);
  objc_msgSend(v21, "setNumberOfLines:", 0);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileStoreDemoSetupUI.framework"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("STORE_COUNT"), &stru_24F47DB30, CFSTR("Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController storeList](self, "storeList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringWithFormat:", v24, objc_msgSend(v25, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v26);

  objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v27);

  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MSDStoreInfoListViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v21);

  objc_msgSend(v21, "leadingAnchor");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "safeAreaLayoutGuide");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "leadingAnchor");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "constraintEqualToAnchor:constant:", v66, 30.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v64;
  objc_msgSend(v21, "trailingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "leadingAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v60);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v58;
  v77 = v21;
  objc_msgSend(v21, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeAreaLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v33;
  objc_msgSend(v21, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "centerYAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v83[3] = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 4);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v75);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:style:", 0, v17, v18, v19, v20);
  -[MSDStoreInfoListViewController setTableView:](self, "setTableView:", v37);

  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDataSource:", self);

  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDelegate:", self);

  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[MSDStoreInfoListViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v42);

  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:constant:", v69, 15.0);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v67;
  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "bottomAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bottomAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v59);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v57;
  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "leadingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "safeAreaLayoutGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v45;
  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDStoreInfoListViewController view](self, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "safeAreaLayoutGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v51;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v53);
  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("StoreInfoCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[MSDStoreInfoListViewController storeList](self, "storeList", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  MSDStoreInfoTableViewCell *v11;
  void *v12;
  void *v13;
  void *v14;
  MSDStoreInfoTableViewCell *v15;

  v5 = a4;
  -[MSDStoreInfoListViewController storeList](self, "storeList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isHQ"))
    v9 = CFSTR("building.2.crop.circle.fill");
  else
    v9 = CFSTR("mappin.circle.fill");
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [MSDStoreInfoTableViewCell alloc];
  objc_msgSend(v8, "storeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MSDStoreInfoTableViewCell initWithTitle:description:image:imageColor:reuseIdentifier:](v11, "initWithTitle:description:image:imageColor:reuseIdentifier:", v12, v13, v10, v14, CFSTR("StoreInfoCell"));

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MSDStoreInfoViewController *v10;
  void *v11;
  MSDStoreInfoViewController *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v5 = objc_msgSend(v15, "row");
  -[MSDStoreInfoListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfRowsInSection:", 0);

  if (v5 < v7)
  {
    -[MSDStoreInfoListViewController storeList](self, "storeList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v15, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [MSDStoreInfoViewController alloc];
    -[MSDStoreInfoListViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MSDStoreInfoViewController initWithStoreInfo:andDelegate:](v10, "initWithStoreInfo:andDelegate:", v9, v11);

    -[MSDStoreInfoListViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v12, 1);

    -[MSDStoreInfoListViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v15, 1);

  }
}

- (void)_close:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[MSDStoreInfoListViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  -[MSDStoreInfoListViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listViewDidClose:", self);

}

- (MSDStoreInfoListViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSArray)storeList
{
  return self->_storeList;
}

- (void)setStoreList:(id)a3
{
  objc_storeStrong((id *)&self->_storeList, a3);
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
  objc_storeStrong((id *)&self->_storeList, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
