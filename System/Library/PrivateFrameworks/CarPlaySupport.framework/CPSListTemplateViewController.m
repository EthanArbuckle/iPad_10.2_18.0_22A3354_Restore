@implementation CPSListTemplateViewController

- (CPSListTemplateViewController)initWithListTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSListTemplateViewController *v5;
  uint64_t v6;
  CPSSectionedDataSource *dataSource;
  uint64_t v8;
  CPUINowPlayingManager *nowPlayingManager;
  CPSListTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CPSSectionedDataSource *v17;
  id v18;
  NSString *v19;
  CPListTemplate *v20;
  CPSListTemplateViewController *v23;
  id v24;
  objc_super v25;
  id v26;
  id v27;
  id location[2];
  CPSListTemplateViewController *v29;
  uint8_t v30[40];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v5 = v29;
  v29 = 0;
  v25.receiver = v5;
  v25.super_class = (Class)CPSListTemplateViewController;
  v23 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](&v25, sel_initWithTemplate_templateDelegate_templateEnvironment_, location[0], v27, v26);
  v29 = v23;
  objc_storeStrong((id *)&v29, v23);
  if (v23)
  {
    v17 = [CPSSectionedDataSource alloc];
    v18 = (id)objc_msgSend(location[0], "sections");
    v6 = -[CPSSectionedDataSource initWithSections:templateEnvironment:](v17, "initWithSections:templateEnvironment:");
    dataSource = v29->_dataSource;
    v29->_dataSource = (CPSSectionedDataSource *)v6;

    -[CPSListTemplateViewController updateAssistantCell](v29, "updateAssistantCell");
    v20 = -[CPSListTemplateViewController listTemplate](v29, "listTemplate");
    v19 = -[CPListTemplate title](v20, "title");
    -[CPSListTemplateViewController setTitle:](v29, "setTitle:");

    v24 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      v14 = location[0];
      v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(location[0], "sectionCount"));
      v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(location[0], "itemCount"));
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v30, (uint64_t)v14, (uint64_t)v16, (uint64_t)v15);
      _os_log_impl(&dword_21E389000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "Received a list template %@ with %@ sections and %@ items", v30, 0x20u);

    }
    objc_storeStrong(&v24, 0);
    if ((objc_msgSend(v26, "canBecomeNowPlayingApp") & 1) != 0)
    {
      v12 = objc_alloc(MEMORY[0x24BE153A8]);
      v13 = (id)objc_msgSend(v26, "bundleIdentifier");
      v8 = objc_msgSend(v12, "initWithBundleIdentifier:");
      nowPlayingManager = v29->_nowPlayingManager;
      v29->_nowPlayingManager = (CPUINowPlayingManager *)v8;

      -[CPUINowPlayingManager addNowPlayingObserver:](v29->_nowPlayingManager, "addNowPlayingObserver:", v29);
    }
  }
  v11 = v29;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v29, 0);
  return v11;
}

- (CPListTemplate)listTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_17(v3, v4);

  return (CPListTemplate *)v5;
}

- (BOOL)_shouldRetainFocusOnWillAppear
{
  id v3;
  uint64_t v4;

  v3 = (id)-[CPSListTemplateViewController traitCollection](self, "traitCollection");
  v4 = objc_msgSend(v3, "primaryInteractionModel");

  return v4 == 2 || v4 == 8;
}

- (BOOL)_wantsNowPlayingButton
{
  return 1;
}

- (void)_viewDidLoad
{
  CPSTableView *v2;
  CPSTableView *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSString *v20;
  objc_class *v21;
  uint64_t v22;
  NSString *v23;
  objc_class *aClass;
  uint64_t v25;
  CPSTableView *v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(id *, void *, void *, void *);
  void *v32;
  id v33[3];
  uint64_t v34;
  int v35;
  int v36;
  id (*v37)(id *, void *, void *, void *);
  void *v38;
  id v39;
  id location;
  id v41;
  id v42;
  objc_super v43;
  SEL v44;
  CPSListTemplateViewController *v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v45 = self;
  v44 = a2;
  v43.receiver = self;
  v43.super_class = (Class)CPSListTemplateViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v43, sel__viewDidLoad);
  v42 = (id)-[CPSListTemplateViewController view](v45, "view");
  v27 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_msgSend(v42, "setBackgroundColor:");

  v26 = [CPSTableView alloc];
  v41 = -[CPSTableView initWithFrame:style:](v26, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v41, "setDelegate:", v45);
  v25 = objc_opt_class();
  aClass = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(aClass);
  objc_msgSend(v41, "registerClass:forHeaderFooterViewReuseIdentifier:", v25);

  v22 = objc_opt_class();
  v21 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v21);
  objc_msgSend(v41, "registerClass:forHeaderFooterViewReuseIdentifier:", v22);

  objc_msgSend(v41, "setRowHeight:", *MEMORY[0x24BDF7DE0]);
  objc_msgSend(v41, "setEstimatedRowHeight:", *MEMORY[0x24BDF7DE0]);
  -[CPSDataSource setTableView:](v45->_dataSource, "setTableView:", v41);
  v19 = (id)-[CPSListTemplateViewController view](v45, "view");
  objc_msgSend(v19, "addSubview:", v41);

  -[CPSListTemplateViewController setTableView:](v45, "setTableView:", v41);
  v18 = (void *)MEMORY[0x24BDD1628];
  v17 = (id)objc_msgSend(v42, "topAnchor");
  v16 = (id)objc_msgSend(v41, "topAnchor");
  v15 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v46[0] = v15;
  v14 = (id)objc_msgSend(v42, "safeAreaLayoutGuide");
  v13 = (id)objc_msgSend(v14, "bottomAnchor");
  v12 = (id)objc_msgSend(v41, "bottomAnchor");
  v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v46[1] = v11;
  v10 = (id)objc_msgSend(v42, "leftAnchor");
  v9 = (id)objc_msgSend(v41, "leftAnchor");
  v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v46[2] = v8;
  v7 = (id)objc_msgSend(v42, "rightAnchor");
  v6 = (id)objc_msgSend(v41, "rightAnchor");
  v5 = (id)objc_msgSend(v7, "constraintEqualToAnchor:");
  v46[3] = v5;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
  objc_msgSend(v18, "activateConstraints:");

  v3 = -[CPSListTemplateViewController tableView](v45, "tableView");
  -[CPSTableView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CPListTemplate"));

  -[CPSDataSource setRowAnimation:](v45->_dataSource, "setRowAnimation:", 5);
  objc_initWeak(&location, v45);
  v34 = MEMORY[0x24BDAC760];
  v35 = -1073741824;
  v36 = 0;
  v37 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke;
  v38 = &unk_24E270B88;
  objc_copyWeak(&v39, &location);
  -[CPSDataSource setCellCreateBlock:](v45->_dataSource, "setCellCreateBlock:", &v34);
  v28 = MEMORY[0x24BDAC760];
  v29 = -1073741824;
  v30 = 0;
  v31 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke_2;
  v32 = &unk_24E270C20;
  objc_copyWeak(v33, &location);
  -[CPSDataSource setCellConfigureBlock:](v45->_dataSource, "setCellConfigureBlock:", &v28);
  v2 = -[CPSListTemplateViewController tableView](v45, "tableView");
  -[CPSTableView reloadData](v2, "reloadData");

  -[CPSListTemplateViewController _updateEmptyView](v45, "_updateEmptyView");
  objc_destroyWeak(v33);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
}

id __45__CPSListTemplateViewController__viewDidLoad__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  double v4;
  double v5;
  id v7;
  id v11;
  id WeakRetained;
  int v13;
  id *v14;
  id v15;
  id v16;
  id location[2];
  id v18;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16 = 0;
  objc_storeStrong(&v16, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = +[_CPUIBaseTableCell cellForTableView:](CPSImageRowCell, "cellForTableView:", v15);
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = +[_CPUIBaseTableCell cellForTableView:](CPSMessageCell, "cellForTableView:", v15);
      v13 = 1;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained(a1 + 4);
      v11 = +[_CPUIBaseTableCell cellForTableView:](CPSTableCell, "cellForTableView:", v15);
      v7 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
      objc_msgSend(v7, "hasNavigationEntitlement");
      CGSizeMake_9();
      objc_msgSend(v11, "setArtworkSize:", v4, v5);

      v18 = v11;
      v13 = 1;
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&WeakRetained, 0);
    }
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v18;
}

