@implementation BuddySoftwareUpdateController

- (BuddySoftwareUpdateController)init
{
  NSBundle *v3;
  NSString *v4;
  BuddySoftwareUpdateController *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSNotificationCenter *v13;
  BuddySoftwareUpdateController *v14;
  objc_super v16;
  SEL v17;
  id location;

  v17 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE"), &stru_100284738, CFSTR("SoftwareUpdate"));
  location = 0;
  v16.receiver = self;
  v16.super_class = (Class)BuddySoftwareUpdateController;
  v5 = -[BuddySoftwareUpdateController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v16, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, 0, 0, 1);
  location = v5;
  objc_storeStrong(&location, v5);

  if (v5)
  {
    v6 = objc_alloc((Class)sub_10013AEA4());
    v7 = objc_msgSend(v6, "initWithDelegate:hostController:", location, location);
    v8 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v7;

    v9 = (void *)*((_QWORD *)location + 1);
    v10 = +[RUIStyle setupAssistantModalStyle](RUIStyle, "setupAssistantModalStyle");
    objc_msgSend(v9, "setServerFlowStyle:", v10);

    v11 = objc_msgSend(objc_alloc((Class)sub_10013AF90()), "initWithStyle:reuseIdentifier:specifier:", 3, 0, 0);
    v12 = (void *)*((_QWORD *)location + 2);
    *((_QWORD *)location + 2) = v11;

    objc_msgSend(*((id *)location + 2), "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v13 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v13, "addObserver:selector:name:object:", location, "didBecomeActive:", UIApplicationDidBecomeActiveNotification, 0);

  }
  v14 = (BuddySoftwareUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v14;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  BuddySoftwareUpdateController *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)BuddySoftwareUpdateController;
  -[BuddySoftwareUpdateController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  const __CFString *v4;
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  id v10;
  const char *v11;
  unsigned __int8 v12;
  const char *v13;
  id v14;
  BuddySoftwareUpdateController *v15;
  id v16;
  BuddySoftwareUpdateController *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SUSSoftwareUpdateTitleCell *v23;
  SUSSoftwareUpdateTitleCell *titleCell;
  BuddySoftwareUpdateController *v25;
  NSBundle *v26;
  NSString *v27;
  OBBoldTrayButton *v28;
  OBBoldTrayButton *updateNowButton;
  id v30;
  BuddySoftwareUpdateController *v31;
  NSBundle *v32;
  NSString *v33;
  OBLinkTrayButton *v34;
  OBLinkTrayButton *updateTonightButton;
  id v36;
  BuddySoftwareUpdateController *v37;
  NSBundle *v38;
  NSString *v39;
  OBLinkTrayButton *v40;
  OBLinkTrayButton *skipButton;
  id v42;
  char v43;
  __CFString *v44;
  char v45;
  id v46;
  char v47;
  __CFString *v48;
  char v49;
  id v50;
  os_log_t oslog;
  objc_super v52;
  SEL v53;
  BuddySoftwareUpdateController *v54;
  uint8_t buf[96];

  v54 = self;
  v53 = a2;
  v52.receiver = self;
  v52.super_class = (Class)BuddySoftwareUpdateController;
  v2 = -[BuddySoftwareUpdateController viewDidLoad](&v52, "viewDidLoad");
  oslog = (os_log_t)(id)_BYLoggingFacility(v2);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[SUSUISoftwareUpdateManager preferredUpdate](v54->_manager, "preferredUpdate");
    v49 = 0;
    v47 = 0;
    if (v3)
    {
      v50 = -[SUSUISoftwareUpdateManager preferredUpdate](v54->_manager, "preferredUpdate");
      v49 = 1;
      v4 = (const __CFString *)objc_msgSend(v50, "humanReadableUpdateName");
      v48 = (__CFString *)v4;
      v47 = 1;
    }
    else
    {
      v4 = CFSTR("N/A");
    }
    v5 = -[SUSUISoftwareUpdateManager preferredUpdate](v54->_manager, "preferredUpdate");
    v6 = -[SUSUISoftwareUpdateManager preferredUpdateError](v54->_manager, "preferredUpdateError");
    v7 = -[SUSUISoftwareUpdateManager alternateUpdate](v54->_manager, "alternateUpdate");
    v45 = 0;
    v43 = 0;
    if (v7)
    {
      v46 = -[SUSUISoftwareUpdateManager alternateUpdate](v54->_manager, "alternateUpdate");
      v45 = 1;
      v8 = (const __CFString *)objc_msgSend(v46, "humanReadableUpdateName");
      v44 = (__CFString *)v8;
      v43 = 1;
    }
    else
    {
      v8 = CFSTR("N/A");
    }
    v9 = -[SUSUISoftwareUpdateManager alternateUpdate](v54->_manager, "alternateUpdate");
    v10 = -[SUSUISoftwareUpdateManager alternateUpdateError](v54->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v54->_manager, "isDelayingUpdates") & 1) != 0)
      v11 = "YES";
    else
      v11 = "NO";
    v12 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v54->_manager, "automaticUpdateScheduled");
    v13 = "YES";
    if ((v12 & 1) == 0)
      v13 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController viewDidLoad]", (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v43 & 1) != 0)
    if ((v45 & 1) != 0)

    if ((v47 & 1) != 0)
    if ((v49 & 1) != 0)

  }
  objc_storeStrong((id *)&oslog, 0);
  v14 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[BuddySoftwareUpdateController setTableView:](v54, "setTableView:", v14);

  v15 = v54;
  v16 = -[BuddySoftwareUpdateController tableView](v54, "tableView");
  objc_msgSend(v16, "setDelegate:", v15);

  v17 = v54;
  v18 = -[BuddySoftwareUpdateController tableView](v54, "tableView");
  objc_msgSend(v18, "setDataSource:", v17);

  v19 = -[BuddySoftwareUpdateController tableView](v54, "tableView");
  objc_msgSend(v19, "setRowHeight:", UITableViewAutomaticDimension);

  v20 = -[BuddySoftwareUpdateController tableView](v54, "tableView");
  objc_msgSend(v20, "setEstimatedRowHeight:", 0.0);

  v21 = -[BuddySoftwareUpdateController tableView](v54, "tableView");
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = -[BuddySoftwareUpdateController tableView](v54, "tableView");
  objc_msgSend(v22, "setAlwaysBounceVertical:", 0);

  v23 = (SUSSoftwareUpdateTitleCell *)objc_msgSend(objc_alloc((Class)sub_10013AF90()), "initWithStyle:reuseIdentifier:specifier:", 3, 0, 0);
  titleCell = v54->_titleCell;
  v54->_titleCell = v23;

  -[SUSSoftwareUpdateTitleCell setSeparatorInset:](v54->_titleCell, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v25 = v54;
  v26 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v27 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", CFSTR("DOWNLOAD_AND_INSTALL"), &stru_100284738, CFSTR("SoftwareUpdate"));
  v28 = (OBBoldTrayButton *)-[BuddySoftwareUpdateController createBoldButtonWithTitle:action:](v25, "createBoldButtonWithTitle:action:", v27, "beginDownloadingUpdate");
  updateNowButton = v54->_updateNowButton;
  v54->_updateNowButton = v28;

  v30 = -[BuddySoftwareUpdateController buttonTray](v54, "buttonTray");
  objc_msgSend(v30, "addButton:", v54->_updateNowButton);

  if (-[BuddySoftwareUpdateController allowUserToInstallTonight](v54, "allowUserToInstallTonight"))
  {
    v31 = v54;
    v32 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v33 = -[NSBundle localizedStringForKey:value:table:](v32, "localizedStringForKey:value:table:", CFSTR("INSTALL_TONIGHT"), &stru_100284738, CFSTR("SoftwareUpdate"));
    v34 = (OBLinkTrayButton *)-[BuddySoftwareUpdateController createLinkButtonWithTitle:action:](v31, "createLinkButtonWithTitle:action:", v33, "installTonightPressed");
    updateTonightButton = v54->_updateTonightButton;
    v54->_updateTonightButton = v34;

    v36 = -[BuddySoftwareUpdateController buttonTray](v54, "buttonTray");
    objc_msgSend(v36, "addButton:", v54->_updateTonightButton);

  }
  if (-[BuddySoftwareUpdateController allowUserToSkip](v54, "allowUserToSkip"))
  {
    v37 = v54;
    v38 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v39 = -[NSBundle localizedStringForKey:value:table:](v38, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_100284738, CFSTR("SoftwareUpdate"));
    v40 = (OBLinkTrayButton *)-[BuddySoftwareUpdateController createLinkButtonWithTitle:action:](v37, "createLinkButtonWithTitle:action:", v39, "skipPressed");
    skipButton = v54->_skipButton;
    v54->_skipButton = v40;

    v42 = -[BuddySoftwareUpdateController buttonTray](v54, "buttonTray");
    objc_msgSend(v42, "addButton:", v54->_skipButton);

  }
}

