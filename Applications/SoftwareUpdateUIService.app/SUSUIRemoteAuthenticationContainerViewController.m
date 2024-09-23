@implementation SUSUIRemoteAuthenticationContainerViewController

- (SUSUIRemoteAuthenticationContainerViewController)init
{
  SUSUIRemoteAuthenticationContainerViewController *v3;
  SUSUIRemoteAuthenticationContainerViewController *v4;
  os_log_t oslog;
  objc_super v6;
  SEL v7;
  SUSUIRemoteAuthenticationContainerViewController *v8;
  uint8_t v9[24];

  v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  v4 = -[SUSUIRemoteAuthenticationContainerViewController init](&v6, "init");
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100003BA4((uint64_t)v9, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Created SUSUIRemoteViewControllerContainerViewController: %@", v9, 0xCu);
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
  SUSUIRemoteAuthenticationContainerViewController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogAuthenticationUI();
  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    v13 = v16;
    sub_1000020A4(v15);
    _os_log_impl((void *)&_mh_execute_header, log, v13, "Creating view for SUSUIRemoteViewControllerContainerViewController", v15, 2u);
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

  -[SUSUIRemoteAuthenticationContainerViewController setView:](v18, "setView:", v14);
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
  SUSUIRemoteAuthenticationContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  v3 = -[SUSUIRemoteAuthenticationContainerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewWillAppear:]", (uint64_t)v4);
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
  SUSUIRemoteAuthenticationContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  v3 = -[SUSUIRemoteAuthenticationContainerViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewDidAppear:]", (uint64_t)v4);
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
  SUSUIRemoteAuthenticationContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  v3 = -[SUSUIRemoteAuthenticationContainerViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewWillDisappear:]", (uint64_t)v4);
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
  SUSUIRemoteAuthenticationContainerViewController *v9;
  uint8_t v10[24];

  v9 = self;
  v8 = a2;
  v7 = a3;
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(self);
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    sub_100006914((uint64_t)v10, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewDidDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4.receiver = v9;
  v4.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  -[SUSUIRemoteAuthenticationContainerViewController viewDidDisappear:](&v4, "viewDidDisappear:", v7);
  -[SUSUIRemoteAuthenticationContainerViewController _fireActionWithResponseIfNecessary:](v9, "_fireActionWithResponseIfNecessary:", 0);
}

- (void)configureWithAction:(id)a3
{
  SUSUISoftwareUpdateAuthenticationViewController *v3;
  SUSUISoftwareUpdateAuthenticationViewController *authVC;
  SUSUISoftwareUpdateAuthenticationViewController *v5;
  SUSUISoftwareUpdateAuthenticationViewController *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  SUSUISoftwareUpdateAuthenticationViewController *v19;
  id v20;
  id v21;
  SUSUISoftwareUpdateAuthenticationViewController *v22;
  id v23;
  id v24;
  os_log_type_t v25;
  id v26;
  id v27;
  os_log_type_t v28;
  id v29;
  os_log_type_t v30;
  id v31;
  BOOL v32;
  id location[2];
  SUSUIRemoteAuthenticationContainerViewController *v34;
  uint8_t v35[16];
  uint8_t v36[16];
  uint8_t v37[24];

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v34->_action, location[0]);
  if (-[SUSUIAuthenticationAlertAction alertType](v34->_action, "alertType") == (id)1)
  {
    v22 = [SUSUISoftwareUpdateAuthenticationViewController alloc];
    v23 = -[SUSUIAuthenticationAlertAction rollbackDescriptor](v34->_action, "rollbackDescriptor");
    v3 = -[SUSUISoftwareUpdateAuthenticationViewController initWithRollbackDescriptor:canDeferInstallation:](v22, "initWithRollbackDescriptor:canDeferInstallation:", v23, (unint64_t)-[SUSUIAuthenticationAlertAction canDeferInstallation](v34->_action, "canDeferInstallation") & 1);
    authVC = v34->_authVC;
    v34->_authVC = v3;

  }
  else
  {
    v19 = [SUSUISoftwareUpdateAuthenticationViewController alloc];
    v21 = -[SUSUIAuthenticationAlertAction descriptor](v34->_action, "descriptor");
    v18 = -[SUSUIAuthenticationAlertAction forInstallTonight](v34->_action, "forInstallTonight");
    v20 = -[SUSUIAuthenticationAlertAction autoInstallForecast](v34->_action, "autoInstallForecast");
    v5 = -[SUSUISoftwareUpdateAuthenticationViewController initWithDescriptor:forInstallTonight:withInstallForecast:canDeferInstallation:](v19, "initWithDescriptor:forInstallTonight:withInstallForecast:canDeferInstallation:", v21, v18 & 1, v20, (unint64_t)-[SUSUIAuthenticationAlertAction canDeferInstallation](v34->_action, "canDeferInstallation") & 1);
    v6 = v34->_authVC;
    v34->_authVC = v5;

  }
  -[SUSUISoftwareUpdateAuthenticationViewController setDelegate:](v34->_authVC, "setDelegate:", v34);
  -[SUSUIRemoteAuthenticationContainerViewController viewController:wantsStatusBarHidden:withDuration:](v34, "viewController:wantsStatusBarHidden:withDuration:", v34->_authVC, 0, 0.0);
  v32 = SBSGetScreenLockStatus(0) != 0;
  if (v32
    && (-[SUSUIAuthenticationAlertAction canDeferInstallation](v34->_action, "canDeferInstallation") & 1) == 0)
  {
    v17 = -[SUSUIRemoteAuthenticationContainerViewController _remoteViewControllerProxy](v34, "_remoteViewControllerProxy");
    objc_msgSend(v17, "setDesiredHardwareButtonEvents:", 1);

  }
  v16 = -[SUSUIRemoteAuthenticationContainerViewController _remoteViewControllerProxy](v34, "_remoteViewControllerProxy");
  objc_msgSend(v16, "setAllowsAlertItems:", 0);

  v31 = (id)SUSUILogAuthenticationUI(-[SUSUIRemoteAuthenticationContainerViewController _setRootViewController:](v34, "_setRootViewController:", v34->_authVC));
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
  {
    if ((-[SUSUIAuthenticationAlertAction forInstallTonight](v34->_action, "forInstallTonight") & 1) != 0)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    sub_100003BA4((uint64_t)v37, (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v31, v30, "configureWithContext: forInstallTonight: %@", v37, 0xCu);
  }
  objc_storeStrong(&v31, 0);
  v29 = (id)SUSUILogAuthenticationUI(v8);
  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v29;
    v14 = v28;
    v15 = -[SUSUIAuthenticationAlertAction autoInstallForecast](v34->_action, "autoInstallForecast");
    v27 = v15;
    sub_100003BA4((uint64_t)v36, (uint64_t)v27);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "configureWithContext: autoInstallForecast: %@", v36, 0xCu);

    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(&v29, 0);
  v26 = (id)SUSUILogAuthenticationUI(v9);
  v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v26;
    v11 = v25;
    v12 = -[SUSUIAuthenticationAlertAction descriptor](v34->_action, "descriptor");
    v24 = v12;
    sub_100003BA4((uint64_t)v35, (uint64_t)v24);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "configureWithContext: descriptor: %@", v35, 0xCu);

    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t v4;
  id v5;
  SUSUIRemoteAuthenticationContainerViewController *v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  id v15;
  id location[2];
  SUSUIRemoteAuthenticationContainerViewController *v17;
  uint8_t v18[24];

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = (id)SUSUILogAuthenticationUI(v4);
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v6 = v17;
    v9 = objc_msgSend(location[0], "actions");
    v12 = v9;
    sub_100003488((uint64_t)v18, (uint64_t)v6, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%@ - configure with context: %@", v18, 0x16u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = objc_msgSend(location[0], "actions");
  v11 = objc_msgSend(v5, "anyObject");

  -[SUSUIRemoteAuthenticationContainerViewController configureWithAction:](v17, "configureWithAction:", v11);
  if (v15)
    (*((void (**)(void))v15 + 2))();
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)handleLockButtonPressed
{
  dispatch_queue_t queue;
  void **v3;
  int v4;
  int v5;
  id (*v6)(uint64_t);
  void *v7;
  id v8[2];
  SUSUIRemoteAuthenticationContainerViewController *v9;

  v9 = self;
  v8[1] = (id)a2;
  queue = &_dispatch_main_q;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_100009FBC;
  v7 = &unk_100014528;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

- (void)viewController:(id)a3 wantsStatusBarHidden:(BOOL)a4 withDuration:(double)a5
{
  uint64_t v5;
  const __CFString *v6;
  id v7;
  os_log_t oslog;
  uint64_t v11;
  BOOL v12;
  id location[2];
  SUSUIRemoteAuthenticationContainerViewController *v14;
  uint8_t v15[40];

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v11 = *(_QWORD *)&a5;
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(v5);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    sub_10000A188((uint64_t)v15, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewController:wantsStatusBarHidden:withDuration:]", (uint64_t)v6, v11);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: hidden=%@, duration=%f", v15, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = -[SUSUIRemoteAuthenticationContainerViewController _remoteViewControllerProxy](v14, "_remoteViewControllerProxy");
  objc_msgSend(v7, "setStatusBarHidden:withDuration:", v12, *(double *)&v11);

  objc_storeStrong(location, 0);
}

- (void)viewControllerAuthenticatedWithResult:(BOOL)a3
{
  const __CFString *v3;
  os_log_t oslog;
  BOOL v5;
  SEL v6;
  SUSUIRemoteAuthenticationContainerViewController *v7;
  uint8_t v8[24];

  v7 = self;
  v6 = a2;
  v5 = a3;
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(self);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    sub_100003488((uint64_t)v8, (uint64_t)v7, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ - Returning result to caller: %@", v8, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUIRemoteAuthenticationContainerViewController _fireActionWithResponseIfNecessary:](v7, "_fireActionWithResponseIfNecessary:", v5);
}

- (void)viewControllerWantsDismissal:(id)a3
{
  uint64_t v3;
  os_log_t oslog;
  id location[2];
  SUSUIRemoteAuthenticationContainerViewController *v6;
  uint8_t v7[24];

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI(v3);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v7, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewControllerWantsDismissal:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v7, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSUIRemoteAuthenticationContainerViewController _fireActionWithResponseIfNecessary:](v6, "_fireActionWithResponseIfNecessary:", 0);
  -[SUSUIRemoteAuthenticationContainerViewController _dismiss](v6, "_dismiss");
  objc_storeStrong(location, 0);
}

- (void)viewControllerWantsIdleTimerReset:(id)a3
{
  uint64_t v3;
  id v4;
  dispatch_time_t when;
  dispatch_queue_t queue;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  SUSUIRemoteAuthenticationContainerViewController *v12;
  int v13;
  int v14;
  os_log_type_t v15;
  id v16;
  id location[2];
  SUSUIRemoteAuthenticationContainerViewController *v18;
  uint8_t v19[24];

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = (id)SUSUILogAuthenticationUI(v3);
  v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000061C4((uint64_t)v19, (uint64_t)"-[SUSUIRemoteAuthenticationContainerViewController viewControllerWantsIdleTimerReset:]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, v15, "%s", v19, 0xCu);
  }
  objc_storeStrong(&v16, 0);
  if (v18->_authVC == location[0])
  {
    v14 = ++dword_10001C238;
    v4 = -[SUSUIRemoteAuthenticationContainerViewController _remoteViewControllerProxy](v18, "_remoteViewControllerProxy");
    objc_msgSend(v4, "setIdleTimerDisabled:forReason:", 1, CFSTR("reset"));

    when = dispatch_time(0, 1000000000);
    queue = &_dispatch_main_q;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_10000A658;
    v11 = &unk_100014A78;
    v13 = v14;
    v12 = v18;
    dispatch_after(when, queue, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
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
    -[SUSUIAuthenticationAlertAction fireCompletionIfNecessaryForResult:](self->_action, "fireCompletionIfNecessaryForResult:", a3);
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
  SUSUIRemoteAuthenticationContainerViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[SUSUIRemoteAuthenticationContainerViewController view](v13, "view");
  objc_msgSend(v7, "bounds");
  *(_QWORD *)&v10 = v3;
  *((_QWORD *)&v10 + 1) = v4;
  *(_QWORD *)&v11 = v5;
  *((_QWORD *)&v11 + 1) = v6;

  v9 = objc_msgSend(location[0], "view");
  objc_msgSend(v9, "setFrame:", v10, v11);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(location[0], "willMoveToParentViewController:", v13);
  v8 = -[SUSUIRemoteAuthenticationContainerViewController view](v13, "view");
  objc_msgSend(v8, "addSubview:", v9);

  -[SUSUIRemoteAuthenticationContainerViewController addChildViewController:](v13, "addChildViewController:", location[0]);
  objc_msgSend(location[0], "didMoveToParentViewController:", v13);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_dismiss
{
  id v2;
  objc_super v3;
  SEL v4;
  SUSUIRemoteAuthenticationContainerViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)SUSUIRemoteAuthenticationContainerViewController;
  v2 = -[SUSUIRemoteAuthenticationContainerViewController _remoteViewControllerProxy](&v3, "_remoteViewControllerProxy");
  objc_msgSend(v2, "dismiss");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_authVC, 0);
}

@end