void __45__CPSListTemplateViewController__viewDidLoad__block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  int v37;
  int v38;
  void (*v39)(id *, uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id WeakRetained;
  id v58;
  id v59[2];
  id v60;
  id v61;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v61 = 0;
  objc_storeStrong(&v61, a3);
  v60 = 0;
  objc_storeStrong(&v60, a4);
  v59[1] = a1;
  v59[0] = 0;
  v58 = CPListItemIdentifier(v61);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    v5 = CPSSafeCast_17(v4, location[0]);
    v6 = v59[0];
    v59[0] = v5;

    v56 = (id)objc_msgSend(WeakRetained, "templateDelegate");
    v21 = MEMORY[0x24BDAC760];
    v45 = MEMORY[0x24BDAC760];
    v46 = -1073741824;
    v47 = 0;
    v48 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke_3;
    v49 = &unk_24E270BD0;
    v50 = v56;
    v51 = v61;
    v52 = WeakRetained;
    v53 = v58;
    v54 = v60;
    v55 = MEMORY[0x2207AE654](&v45);
    v36 = v21;
    v37 = -1073741824;
    v38 = 0;
    v39 = __45__CPSListTemplateViewController__viewDidLoad__block_invoke_5;
    v40 = &unk_24E270BF8;
    v41 = v56;
    v42 = WeakRetained;
    v43 = v61;
    v44 = MEMORY[0x2207AE654](&v36);
    v26 = v59[0];
    v22 = v61;
    v23 = (id)v44;
    v24 = (id)v55;
    v29 = (id)objc_msgSend(WeakRetained, "currentSpinningIdentifier");
    v25 = objc_msgSend(v29, "isEqual:", v58);
    v28 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
    v27 = (id)objc_msgSend(v28, "bundleIdentifier");
    objc_msgSend(v26, "configureWithImageRowItem:selectGridItemBlock:selectTitleBlock:showActivityIndicator:bundleIdentifier:", v22, v23, v24, v25 & 1);

    objc_storeStrong((id *)&v44, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong((id *)&v55, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v56, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v61;
      v7 = (void *)objc_opt_class();
      v8 = CPSSafeCast_17(v7, location[0]);
      v9 = v59[0];
      v59[0] = v8;

      objc_msgSend(v59[0], "configureWithMessageListItem:", v35);
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v10 = (void *)objc_opt_class();
      v34 = CPSSafeCast_17(v10, v61);
      v11 = (void *)objc_opt_class();
      v33 = CPSSafeCast_17(v11, location[0]);
      v19 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
      v20 = 0;
      if ((objc_msgSend(v19, "canBecomeNowPlayingApp") & 1) != 0)
        v20 = objc_msgSend(v34, "isPlaying");

      if ((v20 & 1) != 0)
      {
        v18 = (id)objc_msgSend(WeakRetained, "nowPlayingManager");
        v17 = (id)objc_msgSend(v18, "snapshot");
        objc_msgSend(WeakRetained, "_playingIndicatorStateForSnapshot:");

      }
      v14 = v33;
      v12 = v34;
      v16 = (id)objc_msgSend(WeakRetained, "currentSpinningIdentifier");
      v13 = objc_msgSend(v16, "isEqual:", v58);
      v15 = (id)objc_msgSend(WeakRetained, "templateEnvironment");
      objc_msgSend(v14, "configureWithListItem:spinning:environment:playbackState:", v12, v13 & 1);

      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v34, 0);
    }
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
}

void __45__CPSListTemplateViewController__viewDidLoad__block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_255452448) & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isEnabled") & 1) != 0)
    {
      v2 = *(void **)(a1 + 32);
      v4 = (id)objc_msgSend(*(id *)(a1 + 48), "listTemplate");
      v3 = (id)objc_msgSend(v4, "identifier");
      objc_msgSend(v2, "listTemplateWithIdentifier:didSelectListItemWithIdentifier:completionHandler:");

    }
    else
    {
      v1 = (id)objc_msgSend(*(id *)(a1 + 48), "tableView");
      objc_msgSend(v1, "deselectRowAtIndexPath:animated:", *(_QWORD *)(a1 + 64), 1);

    }
  }
}