- (void)scanForUpdateCompletion:(id)a3
{
  SUSUISoftwareUpdateManager *manager;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  BuddySoftwareUpdateController *v9;
  id v10;
  id v11;
  id from;
  id location[2];
  BuddySoftwareUpdateController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  manager = v14->_manager;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10013BAB8;
  v8 = &unk_100283528;
  objc_copyWeak(&v11, &from);
  v9 = v14;
  v10 = location[0];
  -[SUSUISoftwareUpdateManager scanForUpdatesCompletion:](manager, "scanForUpdatesCompletion:", &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  BuddySoftwareUpdateController *v4;
  SUSUISoftwareUpdateManager *manager;
  id v6;
  objc_super v7;
  BOOL v8;
  SEL v9;
  BuddySoftwareUpdateController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddySoftwareUpdateController;
  -[BuddySoftwareUpdateController viewWillAppear:](&v7, "viewWillAppear:", a3);
  v3 = -[BuddySoftwareUpdateController tableView](v10, "tableView");
  objc_msgSend(v3, "reloadData");

  if ((-[BuddySoftwareUpdateController isMovingToParentViewController](v10, "isMovingToParentViewController") & 1) != 0)
  {
    v4 = v10;
    manager = v10->_manager;
    v6 = -[SUSUISoftwareUpdateManager state](manager, "state");
    -[BuddySoftwareUpdateController manager:didTransitionToState:fromState:](v4, "manager:didTransitionToState:fromState:", manager, v6, -[SUSUISoftwareUpdateManager state](v10->_manager, "state"));
    -[SUSUISoftwareUpdateManager refreshState](v10->_manager, "refreshState");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  const __CFString *v5;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  id v10;
  id v11;
  const char *v12;
  unsigned __int8 v13;
  const char *v14;
  id v15;
  id v16;
  id v17;
  char v18;
  __CFString *v19;
  char v20;
  id v21;
  char v22;
  __CFString *v23;
  char v24;
  id v25;
  os_log_t oslog;
  objc_super v27;
  BOOL v28;
  SEL v29;
  BuddySoftwareUpdateController *v30;
  uint8_t buf[96];

  v30 = self;
  v29 = a2;
  v28 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BuddySoftwareUpdateController;
  v3 = -[BuddySoftwareUpdateController viewDidAppear:](&v27, "viewDidAppear:", a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v30->_manager, "preferredUpdate");
    v24 = 0;
    v22 = 0;
    if (v4)
    {
      v25 = -[SUSUISoftwareUpdateManager preferredUpdate](v30->_manager, "preferredUpdate");
      v24 = 1;
      v5 = (const __CFString *)objc_msgSend(v25, "humanReadableUpdateName");
      v23 = (__CFString *)v5;
      v22 = 1;
    }
    else
    {
      v5 = CFSTR("N/A");
    }
    v6 = -[SUSUISoftwareUpdateManager preferredUpdate](v30->_manager, "preferredUpdate");
    v7 = -[SUSUISoftwareUpdateManager preferredUpdateError](v30->_manager, "preferredUpdateError");
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v30->_manager, "alternateUpdate");
    v20 = 0;
    v18 = 0;
    if (v8)
    {
      v21 = -[SUSUISoftwareUpdateManager alternateUpdate](v30->_manager, "alternateUpdate");
      v20 = 1;
      v9 = (const __CFString *)objc_msgSend(v21, "humanReadableUpdateName");
      v19 = (__CFString *)v9;
      v18 = 1;
    }
    else
    {
      v9 = CFSTR("N/A");
    }
    v10 = -[SUSUISoftwareUpdateManager alternateUpdate](v30->_manager, "alternateUpdate");
    v11 = -[SUSUISoftwareUpdateManager alternateUpdateError](v30->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v30->_manager, "isDelayingUpdates") & 1) != 0)
      v12 = "YES";
    else
      v12 = "NO";
    v13 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v30->_manager, "automaticUpdateScheduled");
    v14 = "YES";
    if ((v13 & 1) == 0)
      v14 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController viewDidAppear:]", (uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v18 & 1) != 0)
    if ((v20 & 1) != 0)

    if ((v22 & 1) != 0)
    if ((v24 & 1) != 0)

  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSSoftwareUpdateTitleCell setAnimatingGearView:](v30->_titleCell, "setAnimatingGearView:", -[SUSUISoftwareUpdateManager state](v30->_manager, "state") == 12);
  v15 = -[BuddySoftwareUpdateController tableView](v30, "tableView");
  v16 = -[BuddySoftwareUpdateController tableView](v30, "tableView");
  v17 = objc_msgSend(v16, "indexPathForSelectedRow");
  objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v17, 1);

}

