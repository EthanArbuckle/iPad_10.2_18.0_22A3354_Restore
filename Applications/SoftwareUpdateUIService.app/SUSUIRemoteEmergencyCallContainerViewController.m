@implementation SUSUIRemoteEmergencyCallContainerViewController

- (SUSUIRemoteEmergencyCallContainerViewController)init
{
  SUSUIRemoteEmergencyCallContainerViewController *v3;
  SUSUIRemoteEmergencyCallContainerViewController *v4;
  os_log_t oslog;
  objc_super v6;
  SEL v7;
  SUSUIRemoteEmergencyCallContainerViewController *v8;
  uint8_t v9[24];

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  v4 = -[SUSUIRemoteEmergencyCallContainerViewController init](&v6, "init");
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100003BA4((uint64_t)v9, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Created SUSUIRemoteEmergencyCallContainerViewController: %@", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)loadView
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  UIScreen *v7;
  id v8;
  UIColor *v9;
  id v10;
  id v11;
  NSObject *log;
  os_log_type_t v13;
  id v14;
  uint8_t v15[7];
  os_log_type_t v16;
  id location[2];
  SUSUIRemoteEmergencyCallContainerViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogEmergencyCallUI();
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    v13 = v16;
    sub_1000020A4(v15);
    _os_log_impl((void *)&_mh_execute_header, log, v13, "Creating view for SUSUIRemoteEmergencyCallContainerViewController", v15, 2u);
  }
  objc_storeStrong(location, 0);
  v6 = objc_alloc((Class)UIView);
  v7 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v7, "bounds");
  v14 = objc_msgSend(v6, "initWithFrame:", v2, v3, v4, v5);

  v8 = v14;
  v9 = +[UIColor clearColor](UIColor, "clearColor");
  objc_msgSend(v8, "setBackgroundColor:");

  objc_msgSend(v14, "setAutoresizingMask:", 18);
  objc_msgSend(v14, "setOpaque:", 0);
  v10 = objc_msgSend(v14, "layer");
  objc_msgSend(v10, "setAllowsGroupBlending:", 0);

  v11 = objc_msgSend(v14, "layer");
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

  -[SUSUIRemoteEmergencyCallContainerViewController setView:](v18, "setView:", v14);
  objc_storeStrong(&v14, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  os_log_t oslog;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUIRemoteEmergencyCallContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  v3 = -[SUSUIRemoteEmergencyCallContainerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  oslog = (os_log_t)(id)SUSUILogEmergencyCallUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewWillAppear:]", (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  os_log_t oslog;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUIRemoteEmergencyCallContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  v3 = -[SUSUIRemoteEmergencyCallContainerViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  oslog = (os_log_t)(id)SUSUILogEmergencyCallUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewDidAppear:]", (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  os_log_t oslog;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SUSUIRemoteEmergencyCallContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  v3 = -[SUSUIRemoteEmergencyCallContainerViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  oslog = (os_log_t)(id)SUSUILogEmergencyCallUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewWillDisappear:]", (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const __CFString *v3;
  objc_super v4;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v7;
  SEL v8;
  SUSUIRemoteEmergencyCallContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  oslog = (os_log_t)(id)SUSUILogEmergencyCallUI(self);
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewDidDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4.receiver = v9;
  v4.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  -[SUSUIRemoteEmergencyCallContainerViewController viewDidDisappear:](&v4, "viewDidDisappear:", v7);
  -[SUSUIRemoteEmergencyCallContainerViewController _fireActionWithResponseIfNecessary:](v9, "_fireActionWithResponseIfNecessary:", 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  SUSUIRemoteEmergencyCallContainerViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  -[SUSUIRemoteEmergencyCallContainerViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;
  SEL v3;
  SUSUIRemoteEmergencyCallContainerViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  -[SUSUIRemoteEmergencyCallContainerViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  SUSUIRemoteEmergencyCallContainerViewController *v10;
  id v11;
  id v12;
  id location[2];
  SUSUIRemoteEmergencyCallContainerViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_10000857C;
  v9 = &unk_100014A50;
  v10 = v14;
  v11 = v12;
  +[SUSUIRemoteEmergencyCallViewController requestEmergencyCallControllerWithCompletion:](SUSUIRemoteEmergencyCallViewController, "requestEmergencyCallControllerWithCompletion:");
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)handleLockButtonPressed
{
  dispatch_queue_t queue;
  void **v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[2];
  SUSUIRemoteEmergencyCallContainerViewController *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = &_dispatch_main_q;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100008814;
  v7 = &unk_100014528;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

- (void)dismissEmergencyCallViewController:(id)a3
{
  uint64_t v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SUSUIRemoteEmergencyCallContainerViewController *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  SUSUIRemoteEmergencyCallContainerViewController *v15;
  os_log_type_t v16;
  id v17;
  id location[2];
  SUSUIRemoteEmergencyCallContainerViewController *v19;
  uint8_t v20[24];

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = (id)SUSUILogEmergencyCallUI(v3);
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v20, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController dismissEmergencyCallViewController:]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, v16, "%s", v20, 0xCu);
  }
  objc_storeStrong(&v17, 0);
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_100008A70;
  v14 = &unk_100014528;
  v15 = v19;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100008ACC;
  v8 = &unk_100014578;
  v9 = v19;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v10, &v4, 0.4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4
{
  uint64_t v4;
  id v5;
  os_log_t oslog;
  id v8;
  id location[2];
  SUSUIRemoteEmergencyCallContainerViewController *v10;
  uint8_t v11[24];

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  oslog = (os_log_t)(id)SUSUILogEmergencyCallUI(v4);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v11, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController emergencyCallViewController:didExitWithError:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v11, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUIRemoteEmergencyCallContainerViewController _fireActionWithResponseIfNecessary:](v10, "_fireActionWithResponseIfNecessary:", 0);
  v5 = -[SUSUIRemoteEmergencyCallContainerViewController _remoteViewControllerProxy](v10, "_remoteViewControllerProxy");
  objc_msgSend(v5, "dismiss");

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  UIDevice *v3;
  BOOL v4;

  v3 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (id)-[UIDevice userInterfaceIdiom](v3, "userInterfaceIdiom") != (id)1;

  if (v4)
    return 2;
  else
    return 30;
}

- (void)_fireActionWithResponseIfNecessary:(BOOL)a3
{
  if (self->_action)
  {
    -[SUSUIRemoteEmergencyCallAlertAction fireCompletionIfNecessaryForResult:](self->_action, "fireCompletionIfNecessaryForResult:", a3);
    objc_storeStrong((id *)&self->_action, 0);
  }
}

- (void)_setRootViewController:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  id location[2];
  SUSUIRemoteEmergencyCallContainerViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[SUSUIRemoteEmergencyCallContainerViewController view](v13, "view");
  objc_msgSend(v7, "bounds");
  *(_QWORD *)&v10 = v3;
  *((_QWORD *)&v10 + 1) = v4;
  *(_QWORD *)&v11 = v5;
  *((_QWORD *)&v11 + 1) = v6;

  v9 = objc_msgSend(location[0], "view");
  objc_msgSend(v9, "setFrame:", v10, v11);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(location[0], "willMoveToParentViewController:", v13);
  v8 = -[SUSUIRemoteEmergencyCallContainerViewController view](v13, "view");
  objc_msgSend(v8, "addSubview:", v9);

  -[SUSUIRemoteEmergencyCallContainerViewController addChildViewController:](v13, "addChildViewController:", location[0]);
  objc_msgSend(location[0], "didMoveToParentViewController:", v13);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_emergencyVC, 0);
}

@end