void __45__CPSListTemplateViewController__viewDidLoad__block_invoke_5(id *a1, uint64_t a2)
{
  id v2;
  id v3;
  id v4;
  id v5;

  if ((objc_msgSend(a1[4], "conformsToProtocol:", &unk_255452448) & 1) != 0)
  {
    v2 = a1[4];
    v5 = (id)objc_msgSend(a1[5], "listTemplate");
    v4 = (id)objc_msgSend(v5, "identifier");
    v3 = (id)objc_msgSend(a1[6], "identifier");
    objc_msgSend(v2, "listTemplateWithIdentifier:didSelectImageAtIndex:inImageRowItemWithIdentifier:", v4, a2);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  id location;
  id v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  CPSListTemplateViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSListTemplateViewController;
  -[CPSBaseTemplateViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (!-[CPSListTemplateViewController _shouldRetainFocusOnWillAppear](v8, "_shouldRetainFocusOnWillAppear"))
  {
    v4 = -[CPSListTemplateViewController tableView](v8, "tableView");
    location = (id)objc_msgSend(v4, "indexPathForSelectedRow");
    if (location)
      objc_msgSend(v4, "deselectRowAtIndexPath:animated:", location, v6);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v4, 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  CPSTemplateEnvironment *v3;
  BOOL v4;
  objc_super v5;
  BOOL v6;
  SEL v7;
  CPSListTemplateViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSListTemplateViewController;
  -[CPSBaseTemplateViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  v3 = -[CPSBaseTemplateViewController templateEnvironment](v8, "templateEnvironment");
  v4 = -[CPSTemplateEnvironment canBecomeNowPlayingApp](v3, "canBecomeNowPlayingApp");

  if (v4)
    -[CPSListTemplateViewController _updatePlayingIndicators](v8, "_updatePlayingIndicators");
}

- (void)_updateEmptyView
{
  CPSEmptyView *v2;
  CPSEmptyView *v3;
  NSArray *v4;
  CPListTemplate *v5;
  CPSEmptyView *v6;
  NSArray *v7;
  CPListTemplate *v8;
  CPSEmptyView *v9;
  CPSTableView *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  CPSTableView *v35;
  CPSEmptyView *v36;
  CPSEmptyView *v37;
  CPSSectionedDataSource *v38;
  BOOL v39;
  CPSEmptyView *v40;
  char v41;
  CPSSectionedDataSource *v42;
  BOOL v43;
  SEL v44;
  CPSListTemplateViewController *v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v45 = self;
  v44 = a2;
  v43 = 0;
  v38 = -[CPSListTemplateViewController dataSource](self, "dataSource");
  v41 = 0;
  v39 = 0;
  if (!-[CPSSectionedDataSource numberOfItems](v38, "numberOfItems"))
  {
    v42 = -[CPSListTemplateViewController dataSource](v45, "dataSource");
    v41 = 1;
    v39 = -[CPSSectionedDataSource numberOfEnhancedSections](v42, "numberOfEnhancedSections") == 0;
  }
  if ((v41 & 1) != 0)

  v43 = v39;
  if (v39)
  {
    v2 = -[CPSListTemplateViewController emptyView](v45, "emptyView");
    v34 = v2 != 0;

    if (!v34)
    {
      v3 = [CPSEmptyView alloc];
      v40 = -[CPSEmptyView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      -[CPSListTemplateViewController setEmptyView:](v45, "setEmptyView:", v40);
      v10 = -[CPSListTemplateViewController tableView](v45, "tableView");
      -[CPSTableView setHidden:](v10, "setHidden:", 1);

      v11 = (id)-[CPSListTemplateViewController view](v45, "view");
      objc_msgSend(v11, "addSubview:", v40);

      v12 = (void *)MEMORY[0x24BDD1628];
      v33 = (id)-[CPSEmptyView topAnchor](v40, "topAnchor");
      v32 = (id)-[CPSListTemplateViewController view](v45, "view");
      v31 = (id)objc_msgSend(v32, "safeAreaLayoutGuide");
      v30 = (id)objc_msgSend(v31, "topAnchor");
      v29 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
      v46[0] = v29;
      v28 = (id)-[CPSEmptyView leadingAnchor](v40, "leadingAnchor");
      v27 = (id)-[CPSListTemplateViewController view](v45, "view");
      v26 = (id)objc_msgSend(v27, "safeAreaLayoutGuide");
      v25 = (id)objc_msgSend(v26, "leadingAnchor");
      v24 = (id)objc_msgSend(v28, "constraintEqualToAnchor:");
      v46[1] = v24;
      v23 = (id)-[CPSEmptyView trailingAnchor](v40, "trailingAnchor");
      v22 = (id)-[CPSListTemplateViewController view](v45, "view");
      v21 = (id)objc_msgSend(v22, "safeAreaLayoutGuide");
      v20 = (id)objc_msgSend(v21, "trailingAnchor");
      v19 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
      v46[2] = v19;
      v18 = (id)-[CPSEmptyView bottomAnchor](v40, "bottomAnchor");
      v17 = (id)-[CPSListTemplateViewController view](v45, "view");
      v16 = (id)objc_msgSend(v17, "safeAreaLayoutGuide");
      v15 = (id)objc_msgSend(v16, "bottomAnchor");
      v14 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
      v46[3] = v14;
      v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
      objc_msgSend(v12, "activateConstraints:");

      objc_storeStrong((id *)&v40, 0);
    }
    v6 = -[CPSListTemplateViewController emptyView](v45, "emptyView");
    v5 = -[CPSListTemplateViewController listTemplate](v45, "listTemplate");
    v4 = -[CPListTemplate emptyViewTitleVariants](v5, "emptyViewTitleVariants");
    -[CPSEmptyView setTitleVariants:](v6, "setTitleVariants:");

    v9 = -[CPSListTemplateViewController emptyView](v45, "emptyView");
    v8 = -[CPSListTemplateViewController listTemplate](v45, "listTemplate");
    v7 = -[CPListTemplate emptyViewSubtitleVariants](v8, "emptyViewSubtitleVariants");
    -[CPSEmptyView setSubtitleVariants:](v9, "setSubtitleVariants:");

  }
  else
  {
    v37 = -[CPSListTemplateViewController emptyView](v45, "emptyView");

    if (v37)
    {
      v36 = -[CPSListTemplateViewController emptyView](v45, "emptyView");
      -[CPSEmptyView removeFromSuperview](v36, "removeFromSuperview");

      -[CPSListTemplateViewController setEmptyView:](v45, "setEmptyView:", 0);
    }
    v35 = -[CPSListTemplateViewController tableView](v45, "tableView");
    -[CPSTableView setHidden:](v35, "setHidden:", 0);

  }
}

- (void)_addSpinnerToIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  CPSSectionedDataSource *v8;
  NSUUID *v9;
  CPSSectionedDataSource *v10;
  NSUUID *v11;
  CPSSectionedDataSource *v12;
  NSUUID *v13;
  NSUUID *v14;
  id v15;
  NSUUID *v16;
  char v17;
  id v18;
  id v19;
  id v20;
  os_log_type_t v21;
  id v22;
  int v23;
  id location[2];
  CPSListTemplateViewController *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = location[0];
  v16 = -[CPSListTemplateViewController nextSpinningIdentifier](v25, "nextSpinningIdentifier");
  v17 = objc_msgSend(v15, "isEqual:");

  if ((v17 & 1) != 0)
  {
    v22 = CarPlaySupportGeneralLogging();
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v26, (uint64_t)location[0]);
      _os_log_impl(&dword_21E389000, (os_log_t)v22, v21, "Adding spinner to list item %{public}@", v26, 0xCu);
    }
    objc_storeStrong(&v22, 0);
    v13 = -[CPSListTemplateViewController currentSpinningIdentifier](v25, "currentSpinningIdentifier");
    v20 = (id)-[NSUUID copy](v13, "copy");

    v14 = -[CPSListTemplateViewController nextSpinningIdentifier](v25, "nextSpinningIdentifier");
    -[CPSListTemplateViewController setCurrentSpinningIdentifier:](v25, "setCurrentSpinningIdentifier:");

    -[CPSListTemplateViewController setNextSpinningIdentifier:](v25, "setNextSpinningIdentifier:", 0);
    v19 = (id)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = 0;
    if (v20)
    {
      v12 = -[CPSListTemplateViewController dataSource](v25, "dataSource");
      v3 = -[CPSSectionedDataSource indexPathForItemWithIdentifier:](v12, "indexPathForItemWithIdentifier:", location[0]);
      v4 = v18;
      v18 = v3;

      if (v18)
        objc_msgSend(v19, "addObject:", v18);
    }
    v11 = -[CPSListTemplateViewController currentSpinningIdentifier](v25, "currentSpinningIdentifier");

    if (v11)
    {
      v10 = -[CPSListTemplateViewController dataSource](v25, "dataSource");
      v9 = -[CPSListTemplateViewController currentSpinningIdentifier](v25, "currentSpinningIdentifier");
      v5 = -[CPSSectionedDataSource indexPathForItemWithIdentifier:](v10, "indexPathForItemWithIdentifier:");
      v6 = v18;
      v18 = v5;

      if (v18)
        objc_msgSend(v19, "addObject:", v18);
    }
    else
    {
      -[CPSListTemplateViewController setCurrentSpinningIdentifier:](v25, "setCurrentSpinningIdentifier:", 0);
    }
    if (objc_msgSend(v19, "count"))
    {
      v8 = -[CPSListTemplateViewController dataSource](v25, "dataSource");
      v7 = (id)objc_msgSend(v19, "allObjects");
      -[CPSDataSource reloadItemsAtIndexPaths:](v8, "reloadItemsAtIndexPaths:");

    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_scheduleLoadingSpinnerForIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id from;
  id location[2];
  CPSListTemplateViewController *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSListTemplateViewController setNextSpinningIdentifier:](v23, "setNextSpinningIdentifier:", location[0]);
  objc_initWeak(&from, v23);
  if (!-[CPSListTemplateViewController spinnerState](v23, "spinnerState"))
  {
    v6 = (void *)MEMORY[0x24BDBCF40];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke;
    v18 = &unk_24E270C48;
    objc_copyWeak(&v20, &from);
    v19 = location[0];
    v5 = (id)objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v14, 0.2);
    -[CPSListTemplateViewController setSpinnerStartTimer:](v23, "setSpinnerStartTimer:");

    v4 = (void *)MEMORY[0x24BDBCF40];
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke_2;
    v11 = &unk_24E270C48;
    objc_copyWeak(&v13, &from);
    v12 = location[0];
    v3 = (id)objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v7, 10.0);
    -[CPSListTemplateViewController setSpinnerTimeoutTimer:](v23, "setSpinnerTimeoutTimer:");

    -[CPSListTemplateViewController setSpinnerState:](v23, "setSpinnerState:", 1);
    objc_storeStrong(&v12, 0);
    objc_destroyWeak(&v13);
    objc_storeStrong(&v19, 0);
    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3[0], "_startSpinnerTimerFired:identifier:", location[0], *(_QWORD *)(a1 + 32));
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void __70__CPSListTemplateViewController__scheduleLoadingSpinnerForIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3[0], "_timeoutSpinnerFired:identifier:", location[0], *(_QWORD *)(a1 + 32));
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (void)_startSpinnerTimerFired:(id)a3 identifier:(id)a4
{
  id v5;
  id location[2];
  CPSListTemplateViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSListTemplateViewController setSpinnerStartTimer:](v7, "setSpinnerStartTimer:", 0);
  -[CPSListTemplateViewController setSpinnerState:](v7, "setSpinnerState:", 2);
  -[CPSListTemplateViewController _addSpinnerToIdentifier:](v7, "_addSpinnerToIdentifier:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_timeoutSpinnerFired:(id)a3 identifier:(id)a4
{
  id v5;
  id location[2];
  CPSListTemplateViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSListTemplateViewController setSpinnerTimeoutTimer:](v7, "setSpinnerTimeoutTimer:", 0);
  -[CPSListTemplateViewController setSpinnerState:](v7, "setSpinnerState:", 0);
  -[CPSListTemplateViewController _cellSelectionCompleted:](v7, "_cellSelectionCompleted:", v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_cancelScheduledLoadingSpinner
{
  NSTimer *v2;
  NSTimer *v3;

  v2 = -[CPSListTemplateViewController spinnerStartTimer](self, "spinnerStartTimer");
  -[NSTimer invalidate](v2, "invalidate");

  v3 = -[CPSListTemplateViewController spinnerTimeoutTimer](self, "spinnerTimeoutTimer");
  -[NSTimer invalidate](v3, "invalidate");

  -[CPSListTemplateViewController setSpinnerStartTimer:](self, "setSpinnerStartTimer:");
  -[CPSListTemplateViewController setSpinnerTimeoutTimer:](self, "setSpinnerTimeoutTimer:", 0);
  -[CPSListTemplateViewController setSpinnerState:](self, "setSpinnerState:", 0);
}

- (void)_cellSelectionCompleted:(id)a3
{
  id v3;
  CPSSectionedDataSource *v4;
  CPSSectionedDataSource *v5;
  os_log_t oslog;
  id v7;
  id location[2];
  CPSListTemplateViewController *v9;
  id v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSListTemplateViewController setCurrentSpinningIdentifier:](v9, "setCurrentSpinningIdentifier:", 0);
  if (location[0] && -[CPSListTemplateViewController spinnerState](v9, "spinnerState") == 2)
  {
    v5 = -[CPSListTemplateViewController dataSource](v9, "dataSource");
    v7 = -[CPSSectionedDataSource indexPathForItemWithIdentifier:](v5, "indexPathForItemWithIdentifier:", location[0]);

    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v11, (uint64_t)location[0], (uint64_t)v7);
      _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Removing spinner from item %{public}@ at index path %{public}@", v11, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v7)
    {
      v4 = -[CPSListTemplateViewController dataSource](v9, "dataSource");
      v10 = v7;
      v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
      -[CPSDataSource reloadItemsAtIndexPaths:](v4, "reloadItemsAtIndexPaths:");

    }
    objc_storeStrong(&v7, 0);
  }
  -[CPSListTemplateViewController _cancelScheduledLoadingSpinner](v9, "_cancelScheduledLoadingSpinner");
  objc_storeStrong(location, 0);
}

- (BOOL)restoresFocusAfterTransition
{
  return 0;
}

- (void)updateAssistantCell
{
  CPSSectionedDataSource *dataSource;
  CPAssistantCellConfiguration *v3;
  CPListTemplate *v4;
  CPSSectionedDataSource *v5;
  CPAssistantCellConfiguration *v6;
  CPListTemplate *v7;

  -[CPSListTemplateViewController updateAssistantCellTitle](self, "updateAssistantCellTitle");
  dataSource = self->_dataSource;
  v4 = -[CPSListTemplateViewController listTemplate](self, "listTemplate");
  v3 = -[CPListTemplate assistantCellConfiguration](v4, "assistantCellConfiguration");
  -[CPSSectionedDataSource setAssistantCellVisibility:](dataSource, "setAssistantCellVisibility:", -[CPAssistantCellConfiguration visibility](v3, "visibility"));

  v5 = self->_dataSource;
  v7 = -[CPSListTemplateViewController listTemplate](self, "listTemplate");
  v6 = -[CPListTemplate assistantCellConfiguration](v7, "assistantCellConfiguration");
  -[CPSSectionedDataSource setAssistantCellPosition:](v5, "setAssistantCellPosition:", -[CPAssistantCellConfiguration position](v6, "position"));

}

- (void)updateAssistantCellTitle
{
  CPSSectionedDataSource *v2;
  id v3;
  CPSSectionedDataSource *v4;
  id v5;
  CPSSectionedDataSource *v6;
  id v7;
  NSString *v8;
  CPSTemplateEnvironment *v9;
  BOOL v10;
  CPSSectionedDataSource *dataSource;
  id v12;
  NSString *v13;
  CPSTemplateEnvironment *v14;
  BOOL v15;
  CPAssistantCellConfiguration *v16;
  CPListTemplate *v17;
  void *v18;
  id location[3];
  CPSListTemplateViewController *v20;

  v20 = self;
  location[2] = (id)a2;
  v17 = -[CPSListTemplateViewController listTemplate](self, "listTemplate");
  v16 = -[CPListTemplate assistantCellConfiguration](v17, "assistantCellConfiguration");
  v18 = -[CPAssistantCellConfiguration assistantAction](v16, "assistantAction");

  location[1] = v18;
  location[0] = +[CPSListTemplateViewController intentIdentifierFromConfigurationEnum:](CPSListTemplateViewController, "intentIdentifierFromConfigurationEnum:", v18);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("INPlayMediaIntent")) & 1) != 0)
  {
    v14 = -[CPSBaseTemplateViewController templateEnvironment](v20, "templateEnvironment");
    v13 = -[CPSTemplateEnvironment bundleIdentifier](v14, "bundleIdentifier");
    v15 = -[NSString isEqualToString:](v13, "isEqualToString:", *MEMORY[0x24BE15340]);

    if (v15)
    {
      dataSource = v20->_dataSource;
      v12 = CPSLocalizedStringForKey(CFSTR("ASSISTANTCELL_TITLE_PODCASTS"));
      -[CPSSectionedDataSource setAssistantCellTitle:](dataSource, "setAssistantCellTitle:");

    }
    else
    {
      v9 = -[CPSBaseTemplateViewController templateEnvironment](v20, "templateEnvironment");
      v8 = -[CPSTemplateEnvironment bundleIdentifier](v9, "bundleIdentifier");
      v10 = -[NSString isEqualToString:](v8, "isEqualToString:", *MEMORY[0x24BE152E0]);

      if (v10)
      {
        v6 = v20->_dataSource;
        v7 = CPSLocalizedStringForKey(CFSTR("ASSISTANTCELL_TITLE_CLASSICAL"));
        -[CPSSectionedDataSource setAssistantCellTitle:](v6, "setAssistantCellTitle:");

      }
      else
      {
        v4 = v20->_dataSource;
        v5 = CPSLocalizedStringForKey(CFSTR("ASSISTANTCELL_TITLE_AUDIO"));
        -[CPSSectionedDataSource setAssistantCellTitle:](v4, "setAssistantCellTitle:");

      }
    }
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("INStartCallIntent")) & 1) != 0)
  {
    v2 = v20->_dataSource;
    v3 = CPSLocalizedStringForKey(CFSTR("ASSISTANTCELL_TITLE_COMMUNICATION"));
    -[CPSSectionedDataSource setAssistantCellTitle:](v2, "setAssistantCellTitle:");

  }
  objc_storeStrong(location, 0);
}