- (void)didBecomeActive:(id)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  id v10;
  const char *v11;
  unsigned __int8 v12;
  const char *v13;
  char v14;
  __CFString *v15;
  char v16;
  id v17;
  char v18;
  __CFString *v19;
  char v20;
  id v21;
  os_log_t oslog;
  id location[2];
  BuddySoftwareUpdateController *v24;
  uint8_t buf[112];

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(-[SUSUISoftwareUpdateManager refreshState](v24->_manager, "refreshState"));
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = -[SUSUISoftwareUpdateManager preferredUpdate](v24->_manager, "preferredUpdate");
    v20 = 0;
    v18 = 0;
    if (v3)
    {
      v21 = -[SUSUISoftwareUpdateManager preferredUpdate](v24->_manager, "preferredUpdate");
      v20 = 1;
      v4 = (const __CFString *)objc_msgSend(v21, "humanReadableUpdateName");
      v19 = (__CFString *)v4;
      v18 = 1;
    }
    else
    {
      v4 = CFSTR("N/A");
    }
    v5 = -[SUSUISoftwareUpdateManager preferredUpdate](v24->_manager, "preferredUpdate");
    v6 = -[SUSUISoftwareUpdateManager preferredUpdateError](v24->_manager, "preferredUpdateError");
    v7 = -[SUSUISoftwareUpdateManager alternateUpdate](v24->_manager, "alternateUpdate");
    v16 = 0;
    v14 = 0;
    if (v7)
    {
      v17 = -[SUSUISoftwareUpdateManager alternateUpdate](v24->_manager, "alternateUpdate");
      v16 = 1;
      v8 = (const __CFString *)objc_msgSend(v17, "humanReadableUpdateName");
      v15 = (__CFString *)v8;
      v14 = 1;
    }
    else
    {
      v8 = CFSTR("N/A");
    }
    v9 = -[SUSUISoftwareUpdateManager alternateUpdate](v24->_manager, "alternateUpdate");
    v10 = -[SUSUISoftwareUpdateManager alternateUpdateError](v24->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v24->_manager, "isDelayingUpdates") & 1) != 0)
      v11 = "YES";
    else
      v11 = "NO";
    v12 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v24->_manager, "automaticUpdateScheduled");
    v13 = "YES";
    if ((v12 & 1) == 0)
      v13 = "NO";
    sub_10013C99C((uint64_t)buf, (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v13, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nNotification: %@", buf, 0x66u);

    if ((v14 & 1) != 0)
    if ((v16 & 1) != 0)

    if ((v18 & 1) != 0)
    if ((v20 & 1) != 0)

  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)beginDownloadingUpdate
{
  id v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  id v9;
  unsigned __int8 v10;
  const char *v11;
  unsigned __int8 v12;
  const char *v13;
  SUSUISoftwareUpdateManager *manager;
  uint64_t v15;
  id v16;
  void **v17;
  int v18;
  int v19;
  void (*v20)(id *, char, id);
  void *v21;
  BuddySoftwareUpdateController *v22;
  id v23;
  id from;
  char v25;
  __CFString *v26;
  char v27;
  id v28;
  char v29;
  __CFString *v30;
  char v31;
  id v32;
  os_log_type_t v33;
  os_log_t location[2];
  BuddySoftwareUpdateController *v35;
  uint8_t buf[104];

  v35 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = -[SUSUISoftwareUpdateManager preferredUpdate](v35->_manager, "preferredUpdate");
    v31 = 0;
    v29 = 0;
    if (v2)
    {
      v32 = -[SUSUISoftwareUpdateManager preferredUpdate](v35->_manager, "preferredUpdate");
      v31 = 1;
      v3 = (const __CFString *)objc_msgSend(v32, "humanReadableUpdateName");
      v30 = (__CFString *)v3;
      v29 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v35->_manager, "preferredUpdate");
    v5 = -[SUSUISoftwareUpdateManager preferredUpdateError](v35->_manager, "preferredUpdateError");
    v6 = -[SUSUISoftwareUpdateManager alternateUpdate](v35->_manager, "alternateUpdate");
    v27 = 0;
    v25 = 0;
    if (v6)
    {
      v7 = v6;
      v28 = -[SUSUISoftwareUpdateManager alternateUpdate](v35->_manager, "alternateUpdate");
      v27 = 1;
      v8 = (const __CFString *)objc_msgSend(v28, "humanReadableUpdateName");
      v26 = (__CFString *)v8;
      v25 = 1;
    }
    else
    {
      v7 = 0;
      v8 = CFSTR("N/A");
    }
    v9 = -[SUSUISoftwareUpdateManager alternateUpdate](v35->_manager, "alternateUpdate");
    v16 = -[SUSUISoftwareUpdateManager alternateUpdateError](v35->_manager, "alternateUpdateError");
    v10 = -[SUSUISoftwareUpdateManager isDelayingUpdates](v35->_manager, "isDelayingUpdates");
    v11 = "NO";
    if ((v10 & 1) != 0)
      v11 = "YES";
    v15 = (uint64_t)v11;
    v12 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v35->_manager, "automaticUpdateScheduled");
    v13 = "NO";
    if ((v12 & 1) != 0)
      v13 = "YES";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController beginDownloadingUpdate]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v8, (uint64_t)v9, (uint64_t)v16, v15, (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, location[0], v33, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v25 & 1) != 0)
    if ((v27 & 1) != 0)

    if ((v29 & 1) != 0)
    if ((v31 & 1) != 0)

  }
  objc_storeStrong((id *)location, 0);
  -[OBBoldTrayButton showsBusyIndicator](v35->_updateNowButton, "showsBusyIndicator");
  -[BuddySoftwareUpdateController _allButtonsSetEnabled:](v35, "_allButtonsSetEnabled:", 0);
  objc_initWeak(&from, v35);
  manager = v35->_manager;
  v17 = _NSConcreteStackBlock;
  v18 = -1073741824;
  v19 = 0;
  v20 = sub_10013CF2C;
  v21 = &unk_100282B28;
  objc_copyWeak(&v23, &from);
  v22 = v35;
  -[SUSUISoftwareUpdateManager startDownloadAndInstall:withHandler:](manager, "startDownloadAndInstall:withHandler:", 1, &v17);
  objc_storeStrong((id *)&v22, 0);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
}

- (void)downloadAndInstallPressed
{
  id v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  const char *v10;
  unsigned __int8 v11;
  const char *v12;
  char v13;
  __CFString *v14;
  char v15;
  id v16;
  char v17;
  __CFString *v18;
  char v19;
  id v20;
  os_log_t oslog[2];
  BuddySoftwareUpdateController *v22;
  uint8_t buf[96];

  v22 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
    v19 = 0;
    v17 = 0;
    if (v2)
    {
      v20 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
      v19 = 1;
      v3 = (const __CFString *)objc_msgSend(v20, "humanReadableUpdateName");
      v18 = (__CFString *)v3;
      v17 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
    v5 = -[SUSUISoftwareUpdateManager preferredUpdateError](v22->_manager, "preferredUpdateError");
    v6 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
    v15 = 0;
    v13 = 0;
    if (v6)
    {
      v16 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
      v15 = 1;
      v7 = (const __CFString *)objc_msgSend(v16, "humanReadableUpdateName");
      v14 = (__CFString *)v7;
      v13 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
    v9 = -[SUSUISoftwareUpdateManager alternateUpdateError](v22->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v22->_manager, "isDelayingUpdates") & 1) != 0)
      v10 = "YES";
    else
      v10 = "NO";
    v11 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v22->_manager, "automaticUpdateScheduled");
    v12 = "YES";
    if ((v11 & 1) == 0)
      v12 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController downloadAndInstallPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v13 & 1) != 0)
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if ((v19 & 1) != 0)

  }
  objc_storeStrong((id *)oslog, 0);
  v22->_userChoice = 1;
  -[BuddySoftwareUpdateController beginDownloadingUpdate](v22, "beginDownloadingUpdate");
}