- (void)updateSectionHeaderImage:(id)a3 forSectionIdentifier:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSListTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSListTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __79__CPSListTemplateViewController_updateSectionHeaderImage_forSectionIdentifier___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = v14;
  v13 = location[0];
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __79__CPSListTemplateViewController_updateSectionHeaderImage_forSectionIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20[3];

  v20[2] = (id)a1;
  v20[1] = (id)a1;
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v20[0] = (id)objc_msgSend(v10, "sectionWithIdentifier:", *(_QWORD *)(a1 + 40));

  v11 = (void *)objc_opt_class();
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "tableView");
  v12 = (id)objc_msgSend(v13, "headerViewForSection:", objc_msgSend(v20[0], "index"));
  v19 = CPSSafeCast_17(v11, v12);

  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend(v20[0], "sectionHeaderStyle") == 2)
    {
      v1 = (void *)objc_opt_class();
      v18 = CPSSafeCast_17(v1, v19);
      objc_msgSend(v20[0], "setHeaderImage:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v18, "setImage:", *(_QWORD *)(a1 + 48));
      objc_storeStrong(&v18, 0);
    }
    else
    {
      objc_msgSend(v20[0], "setSectionHeaderStyle:", 2);
      objc_msgSend(v20[0], "setHeaderImage:", *(_QWORD *)(a1 + 48));
      v9 = (id)objc_msgSend(*(id *)(a1 + 32), "tableView");
      v8 = (id)objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(v19, "sectionIndex"));
      objc_msgSend(v9, "_reloadSectionHeaderFooters:withRowAnimation:");

    }
  }
  else
  {
    v6 = (id)objc_msgSend(v20[0], "headerSubtitle");
    v16 = 0;
    v7 = 1;
    if (!objc_msgSend(v6, "length"))
    {
      v17 = (id)objc_msgSend(v20[0], "headerButton");
      v16 = 1;
      v7 = v17 != 0;
    }
    if ((v16 & 1) != 0)

    if (v7)
    {
      v2 = (void *)objc_opt_class();
      v15 = CPSSafeCast_17(v2, v19);
      objc_msgSend(v20[0], "setHeaderImage:");
      objc_msgSend(v15, "setImage:", 0);
      objc_storeStrong(&v15, 0);
    }
    else
    {
      v3 = (id)objc_msgSend(v20[0], "header");
      objc_msgSend(v20[0], "setSectionHeaderStyle:", objc_msgSend(v3, "length") != 0);

      objc_msgSend(v20[0], "setHeaderImage:", 0);
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "tableView");
      v4 = (id)objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(v19, "sectionIndex"));
      objc_msgSend(v5, "_reloadSectionHeaderFooters:withRowAnimation:");

    }
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v20, 0);
}

- (void)setButton:(id)a3 enabled:(BOOL)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setButton:(id)a3 hidden:(BOOL)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)reloadTemplate:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  CPSListTemplateViewController *v10;
  id location[2];
  CPSListTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__CPSListTemplateViewController_reloadTemplate___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __48__CPSListTemplateViewController_reloadTemplate___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id location[3];
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Received update for list template %@", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentSpinningIdentifier:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_updateTemplate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "updateAssistantCell");
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "dataSource");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "sections");
  objc_msgSend(v3, "updateSections:");

  return objc_msgSend(*(id *)(a1 + 40), "_updateEmptyView");
}

- (void)updateAssistantCellConfiguration:(id)a3 withCompletion:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSListTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSListTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __81__CPSListTemplateViewController_updateAssistantCellConfiguration_withCompletion___block_invoke;
  v10 = &unk_24E26FAD0;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __81__CPSListTemplateViewController_updateAssistantCellConfiguration_withCompletion___block_invoke(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  id v9;
  id v10[3];

  v10[2] = (id)a1;
  v10[1] = (id)a1;
  v10[0] = 0;
  v5 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "templateEnvironment");
  v6 = +[CPSListTemplateViewController clientAssistantCellConfiguration:availableWithError:templateEnvironment:](CPSListTemplateViewController, "clientAssistantCellConfiguration:availableWithError:templateEnvironment:", v5, &v9);
  objc_storeStrong(v10, v9);
  objc_msgSend(*(id *)(a1 + 32), "setAssistantCellAvailable:", v6);

  if ((objc_msgSend(*(id *)(a1 + 32), "assistantCellAvailable") & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "listTemplate");
    objc_msgSend(v4, "setAssistantCellConfiguration:", v3);

    objc_msgSend(*(id *)(a1 + 32), "updateAssistantCell");
  }
  v1 = objc_msgSend(*(id *)(a1 + 32), "assistantCellAvailable", *(_QWORD *)(a1 + 48));
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, v1 & 1, v10[0]);
  objc_storeStrong(v10, 0);
}

- (void)reloadItems:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  CPSListTemplateViewController *v10;
  id location[2];
  CPSListTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__CPSListTemplateViewController_reloadItems___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__CPSListTemplateViewController_reloadItems___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, void *, void *, void *);
  void *v10;
  id v11;
  os_log_type_t v12;
  id location[3];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "listTemplate");
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, v3, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], v12, "Received items to reload %@ for list template %@", v14, 0x16u);

  }
  objc_storeStrong(location, 0);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentSpinningIdentifier:");
  v1 = *(void **)(a1 + 32);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __45__CPSListTemplateViewController_reloadItems___block_invoke_149;
  v10 = &unk_24E270C70;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", &v6);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "dataSource");
  objc_msgSend(v2, "reloadItems:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_updateEmptyView");
  objc_storeStrong(&v11, 0);
}

void __45__CPSListTemplateViewController_reloadItems___block_invoke_149(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v11;
  id v12;
  id v13;
  id v14[4];
  id location[2];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[3] = a3;
  v14[2] = a4;
  v14[1] = a1;
  v11 = (id)objc_msgSend(a1[4], "listTemplate");
  v14[0] = (id)objc_msgSend(v11, "indexPathForItem:", location[0]);

  if (v14[0])
  {
    v6 = (id)objc_msgSend(a1[4], "listTemplate");
    v5 = (id)objc_msgSend(v6, "sections");
    v13 = (id)objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v14[0], "section"));

    v7 = v13;
    v4 = objc_msgSend(v14[0], "row");
    objc_msgSend(v7, "replaceItemAtIndex:withItem:", v4, location[0]);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v12 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)location[0]);
      _os_log_impl(&dword_21E389000, (os_log_t)v12, OS_LOG_TYPE_INFO, "Unable to match an index path for item %@", v16, 0xCu);
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v14, 0);
  objc_storeStrong(location, 0);
}

- (void)scrollToTop
{
  CPSSectionedDataSource *v2;
  BOOL v3;
  id v4[2];
  CPSListTemplateViewController *v5;

  v5 = self;
  v4[1] = (id)a2;
  v2 = -[CPSListTemplateViewController dataSource](self, "dataSource");
  v3 = -[CPSSectionedDataSource numberOfItems](v2, "numberOfItems") <= 0;

  if (!v3)
  {
    v4[0] = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0);
    -[CPSTableView scrollToRowAtIndexPath:atScrollPosition:animated:](v5->_tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4[0], 1, 1);
    objc_storeStrong(v4, 0);
  }
}

- (void)_scrollViewAccessoryInsetsDidChange:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  id v10;
  id v11;
  CPSTemplateEnvironment *v12;
  BOOL v13;
  CPSTableView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  id location[2];
  CPSListTemplateViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = -[CPSBaseTemplateViewController templateEnvironment](v21, "templateEnvironment");
  v13 = -[CPSTemplateEnvironment rightHandDrive](v12, "rightHandDrive");

  v3 = 3;
  if (!v13)
    v3 = 5;
  v19 = v3;
  v14 = -[CPSListTemplateViewController tableView](v21, "tableView");

  v9 = (id)-[CPSListTemplateViewController navigationController](v21, "navigationController");
  v8 = (id)objc_msgSend(v9, "navigationBar");
  objc_msgSend(v8, "layoutMargins");

  UIEdgeInsetsMake_1();
  v15 = v4;
  v16 = v5;
  v17 = v6;
  v18 = v7;
  v11 = (id)-[CPSListTemplateViewController navigationController](v21, "navigationController");
  v10 = (id)objc_msgSend(v11, "navigationBar");
  objc_msgSend(v10, "setLayoutMargins:", v15, v16, v17, v18);

  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v8 = (id)objc_msgSend(v10, "nextFocusedIndexPath");
  v7 = (id)objc_msgSend(location[0], "indexPathForSelectedRow");
  if (v7 && v8 && (objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v7, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  id v6;
  CPSSectionedDataSource *v7;
  uint64_t v8;
  CPSSectionedDataSource *v9;
  NSIndexPath *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  id v15;
  int v16;
  char v17;
  NSIndexPath *v18;
  int64_t v19;
  id location[2];
  CPSListTemplateViewController *v21;
  double v22;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = a4;
  v11 = -[CPSSectionedDataSource assistantCellIndexPath](v21->_dataSource, "assistantCellIndexPath");
  v17 = 0;
  v12 = 0;
  if (v11)
  {
    v18 = -[CPSSectionedDataSource assistantCellIndexPath](v21->_dataSource, "assistantCellIndexPath");
    v17 = 1;
    v12 = -[NSIndexPath section](v18, "section") == v19;
  }
  if ((v17 & 1) != 0)

  if (v12)
  {
    v22 = 0.0;
    v16 = 1;
  }
  else
  {
    v9 = -[CPSListTemplateViewController dataSource](v21, "dataSource");
    v15 = -[CPSSectionedDataSource sectionAtIndex:](v9, "sectionAtIndex:", v19);

    v14 = (id)objc_msgSend(v15, "header");
    if (objc_msgSend(v14, "length"))
    {
      v7 = -[CPSListTemplateViewController dataSource](v21, "dataSource");
      v6 = -[CPSSectionedDataSource sectionAtIndex:](v7, "sectionAtIndex:", v19);
      v8 = objc_msgSend(v6, "sectionHeaderStyle");

      if (v8)
      {
        if (v8 == 1)
        {
          if (v19 < 1)
            v5 = *MEMORY[0x24BDF7DE0];
          else
            v5 = 0x4042000000000000;
          v13 = v5;
        }
        else if (v8 == 2)
        {
          v13 = 0x4046000000000000;
        }
        else
        {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      v22 = *(double *)&v13;
      v16 = 1;
    }
    else
    {
      v22 = 0.0;
      v16 = 1;
    }
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(location, 0);
  return v22;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_class *v12;
  id v14;
  id v15;
  NSString *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  NSString *v45;
  CPSSectionedDataSource *v46;
  CPSSectionedDataSource *v48;
  BOOL v49;
  uint64_t v50;
  int v51;
  int v52;
  void (*v53)(uint64_t, void *);
  void *v54;
  CPSListTemplateViewController *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  int v67;
  int64_t v68;
  id location[2];
  CPSListTemplateViewController *v70;
  id v71;
  _QWORD v72[3];
  uint64_t v73;
  id v74;
  uint64_t v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x24BDAC8D0];
  v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v68 = a4;
  v48 = -[CPSListTemplateViewController dataSource](v70, "dataSource");
  v49 = a4 < -[CPSSectionedDataSource numberOfSections](v48, "numberOfSections");

  if (v49)
  {
    v46 = -[CPSListTemplateViewController dataSource](v70, "dataSource");
    v66 = -[CPSSectionedDataSource sectionAtIndex:](v46, "sectionAtIndex:", v68);

    objc_msgSend(v66, "setIndex:", v68);
    v65 = objc_msgSend(v66, "sectionHeaderStyle");
    v64 = 0;
    if (v65 == 1)
    {
      v63 = (id)objc_msgSend(v66, "header");
      v44 = location[0];
      v4 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v4);
      v5 = (id)objc_msgSend(v44, "dequeueReusableHeaderFooterViewWithIdentifier:");
      v6 = v64;
      v64 = v5;

      v62 = (id)objc_msgSend(v64, "viewWithTag:", tableView_viewForHeaderInSection__headerTitleTag);
      if (!v62)
      {
        v22 = (void *)MEMORY[0x24BDF6A78];
        v21 = *MEMORY[0x24BDF77B8];
        v23 = (id)-[CPSListTemplateViewController traitCollection](v70, "traitCollection");
        v61 = (id)objc_msgSend(v22, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v21);

        v75 = *MEMORY[0x24BDF78A0];
        v24 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7890]);
        v76[0] = v24;
        v60 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, &v75);

        v25 = v61;
        v73 = *MEMORY[0x24BDF7770];
        v74 = v60;
        v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
        v7 = (id)objc_msgSend(v25, "fontDescriptorByAddingAttributes:");
        v8 = v61;
        v61 = v7;

        v9 = objc_alloc(MEMORY[0x24BDF6B68]);
        v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v11 = v62;
        v62 = v10;

        v27 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
        objc_msgSend(v62, "setTextColor:");

        objc_msgSend(v62, "setTag:", tableView_viewForHeaderInSection__headerTitleTag);
        v28 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v61, 0.0);
        objc_msgSend(v62, "setFont:");

        v29 = (id)objc_msgSend(v64, "contentView");
        objc_msgSend(v29, "addSubview:", v62);

        objc_msgSend(v62, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v30 = (void *)MEMORY[0x24BDD1628];
        v43 = (id)objc_msgSend(v62, "bottomAnchor");
        v42 = (id)objc_msgSend(v64, "contentView");
        v41 = (id)objc_msgSend(v42, "bottomAnchor");
        v40 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
        v72[0] = v40;
        v39 = (id)objc_msgSend(v62, "leadingAnchor");
        v38 = (id)objc_msgSend(v64, "contentView");
        v37 = (id)objc_msgSend(v38, "leadingAnchor");
        v36 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", 6.0);
        v72[1] = v36;
        v35 = (id)objc_msgSend(v62, "trailingAnchor");
        v34 = (id)objc_msgSend(v64, "contentView");
        v33 = (id)objc_msgSend(v34, "trailingAnchor");
        v32 = (id)objc_msgSend(v35, "constraintEqualToAnchor:constant:", -6.0);
        v72[2] = v32;
        v31 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
        objc_msgSend(v30, "activateConstraints:");

        objc_storeStrong(&v60, 0);
        objc_storeStrong(&v61, 0);
      }
      objc_msgSend(v62, "setText:", v63);
      objc_storeStrong(&v62, 0);
      objc_storeStrong(&v63, 0);
    }
    else if (v65 == 2)
    {
      v15 = location[0];
      v12 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v12);
      v59 = (id)objc_msgSend(v15, "dequeueReusableHeaderFooterViewWithIdentifier:");

      v17 = (id)objc_msgSend(v66, "header");
      objc_msgSend(v59, "setTitle:");

      v58 = *MEMORY[0x24BDB7958];
      v57 = v58;
      objc_msgSend(v59, "setImageSize:", v58);
      v18 = (id)objc_msgSend(v66, "headerImage");
      objc_msgSend(v59, "setImage:");

      v19 = (id)objc_msgSend(v66, "headerSubtitle");
      objc_msgSend(v59, "setSubtitle:");

      v20 = v59;
      v50 = MEMORY[0x24BDAC760];
      v51 = -1073741824;
      v52 = 0;
      v53 = __66__CPSListTemplateViewController_tableView_viewForHeaderInSection___block_invoke;
      v54 = &unk_24E270C98;
      v55 = v70;
      v56 = v66;
      objc_msgSend(v20, "configureButton:", &v50);
      objc_storeStrong(&v64, v59);
      objc_storeStrong(&v56, 0);
      objc_storeStrong((id *)&v55, 0);
      objc_storeStrong(&v59, 0);
    }
    v14 = (id)objc_msgSend(v66, "identifier");
    objc_msgSend(v64, "setIdentifier:");

    objc_msgSend(v64, "setSectionIndex:", v68);
    objc_msgSend(v64, "setAccessibilityIdentifier:", CFSTR("CPListSection"));
    v71 = v64;
    v67 = 1;
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v66, 0);
  }
  else
  {
    v71 = 0;
    v67 = 1;
  }
  objc_storeStrong(location, 0);
  return v71;
}