- (void)installTonightPressed
{
  id v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  unsigned __int8 v9;
  const char *v10;
  unsigned __int8 v11;
  const char *v12;
  id v13;
  id v14;
  SUSUISoftwareUpdateManager *manager;
  uint64_t v16;
  id v17;
  void **v18;
  int v19;
  int v20;
  void (*v21)(id *, char, id);
  void *v22;
  id v23;
  id from;
  char v25;
  __CFString *v26;
  char v27;
  id v28;
  char v29;
  __CFString *v30;
  char v31;
  id v32;
  os_log_type_t v33;
  os_log_t location[2];
  BuddySoftwareUpdateController *v35;
  uint8_t buf[104];

  v35 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = -[SUSUISoftwareUpdateManager preferredUpdate](v35->_manager, "preferredUpdate");
    v31 = 0;
    v29 = 0;
    if (v2)
    {
      v32 = -[SUSUISoftwareUpdateManager preferredUpdate](v35->_manager, "preferredUpdate");
      v31 = 1;
      v3 = (const __CFString *)objc_msgSend(v32, "humanReadableUpdateName");
      v30 = (__CFString *)v3;
      v29 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v35->_manager, "preferredUpdate");
    v5 = -[SUSUISoftwareUpdateManager preferredUpdateError](v35->_manager, "preferredUpdateError");
    v6 = -[SUSUISoftwareUpdateManager alternateUpdate](v35->_manager, "alternateUpdate");
    v27 = 0;
    v25 = 0;
    if (v6)
    {
      v28 = -[SUSUISoftwareUpdateManager alternateUpdate](v35->_manager, "alternateUpdate");
      v27 = 1;
      v7 = (const __CFString *)objc_msgSend(v28, "humanReadableUpdateName");
      v26 = (__CFString *)v7;
      v25 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v35->_manager, "alternateUpdate");
    v17 = -[SUSUISoftwareUpdateManager alternateUpdateError](v35->_manager, "alternateUpdateError");
    v9 = -[SUSUISoftwareUpdateManager isDelayingUpdates](v35->_manager, "isDelayingUpdates");
    v10 = "NO";
    if ((v9 & 1) != 0)
      v10 = "YES";
    v16 = (uint64_t)v10;
    v11 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v35->_manager, "automaticUpdateScheduled");
    v12 = "NO";
    if ((v11 & 1) != 0)
      v12 = "YES";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController installTonightPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v17, v16, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, location[0], v33, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v25 & 1) != 0)
    if ((v27 & 1) != 0)

    if ((v29 & 1) != 0)
    if ((v31 & 1) != 0)

  }
  objc_storeStrong((id *)location, 0);
  v35->_userChoice = 2;
  -[OBBoldTrayButton showsBusyIndicator](v35->_updateNowButton, "showsBusyIndicator");
  -[BuddySoftwareUpdateController _allButtonsSetEnabled:](v35, "_allButtonsSetEnabled:", 0);
  v13 = -[BuddySoftwareUpdateController navigationItem](v35, "navigationItem");
  objc_msgSend(v13, "setHidesBackButton:", 1);

  v14 = -[BuddySoftwareUpdateController view](v35, "view");
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);

  objc_initWeak(&from, v35);
  manager = v35->_manager;
  v18 = _NSConcreteStackBlock;
  v19 = -1073741824;
  v20 = 0;
  v21 = sub_10013DD68;
  v22 = &unk_100283550;
  objc_copyWeak(&v23, &from);
  -[SUSUISoftwareUpdateManager setAutoInstall:](manager, "setAutoInstall:", &v18);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
}

- (void)skipPressed
{
  id v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  const char *v10;
  unsigned __int8 v11;
  const char *v12;
  BFFFlowItemDelegate *v13;
  char v14;
  __CFString *v15;
  char v16;
  id v17;
  char v18;
  __CFString *v19;
  char v20;
  id v21;
  os_log_t oslog[2];
  BuddySoftwareUpdateController *v23;
  uint8_t buf[96];

  v23 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = -[SUSUISoftwareUpdateManager preferredUpdate](v23->_manager, "preferredUpdate");
    v20 = 0;
    v18 = 0;
    if (v2)
    {
      v21 = -[SUSUISoftwareUpdateManager preferredUpdate](v23->_manager, "preferredUpdate");
      v20 = 1;
      v3 = (const __CFString *)objc_msgSend(v21, "humanReadableUpdateName");
      v19 = (__CFString *)v3;
      v18 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v23->_manager, "preferredUpdate");
    v5 = -[SUSUISoftwareUpdateManager preferredUpdateError](v23->_manager, "preferredUpdateError");
    v6 = -[SUSUISoftwareUpdateManager alternateUpdate](v23->_manager, "alternateUpdate");
    v16 = 0;
    v14 = 0;
    if (v6)
    {
      v17 = -[SUSUISoftwareUpdateManager alternateUpdate](v23->_manager, "alternateUpdate");
      v16 = 1;
      v7 = (const __CFString *)objc_msgSend(v17, "humanReadableUpdateName");
      v15 = (__CFString *)v7;
      v14 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v23->_manager, "alternateUpdate");
    v9 = -[SUSUISoftwareUpdateManager alternateUpdateError](v23->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v23->_manager, "isDelayingUpdates") & 1) != 0)
      v10 = "YES";
    else
      v10 = "NO";
    v11 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v23->_manager, "automaticUpdateScheduled");
    v12 = "YES";
    if ((v11 & 1) == 0)
      v12 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController skipPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v14 & 1) != 0)
    if ((v16 & 1) != 0)

    if ((v18 & 1) != 0)
    if ((v20 & 1) != 0)

  }
  objc_storeStrong((id *)oslog, 0);
  v13 = -[BuddySoftwareUpdateController delegate](v23, "delegate");
  -[BFFFlowItemDelegate flowItemDone:](v13, "flowItemDone:", v23);

}

- (void)installNowPressed
{
  id v2;
  __CFString *v3;
  id v4;
  id v5;
  id v6;
  __CFString *v7;
  id v8;
  id v9;
  const char *v10;
  unsigned __int8 v11;
  const char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void **v20;
  int v21;
  int v22;
  void (*v23)(id *);
  void *v24;
  id v25;
  id location;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  os_log_type_t v35;
  os_log_t oslog[2];
  id v37;
  uint8_t buf[96];

  v37 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = objc_msgSend(*((id *)v37 + 1), "preferredUpdate");
    v33 = 0;
    v31 = 0;
    if (v2)
    {
      v34 = objc_msgSend(*((id *)v37 + 1), "preferredUpdate");
      v33 = 1;
      v3 = (__CFString *)objc_msgSend(v34, "humanReadableUpdateName");
      v32 = v3;
      v31 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = objc_msgSend(*((id *)v37 + 1), "preferredUpdate");
    v5 = objc_msgSend(*((id *)v37 + 1), "preferredUpdateError");
    v6 = objc_msgSend(*((id *)v37 + 1), "alternateUpdate");
    v29 = 0;
    v27 = 0;
    if (v6)
    {
      v30 = objc_msgSend(*((id *)v37 + 1), "alternateUpdate");
      v29 = 1;
      v7 = (__CFString *)objc_msgSend(v30, "humanReadableUpdateName");
      v28 = v7;
      v27 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = objc_msgSend(*((id *)v37 + 1), "alternateUpdate");
    v9 = objc_msgSend(*((id *)v37 + 1), "alternateUpdateError");
    if ((objc_msgSend(*((id *)v37 + 1), "isDelayingUpdates") & 1) != 0)
      v10 = "YES";
    else
      v10 = "NO";
    v11 = objc_msgSend(*((id *)v37 + 1), "automaticUpdateScheduled");
    v12 = "YES";
    if ((v11 & 1) == 0)
      v12 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController installNowPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v35, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v27 & 1) != 0)
    if ((v29 & 1) != 0)

    if ((v31 & 1) != 0)
    if ((v33 & 1) != 0)

  }
  objc_storeStrong((id *)oslog, 0);
  *((_QWORD *)v37 + 7) = 1;
  objc_msgSend(*((id *)v37 + 3), "showsBusyIndicator");
  objc_msgSend(v37, "_allButtonsSetEnabled:", 0);
  v13 = objc_msgSend(v37, "navigationItem");
  objc_msgSend(v13, "setHidesBackButton:", 1);

  v14 = objc_msgSend(v37, "view");
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);

  v15 = objc_msgSend(v37, "passcodeCacheManager");
  objc_msgSend(v15, "persistPasscodeStash");

  v20 = _NSConcreteStackBlock;
  v21 = -1073741824;
  v22 = 0;
  v23 = sub_10013EB68;
  v24 = &unk_100280730;
  v25 = v37;
  location = objc_retainBlock(&v20);
  v16 = objc_msgSend(v37, "softwareUpdateDelegate");

  if (v16)
  {
    v17 = objc_msgSend(v37, "softwareUpdateDelegate");
    v18 = v37;
    v19 = objc_msgSend(*((id *)v37 + 1), "preferredUpdate");
    objc_msgSend(v17, "softwareUpdateController:prepareToInstallUpdate:completion:", v18, v19, location);

  }
  else
  {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
}