void __66__CPSListTemplateViewController_tableView_viewForHeaderInSection___block_invoke(uint64_t a1, void *a2)
{
  char v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_didSelectMediaButton_, 64);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "headerButton");
  v3 = (id)objc_msgSend(v4, "identifier");
  objc_msgSend(location[0], "setIdentifier:");

  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "headerButton");
  v2 = objc_msgSend(v5, "isEnabled");
  objc_msgSend(location[0], "setEnabled:", v2 & 1);

  v7 = location[0];
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "headerButton");
  v8 = (id)objc_msgSend(v9, "image");
  objc_msgSend(v7, "setImage:forState:");

  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v4;
  id v5;
  CPListTemplate *v6;
  id v7;
  id v8;
  id v9;
  CPSSectionedDataSource *v10;
  NSUUID *v11;
  char isKindOfClass;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  CPListTemplate *v16;
  id v17;
  CPSSectionedDataSource *v18;
  NSIndexPath *v19;
  char v20;
  CPSSectionedDataSource *v21;
  id v22;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(id *);
  void *v28;
  id v29;
  id v30;
  id v31;
  char v32;
  id from;
  id v34;
  uint8_t v35[7];
  os_log_type_t v36;
  id v37;
  id v38;
  os_log_type_t v39;
  id v40;
  id v41;
  id v42;
  int v43;
  id v44;
  id location[2];
  CPSListTemplateViewController *v46;
  uint8_t v47[40];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v44 = 0;
  objc_storeStrong(&v44, a4);
  v22 = v44;
  v21 = -[CPSListTemplateViewController dataSource](v46, "dataSource");
  v19 = -[CPSSectionedDataSource assistantCellIndexPath](v21, "assistantCellIndexPath");
  v20 = objc_msgSend(v22, "isEqual:");

  if ((v20 & 1) == 0)
  {
    v18 = -[CPSListTemplateViewController dataSource](v46, "dataSource");
    v42 = -[CPSSectionedDataSource itemAtIndexPath:](v18, "itemAtIndexPath:", v44);

    v41 = CPListItemIdentifier(v42);
    v40 = CarPlaySupportGeneralLogging();
    v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v44;
      v16 = -[CPSListTemplateViewController listTemplate](v46, "listTemplate");
      __os_log_helper_16_2_3_8_66_8_66_8_64((uint64_t)v47, (uint64_t)v17, (uint64_t)v42, (uint64_t)v16);
      _os_log_impl(&dword_21E389000, (os_log_t)v40, v39, "Selected index path %{public}@, item %{public}@ in list template %@", v47, 0x20u);

    }
    objc_storeStrong(&v40, 0);
    if ((objc_msgSend(v42, "isEnabled") & 1) == 0)
    {
      objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v44, 1);
      v43 = 1;
LABEL_25:
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      goto LABEL_26;
    }
    v38 = -[CPSBaseTemplateViewController templateDelegate](v46, "templateDelegate");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = CarPlaySupportGeneralLogging();
      v36 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v37;
        v15 = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_impl(&dword_21E389000, v14, v15, "Activating Siri for message item.", v35, 2u);
      }
      objc_storeStrong(&v37, 0);
      v13 = (void *)objc_opt_class();
      v34 = CPSSafeCast_17(v13, v42);
      objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v44, 1);
      -[CPSListTemplateViewController _activateSiriForMessageItem:](v46, "_activateSiriForMessageItem:", v34);
      v43 = 1;
      objc_storeStrong(&v34, 0);
      goto LABEL_24;
    }
    objc_initWeak(&from, v46);
    v32 = 0;
    objc_opt_class();
    isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    v32 = isKindOfClass & 1;
    if ((isKindOfClass & 1) != 0)
    {
      v11 = -[CPSListTemplateViewController currentSpinningIdentifier](v46, "currentSpinningIdentifier");

      if (v11)
      {
        v43 = 1;
LABEL_23:
        objc_destroyWeak(&from);
LABEL_24:
        objc_storeStrong(&v38, 0);
        goto LABEL_25;
      }
      -[CPSListTemplateViewController _cancelScheduledLoadingSpinner](v46, "_cancelScheduledLoadingSpinner");
      -[CPSListTemplateViewController _scheduleLoadingSpinnerForIdentifier:](v46, "_scheduleLoadingSpinnerForIdentifier:", v41);
    }
    v31 = (id)objc_msgSend(location[0], "indexPathForSelectedRow");
    v10 = -[CPSListTemplateViewController dataSource](v46, "dataSource");
    v9 = -[CPSSectionedDataSource itemAtIndexPath:](v10, "itemAtIndexPath:", v31);
    v8 = CPListItemIdentifier(v9);
    -[CPSListTemplateViewController setLastFocusedItem:](v46, "setLastFocusedItem:");

    if (v31 && (objc_msgSend(v31, "isEqual:", v44) & 1) == 0)
      objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v31, 1);
    if ((objc_msgSend(v38, "conformsToProtocol:", &unk_255452448) & 1) != 0)
    {
      v7 = v38;
      v6 = -[CPSListTemplateViewController listTemplate](v46, "listTemplate");
      v4 = (id)-[CPListTemplate identifier](v6, "identifier");
      v5 = v41;
      v24 = MEMORY[0x24BDAC760];
      v25 = -1073741824;
      v26 = 0;
      v27 = __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v28 = &unk_24E2704E8;
      objc_copyWeak(&v30, &from);
      v29 = v41;
      objc_msgSend(v7, "listTemplateWithIdentifier:didSelectListItemWithIdentifier:completionHandler:", v4, v5, &v24);

      objc_storeStrong(&v29, 0);
      objc_destroyWeak(&v30);
    }
    objc_storeStrong(&v31, 0);
    v43 = 0;
    goto LABEL_23;
  }
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v44, 1);
  -[CPSListTemplateViewController _activateSiriForAssistantItem](v46, "_activateSiriForAssistantItem");
  v43 = 1;
LABEL_26:
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

void __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke(id *a1)
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9[3];

  v9[2] = a1;
  v9[1] = a1;
  queue = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v7 = &unk_24E2704E8;
  objc_copyWeak(v9, a1 + 5);
  v8 = a1[4];
  dispatch_async(queue, &v3);

  objc_storeStrong(&v8, 0);
  objc_destroyWeak(v9);
}

void __67__CPSListTemplateViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cellSelectionCompleted:", *(_QWORD *)(a1 + 32));

}

- (void)didSelectMediaButton:(id)a3
{
  CPTemplateDelegate *v3;
  CPTemplateDelegate *v4;
  char v5;
  id v6;
  id location[2];
  CPSListTemplateViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "identifier");
  v4 = -[CPSBaseTemplateViewController templateDelegate](v8, "templateDelegate");
  v5 = -[CPTemplateDelegate conformsToProtocol:](v4, "conformsToProtocol:", &unk_25544C5F8);

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBaseTemplateViewController templateDelegate](v8, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v6);

  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_activateSiriForMessageItem:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  CPSTemplateViewControllerDelegate *v9;
  void *v10;
  id v11;
  NSString *v12;
  CPSTemplateEnvironment *v13;
  void *v14;
  id v15;
  NSString *v16;
  CPSTemplateEnvironment *v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  NSString *v23;
  CPSTemplateEnvironment *v24;
  id v25;
  BOOL v26;
  char v27;
  id v28;
  id v29;
  id location[2];
  CPSListTemplateViewController *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  v25 = (id)objc_msgSend(location[0], "text");
  v27 = 0;
  v26 = 0;
  if (v25)
  {
    v28 = (id)objc_msgSend(location[0], "phoneOrEmailAddress");
    v27 = 1;
    v26 = v28 != 0;
  }
  if ((v27 & 1) != 0)

  if (v26)
  {
    v20 = (void *)MEMORY[0x24BE90820];
    v24 = -[CPSBaseTemplateViewController templateEnvironment](v31, "templateEnvironment");
    v23 = -[CPSTemplateEnvironment bundleIdentifier](v24, "bundleIdentifier");
    v22 = (id)objc_msgSend(location[0], "text");
    v21 = (id)objc_msgSend(location[0], "phoneOrEmailAddress");
    v3 = (id)objc_msgSend(v20, "messageComposeNewThreadDirectActionWithAppBundleId:fullName:phoneOrEmailAddress:", v23, v22);
    v4 = v29;
    v29 = v3;

  }
  else
  {
    v18 = (id)objc_msgSend(location[0], "leadingConfiguration");
    v19 = objc_msgSend(v18, "isUnread");

    if ((v19 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x24BE90820];
      v17 = -[CPSBaseTemplateViewController templateEnvironment](v31, "templateEnvironment");
      v16 = -[CPSTemplateEnvironment bundleIdentifier](v17, "bundleIdentifier");
      v15 = (id)objc_msgSend(location[0], "conversationIdentifier");
      v5 = (id)objc_msgSend(v14, "messageReadDirectActionWithAppBundleId:conversationGUID:", v16);
      v6 = v29;
      v29 = v5;

    }
    else
    {
      v10 = (void *)MEMORY[0x24BE90820];
      v13 = -[CPSBaseTemplateViewController templateEnvironment](v31, "templateEnvironment");
      v12 = -[CPSTemplateEnvironment bundleIdentifier](v13, "bundleIdentifier");
      v11 = (id)objc_msgSend(location[0], "conversationIdentifier");
      v7 = (id)objc_msgSend(v10, "messageReplyDirectActionWithAppBundleId:conversationGUID:", v12);
      v8 = v29;
      v29 = v7;

    }
  }
  v9 = -[CPSBaseTemplateViewController viewControllerDelegate](v31, "viewControllerDelegate");
  -[CPSTemplateViewControllerDelegate templateViewController:shouldActivateSiriWithDirectActionContext:](v9, "templateViewController:shouldActivateSiriWithDirectActionContext:", v31, v29);

  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_activateSiriForAssistantItem
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  CPSTemplateViewControllerDelegate *v6;
  void *v7;
  NSString *v8;
  CPSTemplateEnvironment *v9;
  CPSTemplateEnvironment *v10;
  char v11;
  void *v12;
  NSString *v13;
  CPSTemplateEnvironment *v14;
  CPAssistantCellConfiguration *v15;
  CPListTemplate *v16;
  void *v17;
  CPSTemplateEnvironment *v18;
  char v19;
  id v20[2];
  _BYTE v21[9];
  SEL v22;
  CPSListTemplateViewController *v23;

  v23 = self;
  v22 = a2;
  v21[8] = 0;
  *(_QWORD *)v21 = -[CPSListTemplateViewController assistantCellAvailable](self, "assistantCellAvailable");
  v16 = -[CPSListTemplateViewController listTemplate](v23, "listTemplate");
  v15 = -[CPListTemplate assistantCellConfiguration](v16, "assistantCellConfiguration");
  v17 = -[CPAssistantCellConfiguration assistantAction](v15, "assistantAction");

  v20[1] = v17;
  v20[0] = +[CPSListTemplateViewController intentIdentifierFromConfigurationEnum:](CPSListTemplateViewController, "intentIdentifierFromConfigurationEnum:", v17);
  v18 = -[CPSBaseTemplateViewController templateEnvironment](v23, "templateEnvironment");
  v19 = 0;
  if (-[CPSTemplateEnvironment hasAudioEntitlement](v18, "hasAudioEntitlement"))
    v19 = v21[0];

  if ((v19 & 1) != 0)
  {
    if ((objc_msgSend(v20[0], "isEqualToString:", CFSTR("INPlayMediaIntent")) & 1) != 0)
    {
      v12 = (void *)MEMORY[0x24BE90820];
      v14 = -[CPSBaseTemplateViewController templateEnvironment](v23, "templateEnvironment");
      v13 = -[CPSTemplateEnvironment bundleIdentifier](v14, "bundleIdentifier");
      v2 = (id)objc_msgSend(v12, "musicSearchDirectActionWithAppBundleId:");
      v3 = *(void **)&v21[1];
      *(_QWORD *)&v21[1] = v2;

    }
  }
  else
  {
    v10 = -[CPSBaseTemplateViewController templateEnvironment](v23, "templateEnvironment");
    v11 = 0;
    if (-[CPSTemplateEnvironment hasCommunicationEntitlement](v10, "hasCommunicationEntitlement"))
      v11 = v21[0];

    if ((v11 & 1) != 0)
    {
      if ((objc_msgSend(v20[0], "isEqualToString:", CFSTR("INStartCallIntent")) & 1) != 0)
      {
        v7 = (void *)MEMORY[0x24BE90820];
        v9 = -[CPSBaseTemplateViewController templateEnvironment](v23, "templateEnvironment");
        v8 = -[CPSTemplateEnvironment bundleIdentifier](v9, "bundleIdentifier");
        v4 = (id)objc_msgSend(v7, "phoneCallDirectActionWithAppBundleId:");
        v5 = *(void **)&v21[1];
        *(_QWORD *)&v21[1] = v4;

      }
    }
    else
    {
      objc_storeStrong((id *)&v21[1], 0);
    }
  }
  if (*(_QWORD *)&v21[1])
  {
    v6 = -[CPSBaseTemplateViewController viewControllerDelegate](v23, "viewControllerDelegate");
    -[CPSTemplateViewControllerDelegate templateViewController:shouldActivateSiriWithDirectActionContext:](v6, "templateViewController:shouldActivateSiriWithDirectActionContext:", v23, *(_QWORD *)&v21[1]);

  }
  objc_storeStrong(v20, 0);
  objc_storeStrong((id *)&v21[1], 0);
}