- (void)resumePressed
{
  id v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  const char *v10;
  unsigned __int8 v11;
  const char *v12;
  char v13;
  __CFString *v14;
  char v15;
  id v16;
  char v17;
  __CFString *v18;
  char v19;
  id v20;
  os_log_t oslog[2];
  BuddySoftwareUpdateController *v22;
  uint8_t buf[96];

  v22 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
    v19 = 0;
    v17 = 0;
    if (v2)
    {
      v20 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
      v19 = 1;
      v3 = (const __CFString *)objc_msgSend(v20, "humanReadableUpdateName");
      v18 = (__CFString *)v3;
      v17 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
    v5 = -[SUSUISoftwareUpdateManager preferredUpdateError](v22->_manager, "preferredUpdateError");
    v6 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
    v15 = 0;
    v13 = 0;
    if (v6)
    {
      v16 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
      v15 = 1;
      v7 = (const __CFString *)objc_msgSend(v16, "humanReadableUpdateName");
      v14 = (__CFString *)v7;
      v13 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
    v9 = -[SUSUISoftwareUpdateManager alternateUpdateError](v22->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v22->_manager, "isDelayingUpdates") & 1) != 0)
      v10 = "YES";
    else
      v10 = "NO";
    v11 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v22->_manager, "automaticUpdateScheduled");
    v12 = "YES";
    if ((v11 & 1) == 0)
      v12 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController resumePressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v13 & 1) != 0)
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if ((v19 & 1) != 0)

  }
  objc_storeStrong((id *)oslog, 0);
  -[SUSUISoftwareUpdateManager resumeDownload](v22->_manager, "resumeDownload");
}

- (void)downloadAndInstallTonightPressed
{
  id v2;
  const __CFString *v3;
  id v4;
  id v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  const char *v10;
  unsigned __int8 v11;
  const char *v12;
  char v13;
  __CFString *v14;
  char v15;
  id v16;
  char v17;
  __CFString *v18;
  char v19;
  id v20;
  os_log_t oslog[2];
  BuddySoftwareUpdateController *v22;
  uint8_t buf[96];

  v22 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(self);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
    v19 = 0;
    v17 = 0;
    if (v2)
    {
      v20 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
      v19 = 1;
      v3 = (const __CFString *)objc_msgSend(v20, "humanReadableUpdateName");
      v18 = (__CFString *)v3;
      v17 = 1;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v22->_manager, "preferredUpdate");
    v5 = -[SUSUISoftwareUpdateManager preferredUpdateError](v22->_manager, "preferredUpdateError");
    v6 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
    v15 = 0;
    v13 = 0;
    if (v6)
    {
      v16 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
      v15 = 1;
      v7 = (const __CFString *)objc_msgSend(v16, "humanReadableUpdateName");
      v14 = (__CFString *)v7;
      v13 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v22->_manager, "alternateUpdate");
    v9 = -[SUSUISoftwareUpdateManager alternateUpdateError](v22->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v22->_manager, "isDelayingUpdates") & 1) != 0)
      v10 = "YES";
    else
      v10 = "NO";
    v11 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v22->_manager, "automaticUpdateScheduled");
    v12 = "YES";
    if ((v11 & 1) == 0)
      v12 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController downloadAndInstallTonightPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v13 & 1) != 0)
    if ((v15 & 1) != 0)

    if ((v17 & 1) != 0)
    if ((v19 & 1) != 0)

  }
  objc_storeStrong((id *)oslog, 0);
  v22->_userChoice = 2;
  -[BuddySoftwareUpdateController beginDownloadingUpdate](v22, "beginDownloadingUpdate");
}

- (void)_installFailedWithError:(id)a3
{
  uint64_t v3;
  id v4;
  __CFString *v5;
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  id v10;
  id v11;
  const char *v12;
  unsigned __int8 v13;
  const char *v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  id v20;
  id v21;
  BuddySoftwareUpdateControllerDelegate *v22;
  uint8_t v23[15];
  os_log_type_t v24;
  os_log_t v25;
  char v26;
  id v27;
  char v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  os_log_type_t v34;
  os_log_t oslog;
  id location[2];
  BuddySoftwareUpdateController *v37;
  uint8_t buf[112];

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v37->_manager, "preferredUpdate");
    v32 = 0;
    v30 = 0;
    if (v4)
    {
      v33 = -[SUSUISoftwareUpdateManager preferredUpdate](v37->_manager, "preferredUpdate");
      v32 = 1;
      v5 = (__CFString *)objc_msgSend(v33, "humanReadableUpdateName");
      v31 = v5;
      v30 = 1;
    }
    else
    {
      v5 = CFSTR("N/A");
    }
    v6 = -[SUSUISoftwareUpdateManager preferredUpdate](v37->_manager, "preferredUpdate");
    v7 = -[SUSUISoftwareUpdateManager preferredUpdateError](v37->_manager, "preferredUpdateError");
    v8 = -[SUSUISoftwareUpdateManager alternateUpdate](v37->_manager, "alternateUpdate");
    v28 = 0;
    v26 = 0;
    if (v8)
    {
      v29 = -[SUSUISoftwareUpdateManager alternateUpdate](v37->_manager, "alternateUpdate");
      v28 = 1;
      v9 = (__CFString *)objc_msgSend(v29, "humanReadableUpdateName");
      v27 = v9;
      v26 = 1;
    }
    else
    {
      v9 = CFSTR("N/A");
    }
    v10 = -[SUSUISoftwareUpdateManager alternateUpdate](v37->_manager, "alternateUpdate");
    v11 = -[SUSUISoftwareUpdateManager alternateUpdateError](v37->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v37->_manager, "isDelayingUpdates") & 1) != 0)
      v12 = "YES";
    else
      v12 = "NO";
    v13 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v37->_manager, "automaticUpdateScheduled");
    v14 = "YES";
    if ((v13 & 1) == 0)
      v14 = "NO";
    sub_10013FA54((uint64_t)buf, (uint64_t)v5, (uint64_t)v6, (uint64_t)v7, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v14, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v34, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nError: %{public}@", buf, 0x66u);

    if ((v26 & 1) != 0)
    if ((v28 & 1) != 0)

    if ((v30 & 1) != 0)
    if ((v32 & 1) != 0)

  }
  objc_storeStrong((id *)&oslog, 0);
  v15 = objc_msgSend(location[0], "domain");
  v16 = 0;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.error")) & 1) != 0)
    v16 = objc_msgSend(location[0], "code") == (id)14;

  if (v16)
  {
    v25 = (os_log_t)(id)_BYLoggingFacility(v17);
    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v25;
      v19 = v24;
      sub_100038C3C(v23);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Software Update install in progress. Ignore error...", v23, 2u);
    }
    objc_storeStrong((id *)&v25, 0);
  }
  else
  {
    v20 = -[BuddySoftwareUpdateController navigationItem](v37, "navigationItem");
    objc_msgSend(v20, "setHidesBackButton:", 0);

    v21 = -[BuddySoftwareUpdateController view](v37, "view");
    objc_msgSend(v21, "setUserInteractionEnabled:", 1);

    -[OBBoldTrayButton hidesBusyIndicator](v37->_updateNowButton, "hidesBusyIndicator");
    -[BuddySoftwareUpdateController _allButtonsSetEnabled:](v37, "_allButtonsSetEnabled:", 1);
    v22 = -[BuddySoftwareUpdateController softwareUpdateDelegate](v37, "softwareUpdateDelegate");
    -[BuddySoftwareUpdateControllerDelegate softwareUpdateController:didFailToInstallUpdateWithError:](v22, "softwareUpdateController:didFailToInstallUpdateWithError:", v37, location[0]);

  }
  objc_storeStrong(location, 0);
}