+ (id)intentIdentifierFromConfigurationEnum:(int64_t)a3
{
  id v4;
  id location[4];

  location[3] = a1;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  if (a3)
  {
    if (a3 == 1)
      objc_storeStrong(location, CFSTR("INStartCallIntent"));
  }
  else
  {
    objc_storeStrong(location, CFSTR("INPlayMediaIntent"));
  }
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

+ (BOOL)clientAssistantCellConfiguration:(id)a3 availableWithError:(id *)a4 templateEnvironment:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v23;
  int v24;
  id v25;
  id v26;
  id *v27;
  id location[3];
  char v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = 0;
  objc_storeStrong(&v26, a5);
  v25 = 0;
  if ((objc_msgSend(v26, "hasAudioEntitlement") & 1) != 0)
  {
    v19 = (void *)MEMORY[0x24BDBCF20];
    v35[0] = CFSTR("INPlayMediaIntent");
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v5 = (id)objc_msgSend(v19, "setWithArray:");
    v6 = v25;
    v25 = v5;

LABEL_8:
    v23 = +[CPSListTemplateViewController intentIdentifierFromConfigurationEnum:](CPSListTemplateViewController, "intentIdentifierFromConfigurationEnum:", objc_msgSend(location[0], "assistantAction"));
    if ((objc_msgSend(v25, "containsObject:", v23) & 1) != 0)
    {
      v29 = objc_msgSend(v26, "applicationSupportsIntentWithIdentifier:error:", v23, v27) & 1;
      v24 = 1;
    }
    else
    {
      if (v27)
      {
        v12 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD0FC8];
        v14 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Intent of type %@ is not supported for this app category"), v23);
        v31 = v14;
        v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v10 = (id)objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("CPSErrorDomain"), -1);
        *v27 = v10;

      }
      v29 = 0;
      v24 = 1;
    }
    objc_storeStrong(&v23, 0);
    goto LABEL_14;
  }
  if ((objc_msgSend(v26, "hasCommunicationEntitlement") & 1) != 0)
  {
    v17 = (void *)MEMORY[0x24BDBCF20];
    v34 = CFSTR("INStartCallIntent");
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v7 = (id)objc_msgSend(v17, "setWithArray:");
    v8 = v25;
    v25 = v7;

    goto LABEL_8;
  }
  if (v27)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    v33 = CFSTR("Attempting to set an Assistant Cell on an unsupported app category. Assistant Cells are only supported on apps with an audio or communication entitlement.");
    v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v9 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CPSErrorDomain"), -1);
    *v27 = v9;

  }
  v29 = 0;
  v24 = 1;
LABEL_14:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v29 & 1;
}

- (void)nowPlayingManager:(id)a3 didUpdateSnapshot:(id)a4
{
  id v5;
  id location[2];
  CPSListTemplateViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSListTemplateViewController _updatePlayingIndicators](v7, "_updatePlayingIndicators");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)_playingIndicatorStateForSnapshot:(id)a3
{
  CPSTemplateEnvironment *v4;
  id v5;
  NSString *v6;
  BOOL v7;
  id location[2];
  CPSListTemplateViewController *v9;
  int64_t v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(location[0], "bundleIdentifier");
  v4 = -[CPSBaseTemplateViewController templateEnvironment](v9, "templateEnvironment");
  v6 = -[CPSTemplateEnvironment bundleIdentifier](v4, "bundleIdentifier");
  v7 = 0;
  if ((objc_msgSend(v5, "isEqualToString:") & 1) != 0)
    v7 = objc_msgSend(location[0], "state") == 2;

  if (v7)
    v10 = 1;
  else
    v10 = 2;
  objc_storeStrong(location, 0);
  return v10;
}

- (void)_updatePlayingIndicators
{
  CPUINowPlayingManager *v2;
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9[2];
  void *v10;
  id v11[2];
  CPSListTemplateViewController *v12;

  v12 = self;
  v11[1] = (id)a2;
  v2 = -[CPSListTemplateViewController nowPlayingManager](self, "nowPlayingManager");
  v11[0] = (id)-[CPUINowPlayingManager snapshot](v2, "snapshot");

  v10 = -[CPSListTemplateViewController _playingIndicatorStateForSnapshot:](v12, "_playingIndicatorStateForSnapshot:", v11[0]);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__CPSListTemplateViewController__updatePlayingIndicators__block_invoke;
  v8 = &unk_24E26FB48;
  v9[0] = v12;
  v9[1] = v10;
  dispatch_async(queue, &v4);

  objc_storeStrong(v9, 0);
  objc_storeStrong(v11, 0);
}

void __57__CPSListTemplateViewController__updatePlayingIndicators__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v13;
  id obj;
  uint64_t v15;
  id location;
  id v17;
  _QWORD __b[8];
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = a1;
  v20 = a1;
  memset(__b, 0, sizeof(__b));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "tableView");
  obj = (id)objc_msgSend(v13, "visibleCells");

  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
  if (v15)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v15;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v19 = *(void **)(__b[1] + 8 * v10);
      v1 = (void *)objc_opt_class();
      v17 = CPSSafeCast_17(v1, v19);
      if (v17)
      {
        v3 = (void *)objc_opt_class();
        v7 = (id)objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v6 = (id)objc_msgSend(*(id *)(a1 + 32), "tableView");
        v5 = (id)objc_msgSend(v6, "indexPathForCell:", v17);
        v4 = (id)objc_msgSend(v7, "itemAtIndexPath:");
        location = CPSSafeCast_17(v3, v4);

        if ((objc_msgSend(location, "isPlaying") & 1) != 0)
        {
          v2 = (id)objc_msgSend(v17, "nowPlayingIndicator");
          objc_msgSend(v2, "setPlaybackState:", *(_QWORD *)(a1 + 40));

        }
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v17, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
        if (!v11)
          break;
      }
    }
  }

}

- (id)preferredFocusEnvironments
{
  id v2;
  id v3;
  NSUUID *v5;
  CPSSectionedDataSource *v6;
  CPSTableView *v7;
  NSUUID *v8;
  objc_super v9;
  int v10;
  id v11;
  id v12[2];
  CPSListTemplateViewController *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = 0;
  v8 = -[CPSListTemplateViewController lastFocusedItem](self, "lastFocusedItem");

  if (v8)
  {
    v6 = -[CPSListTemplateViewController dataSource](v13, "dataSource");
    v5 = -[CPSListTemplateViewController lastFocusedItem](v13, "lastFocusedItem");
    v11 = -[CPSSectionedDataSource indexPathForItemWithIdentifier:](v6, "indexPathForItemWithIdentifier:");

    v7 = -[CPSListTemplateViewController tableView](v13, "tableView");
    v2 = (id)-[CPSTableView cellForRowAtIndexPath:](v7, "cellForRowAtIndexPath:", v11);
    v3 = v12[0];
    v12[0] = v2;

    objc_storeStrong(&v11, 0);
  }
  if (v12[0])
  {
    v15[0] = v12[0];
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  }
  else
  {
    v9.receiver = v13;
    v9.super_class = (Class)CPSListTemplateViewController;
    v14 = -[CPSListTemplateViewController preferredFocusEnvironments](&v9, sel_preferredFocusEnvironments);
  }
  v10 = 1;
  objc_storeStrong(v12, 0);
  return v14;
}

- (CPSSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSUUID)currentSpinningIdentifier
{
  return self->_currentSpinningIdentifier;
}

- (void)setCurrentSpinningIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSUUID)nextSpinningIdentifier
{
  return self->_nextSpinningIdentifier;
}

- (void)setNextSpinningIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (unint64_t)spinnerState
{
  return self->_spinnerState;
}

- (void)setSpinnerState:(unint64_t)a3
{
  self->_spinnerState = a3;
}

- (NSTimer)spinnerStartTimer
{
  return self->_spinnerStartTimer;
}

- (void)setSpinnerStartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerStartTimer, a3);
}

- (NSTimer)spinnerTimeoutTimer
{
  return self->_spinnerTimeoutTimer;
}

- (void)setSpinnerTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerTimeoutTimer, a3);
}

- (CPSTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (CPUINowPlayingManager)nowPlayingManager
{
  return self->_nowPlayingManager;
}

- (void)setNowPlayingManager:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingManager, a3);
}

- (CPSEmptyView)emptyView
{
  return self->_emptyView;
}

- (void)setEmptyView:(id)a3
{
  objc_storeStrong((id *)&self->_emptyView, a3);
}

- (NSUUID)lastFocusedItem
{
  return self->_lastFocusedItem;
}

- (void)setLastFocusedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastFocusedItem, a3);
}

- (BOOL)assistantCellAvailable
{
  return self->_assistantCellAvailable;
}

- (void)setAssistantCellAvailable:(BOOL)a3
{
  self->_assistantCellAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFocusedItem, 0);
  objc_storeStrong((id *)&self->_emptyView, 0);
  objc_storeStrong((id *)&self->_nowPlayingManager, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_spinnerTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_spinnerStartTimer, 0);
  objc_storeStrong((id *)&self->_nextSpinningIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSpinningIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