- (void)detailedReleaseNotesDonePressed
{
  -[BuddySoftwareUpdateController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a2, self);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  BuddySoftwareUpdateController *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(_QWORD *, void *);
  void *v10;
  id v11;
  id location[2];
  BuddySoftwareUpdateController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((BYSetupAssistantHasCompletedInitialRun(v3, v4) & 1) != 0)
    (*((void (**)(id, _QWORD))location[0] + 2))(location[0], 0);
  v5 = v13;
  v6 = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_10013FBF0;
  v10 = &unk_100283578;
  v11 = location[0];
  -[BuddySoftwareUpdateController scanForUpdateCompletion:](v5, "scanForUpdateCompletion:", &v6);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeEntryController:(id)a3 didEnterPasscode:(id)a4
{
  uint64_t v5;
  id v6;
  const __CFString *v7;
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  const char *v14;
  unsigned __int8 v15;
  const char *v16;
  void (**devicePasscodeCompletion)(id, id, id);
  id v18;
  id v19;
  id v20;
  char v21;
  __CFString *v22;
  char v23;
  id v24;
  char v25;
  __CFString *v26;
  char v27;
  id v28;
  os_log_t oslog;
  id v30;
  id location[2];
  BuddySoftwareUpdateController *v32;
  uint8_t buf[96];

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[SUSUISoftwareUpdateManager preferredUpdate](v32->_manager, "preferredUpdate");
    v27 = 0;
    v25 = 0;
    if (v6)
    {
      v28 = -[SUSUISoftwareUpdateManager preferredUpdate](v32->_manager, "preferredUpdate");
      v27 = 1;
      v7 = (const __CFString *)objc_msgSend(v28, "humanReadableUpdateName");
      v26 = (__CFString *)v7;
      v25 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = -[SUSUISoftwareUpdateManager preferredUpdate](v32->_manager, "preferredUpdate");
    v9 = -[SUSUISoftwareUpdateManager preferredUpdateError](v32->_manager, "preferredUpdateError");
    v10 = -[SUSUISoftwareUpdateManager alternateUpdate](v32->_manager, "alternateUpdate");
    v23 = 0;
    v21 = 0;
    if (v10)
    {
      v24 = -[SUSUISoftwareUpdateManager alternateUpdate](v32->_manager, "alternateUpdate");
      v23 = 1;
      v11 = (const __CFString *)objc_msgSend(v24, "humanReadableUpdateName");
      v22 = (__CFString *)v11;
      v21 = 1;
    }
    else
    {
      v11 = CFSTR("N/A");
    }
    v12 = -[SUSUISoftwareUpdateManager alternateUpdate](v32->_manager, "alternateUpdate");
    v13 = -[SUSUISoftwareUpdateManager alternateUpdateError](v32->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v32->_manager, "isDelayingUpdates") & 1) != 0)
      v14 = "YES";
    else
      v14 = "NO";
    v15 = -[SUSUISoftwareUpdateManager automaticUpdateScheduled](v32->_manager, "automaticUpdateScheduled");
    v16 = "YES";
    if ((v15 & 1) == 0)
      v16 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController passcodeEntryController:didEnterPasscode:]", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v16);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if ((v21 & 1) != 0)
    if ((v23 & 1) != 0)

    if ((v25 & 1) != 0)
    if ((v27 & 1) != 0)

  }
  objc_storeStrong((id *)&oslog, 0);
  if (objc_msgSend(v30, "length"))
  {
    -[BuddySoftwareUpdateController dismissViewControllerAnimated:completion:](v32, "dismissViewControllerAnimated:completion:", 1, 0);
    if (v32->_devicePasscodeCompletion)
    {
      devicePasscodeCompletion = (void (**)(id, id, id))v32->_devicePasscodeCompletion;
      v18 = v30;
      v19 = -[SUSUISoftwareUpdateManager preferredUpdate](v32->_manager, "preferredUpdate");
      devicePasscodeCompletion[2](devicePasscodeCompletion, v18, v19);

      v20 = v32->_devicePasscodeCompletion;
      v32->_devicePasscodeCompletion = 0;

    }
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)_cancelDevicePasscodePicker:(id)a3
{
  id devicePasscodeCompletion;
  id location[2];
  BuddySoftwareUpdateController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[BuddySoftwareUpdateController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);
  devicePasscodeCompletion = v5->_devicePasscodeCompletion;
  v5->_devicePasscodeCompletion = 0;

  -[BuddySoftwareUpdateController _installFailedWithError:](v5, "_installFailedWithError:", 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 promptForDevicePasscodeWithDescriptorCompletion:(id)a4
{
  uint64_t v5;
  id v6;
  __CFString *v7;
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  id v12;
  id v13;
  const char *v14;
  unsigned __int8 v15;
  const char *v16;
  id v17;
  void (**v18)(id, id, id);
  id v19;
  id v20;
  void *v21;
  void *v22;
  void **block;
  int v24;
  int v25;
  void (*v26)(id *);
  void *v27;
  id v28;
  id from;
  int v30;
  id v31;
  char v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  char v38;
  id v39;
  os_log_type_t v40;
  os_log_t oslog;
  id v42;
  id location[2];
  id val;
  uint8_t buf[96];

  val = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  oslog = (os_log_t)(id)_BYLoggingFacility(v5);
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*((id *)val + 1), "preferredUpdate");
    v38 = 0;
    v36 = 0;
    if (v6)
    {
      v39 = objc_msgSend(*((id *)val + 1), "preferredUpdate");
      v38 = 1;
      v7 = (__CFString *)objc_msgSend(v39, "humanReadableUpdateName");
      v37 = v7;
      v36 = 1;
    }
    else
    {
      v7 = CFSTR("N/A");
    }
    v8 = objc_msgSend(*((id *)val + 1), "preferredUpdate");
    v9 = objc_msgSend(*((id *)val + 1), "preferredUpdateError");
    v10 = objc_msgSend(*((id *)val + 1), "alternateUpdate");
    v34 = 0;
    v32 = 0;
    if (v10)
    {
      v35 = objc_msgSend(*((id *)val + 1), "alternateUpdate");
      v34 = 1;
      v11 = (__CFString *)objc_msgSend(v35, "humanReadableUpdateName");
      v33 = v11;
      v32 = 1;
    }
    else
    {
      v11 = CFSTR("N/A");
    }
    v12 = objc_msgSend(*((id *)val + 1), "alternateUpdate");
    v13 = objc_msgSend(*((id *)val + 1), "alternateUpdateError");
    if ((objc_msgSend(*((id *)val + 1), "isDelayingUpdates") & 1) != 0)
      v14 = "YES";
    else
      v14 = "NO";
    v15 = objc_msgSend(*((id *)val + 1), "automaticUpdateScheduled");
    v16 = "YES";
    if ((v15 & 1) == 0)
      v16 = "NO";
    sub_10013B930((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController manager:promptForDevicePasscodeWithDescriptorCompletion:]", (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v16);
    _os_log_impl((void *)&_mh_execute_header, oslog, v40, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nBuddy SU asked for device passcode", buf, 0x5Cu);

    if ((v32 & 1) != 0)
    if ((v34 & 1) != 0)

    if ((v36 & 1) != 0)
    if ((v38 & 1) != 0)

  }
  objc_storeStrong((id *)&oslog, 0);
  v17 = objc_msgSend(val, "passcodeCacheManager");
  v31 = objc_msgSend(v17, "cachedPasscode");

  if (v31 && v42)
  {
    v18 = (void (**)(id, id, id))v42;
    v19 = objc_msgSend(location[0], "preferredUpdate");
    v18[2](v18, v31, v19);

    v30 = 1;
  }
  else
  {
    v20 = objc_msgSend(v42, "copy");
    v21 = (void *)*((_QWORD *)val + 6);
    *((_QWORD *)val + 6) = v20;

    objc_initWeak(&from, val);
    v22 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    v24 = -1073741824;
    v25 = 0;
    v26 = sub_1001406F4;
    v27 = &unk_1002806B8;
    objc_copyWeak(&v28, &from);
    dispatch_async((dispatch_queue_t)v22, &block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    v30 = 0;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
}

- (void)setButtonTitle:(id)a3
{
  id location[2];
  BuddySoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[OBBoldTrayButton setTitle:forState:](v4->_updateNowButton, "setTitle:forState:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 didTransitionToState:(int)a4 fromState:(int)a5
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  id v11;
  id v12;
  const char *v13;
  const char *v14;
  void *v15;
  __CFString *v16;
  id v17;
  id v18;
  void **block;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  BuddySoftwareUpdateController *v24;
  id v25;
  id v26;
  unsigned int v27;
  id from;
  id v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  os_log_type_t v39;
  os_log_t oslog;
  id v41;
  int v42;
  int v43;
  id location[2];
  BuddySoftwareUpdateController *v45;
  uint8_t buf[144];

  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = a4;
  v42 = a5;
  v41 = objc_msgSend(location[0], "preferredUpdateError");
  oslog = (os_log_t)(id)_BYLoggingFacility(v41);
  v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[SUSUISoftwareUpdateManager preferredUpdate](v45->_manager, "preferredUpdate");
    v37 = 0;
    v35 = 0;
    v18 = v7;
    if (v7)
    {
      v38 = -[SUSUISoftwareUpdateManager preferredUpdate](v45->_manager, "preferredUpdate");
      v37 = 1;
      v16 = (__CFString *)objc_msgSend(v38, "humanReadableUpdateName");
      v36 = v16;
      v35 = 1;
    }
    else
    {
      v16 = CFSTR("N/A");
    }
    v17 = -[SUSUISoftwareUpdateManager preferredUpdate](v45->_manager, "preferredUpdate");
    v8 = -[SUSUISoftwareUpdateManager preferredUpdateError](v45->_manager, "preferredUpdateError");
    v9 = -[SUSUISoftwareUpdateManager alternateUpdate](v45->_manager, "alternateUpdate");
    v33 = 0;
    v31 = 0;
    if (v9)
    {
      v34 = -[SUSUISoftwareUpdateManager alternateUpdate](v45->_manager, "alternateUpdate");
      v33 = 1;
      v10 = (__CFString *)objc_msgSend(v34, "humanReadableUpdateName");
      v32 = v10;
      v31 = 1;
    }
    else
    {
      v10 = CFSTR("N/A");
    }
    v11 = -[SUSUISoftwareUpdateManager alternateUpdate](v45->_manager, "alternateUpdate");
    v12 = -[SUSUISoftwareUpdateManager alternateUpdateError](v45->_manager, "alternateUpdateError");
    if ((-[SUSUISoftwareUpdateManager isDelayingUpdates](v45->_manager, "isDelayingUpdates") & 1) != 0)
      v13 = "YES";
    else
      v13 = "NO";
    if ((-[SUSUISoftwareUpdateManager automaticUpdateScheduled](v45->_manager, "automaticUpdateScheduled") & 1) != 0)v14 = "YES";
    else
      v14 = "NO";
    v30 = (id)sub_100140EEC(v42);
    v29 = (id)sub_100140EEC(v43);
    sub_100140FF8((uint64_t)buf, (uint64_t)v16, (uint64_t)v17, (uint64_t)v8, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v30, v42, (uint64_t)v29, v43, (uint64_t)v41);
    _os_log_impl((void *)&_mh_execute_header, oslog, v39, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nPerforming SU transition: %{public}@ (%lu) -> %{public}@ (%lu), error: %@", buf, 0x8Eu);

    if ((v31 & 1) != 0)
    if ((v33 & 1) != 0)

    if ((v35 & 1) != 0)
    if ((v37 & 1) != 0)

    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_initWeak(&from, v45);
  v15 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v20 = -1073741824;
  v21 = 0;
  v22 = sub_100141098;
  v23 = &unk_1002835A0;
  objc_copyWeak(&v26, &from);
  v24 = v45;
  v25 = v41;
  v27 = v43;
  dispatch_async((dispatch_queue_t)v15, &block);

  objc_storeStrong(&v25, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadProgressChanged:(id)a4 displayStyle:(int)a5
{
  void *v7;
  void **block;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  int v15;
  id from;
  int v17;
  id v18;
  id location[2];
  BuddySoftwareUpdateController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = a5;
  objc_initWeak(&from, v20);
  v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_100141D80;
  v12 = &unk_1002835C8;
  objc_copyWeak(&v14, &from);
  v13 = v18;
  v15 = v17;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong(&v13, 0);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadFinished:(id)a4
{
  void *v5;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  BuddySoftwareUpdateController *v11;
  id v12;
  id from;
  id v14;
  id location[2];
  BuddySoftwareUpdateController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  objc_initWeak(&from, v16);
  v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_100142150;
  v10 = &unk_100280E18;
  objc_copyWeak(&v12, &from);
  v11 = v16;
  dispatch_async((dispatch_queue_t)v5, &block);

  objc_storeStrong((id *)&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installStartedForUpdate:(id)a4
{
  BuddySoftwareUpdateControllerDelegate *v5;
  id v6;
  id location[2];
  BuddySoftwareUpdateController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = -[BuddySoftwareUpdateController softwareUpdateDelegate](v8, "softwareUpdateDelegate");
  -[BuddySoftwareUpdateControllerDelegate softwareUpdateController:didStartInstallForUpdate:](v5, "softwareUpdateController:didStartInstallForUpdate:", v8, v6);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installFailedWithError:(id)a4
{
  void *v5;
  void **block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  id from;
  id v14;
  id location[2];
  BuddySoftwareUpdateController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  objc_initWeak(&from, v16);
  v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  v7 = -1073741824;
  v8 = 0;
  v9 = sub_100142E4C;
  v10 = &unk_100280E18;
  objc_copyWeak(&v12, &from);
  v11 = v14;
  dispatch_async((dispatch_queue_t)v5, &block);

  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4;
  BOOL v5;
  id v6;
  id v7;
  BOOL v8;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  id location[2];
  BuddySoftwareUpdateController *v17;
  int64_t v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSUISoftwareUpdateManager preferredUpdate](v17->_manager, "preferredUpdate");
  v5 = v4 == 0;

  if (v5)
  {
    v18 = 0;
  }
  else
  {
    v6 = -[SUSUISoftwareUpdateManager preferredUpdate](v17->_manager, "preferredUpdate");
    v7 = objc_msgSend(v6, "documentation");
    v14 = 0;
    v12 = 0;
    v10 = 0;
    v8 = 0;
    if (v7)
    {
      v15 = -[SUSUISoftwareUpdateManager preferredUpdate](v17->_manager, "preferredUpdate");
      v14 = 1;
      v13 = objc_msgSend(v15, "documentation");
      v12 = 1;
      v11 = objc_msgSend(v13, "releaseNotes");
      v10 = 1;
      v8 = v11 != 0;
    }
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    if ((v14 & 1) != 0)

    if (v8)
      v18 = 2;
    else
      v18 = 1;
  }
  objc_storeStrong(location, 0);
  return v18;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  NSBundle *v6;
  NSString *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  int v15;
  id v16;
  id location[2];
  BuddySoftwareUpdateController *v18;
  SUSSoftwareUpdateTitleCell *v19;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  if (objc_msgSend(v16, "row"))
  {
    if (objc_msgSend(v16, "row") == (id)1)
    {
      v14 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("LearnMoreCellIdentifier"));
      if (!v14)
      {
        v14 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("LearnMoreCellIdentifier"));

        v5 = objc_msgSend(v14, "textLabel");
        v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_100284738, CFSTR("SoftwareUpdate"));
        objc_msgSend(v5, "setText:", v7);

        v8 = objc_msgSend(v14, "textLabel");
        v9 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
        v10 = objc_msgSend(v9, "tableCellFont");
        objc_msgSend(v8, "setFont:", v10);

        v11 = objc_msgSend(v14, "textLabel");
        v12 = +[UIColor _labelColor](UIColor, "_labelColor");
        objc_msgSend(v11, "setTextColor:", v12);

        objc_msgSend(v14, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
        objc_msgSend(v14, "setAccessoryType:", 1);
      }
      v19 = (SUSSoftwareUpdateTitleCell *)v14;
      v15 = 1;
      objc_storeStrong(&v14, 0);
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v19 = v18->_titleCell;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v5;
  id v7;
  id location[2];
  BuddySoftwareUpdateController *v9;
  double v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  if (objc_msgSend(v7, "row"))
  {
    if (objc_msgSend(v7, "row") == (id)1)
      v10 = 60.0;
  }
  else
  {
    -[SUSSoftwareUpdateTitleCell preferredHeightWithTable:](v9->_titleCell, "preferredHeightWithTable:", location[0]);
    v10 = v5;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  BuddySoftwareUpdateController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  if (objc_msgSend(v18, "row") == (id)1)
  {
    v17 = objc_msgSend(objc_alloc((Class)sub_10014363C()), "initWithNibName:bundle:", 0, 0);
    v5 = objc_alloc((Class)NSString);
    v6 = -[SUSUISoftwareUpdateManager preferredUpdate](v20->_manager, "preferredUpdate");
    v7 = objc_msgSend(v6, "documentation");
    v8 = objc_msgSend(v7, "releaseNotes");
    v9 = objc_msgSend(v5, "initWithData:encoding:", v8, 4);
    objc_msgSend(v17, "setReleaseNotes:", v9);

    if ((BFFIsiPad(v10, v11) & 1) != 0)
    {
      v16 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v17);
      objc_msgSend(v16, "setModalPresentationStyle:", 2);
      v12 = objc_alloc((Class)UIBarButtonItem);
      v15 = objc_msgSend(v12, "initWithBarButtonSystemItem:target:action:", 0, v20, "detailedReleaseNotesDonePressed");
      v13 = objc_msgSend(v17, "navigationItem");
      objc_msgSend(v13, "setRightBarButtonItem:", v15);

      -[BuddySoftwareUpdateController presentViewController:animated:completion:](v20, "presentViewController:animated:completion:", v16, 1, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v14 = -[BuddySoftwareUpdateController navigationController](v20, "navigationController");
      objc_msgSend(v14, "pushViewController:animated:", v17, 1);

    }
    objc_storeStrong(&v17, 0);
  }
  objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v18, 1);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (id)createBoldButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v5;
  id v7[2];
  id location[2];
  BuddySoftwareUpdateController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = (id)a4;
  v7[0] = +[OBBoldTrayButton boldButton](OBBoldTrayButton, "boldButton");
  objc_msgSend(v7[0], "setTitle:forState:", location[0], 0);
  objc_msgSend(v7[0], "addTarget:action:forControlEvents:", v9, a4, 64);
  v5 = v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)createLinkButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v5;
  id v7[2];
  id location[2];
  BuddySoftwareUpdateController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = (id)a4;
  v7[0] = +[OBLinkTrayButton linkButton](OBLinkTrayButton, "linkButton");
  objc_msgSend(v7[0], "setTitle:forState:", location[0], 0);
  objc_msgSend(v7[0], "addTarget:action:forControlEvents:", v9, a4, 64);
  v5 = v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)_allButtonsSetEnabled:(BOOL)a3
{
  -[OBBoldTrayButton setEnabled:](self->_updateNowButton, "setEnabled:", a3);
  -[OBLinkTrayButton setEnabled:](self->_updateTonightButton, "setEnabled:", a3);
  -[OBLinkTrayButton setEnabled:](self->_skipButton, "setEnabled:", a3);
}

- (void)showErrorWithContent:(id)a3
{
  id location[2];
  BuddySoftwareUpdateController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[OBBoldTrayButton setTitle:forState:](v4->_updateNowButton, "setTitle:forState:", location[0], 0);
  -[OBBoldTrayButton setEnabled:](v4->_updateNowButton, "setEnabled:", 0);
  if (v4->_updateTonightButton)
    -[OBLinkTrayButton setHidden:](v4->_updateTonightButton, "setHidden:", 1);
  objc_storeStrong(location, 0);
}

- (void)resetButtonState:(id)a3 andEventHandlers:(BOOL)a4
{
  id location[2];
  BuddySoftwareUpdateController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "setEnabled:", 1);
  objc_msgSend(location[0], "setHidden:", 0);
  if (a4)
    objc_msgSend(location[0], "removeTarget:action:forControlEvents:", v6, 0, 64);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BuddySoftwareUpdateControllerDelegate)softwareUpdateDelegate
{
  return (BuddySoftwareUpdateControllerDelegate *)objc_loadWeakRetained((id *)&self->_softwareUpdateDelegate);
}

- (void)setSoftwareUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_softwareUpdateDelegate, a3);
}

- (BOOL)allowUserToSkip
{
  return self->_allowUserToSkip;
}

- (void)setAllowUserToSkip:(BOOL)a3
{
  self->_allowUserToSkip = a3;
}

- (BOOL)allowUserToInstallTonight
{
  return self->_allowUserToInstallTonight;
}

- (void)setAllowUserToInstallTonight:(BOOL)a3
{
  self->_allowUserToInstallTonight = a3;
}

- (BOOL)scannedForUpdate
{
  return self->_scannedForUpdate;
}

- (void)setScannedForUpdate:(BOOL)a3
{
  self->_scannedForUpdate = a3;
}

- (SUDescriptor)update
{
  return (SUDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeCacheManager, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_destroyWeak((id *)&self->_softwareUpdateDelegate);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong(&self->_devicePasscodeCompletion, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_updateTonightButton, 0);
  objc_storeStrong((id *)&self->_updateNowButton, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
