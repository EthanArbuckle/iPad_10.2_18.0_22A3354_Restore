@implementation BuddyAwaitUserConfigurationViewController

- (void)dealloc
{
  NSTimer *v2;
  objc_super v3;
  SEL v4;
  BuddyAwaitUserConfigurationViewController *v5;

  v5 = self;
  v4 = a2;
  v2 = -[BuddyAwaitUserConfigurationViewController timer](self, "timer");
  -[NSTimer invalidate](v2, "invalidate");

  -[BuddyAwaitUserConfigurationViewController setTimer:](v5, "setTimer:", 0);
  if (notify_is_valid_token(v5->_token))
    notify_cancel(v5->_token);
  v3.receiver = v5;
  v3.super_class = (Class)BuddyAwaitUserConfigurationViewController;
  -[BuddyAwaitUserConfigurationViewController dealloc](&v3, "dealloc");
}

- (BOOL)shouldAllowStartOver
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  const char *v3;
  int *p_token;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSTimer *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *);
  void *v14;
  id v15;
  uint8_t buf[7];
  char v17;
  os_log_t oslog;
  void **handler;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  int v25;
  void **v26;
  int v27;
  int v28;
  void (*v29)(id *);
  void *v30;
  id v31;
  id v32;
  id location;
  objc_super v34;
  BOOL v35;
  SEL v36;
  BuddyAwaitUserConfigurationViewController *v37;

  v37 = self;
  v36 = a2;
  v35 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BuddyAwaitUserConfigurationViewController;
  -[BuddyAwaitUserConfigurationViewController viewDidAppear:](&v34, "viewDidAppear:", a3);
  if (!-[BuddyAwaitUserConfigurationViewController _reverifyUserConfigurationState](v37, "_reverifyUserConfigurationState"))
  {
    objc_initWeak(&location, v37);
    v26 = _NSConcreteStackBlock;
    v27 = -1073741824;
    v28 = 0;
    v29 = sub_10005F164;
    v30 = &unk_1002806B8;
    objc_copyWeak(&v31, &location);
    v32 = objc_retainBlock(&v26);
    v25 = 0;
    v3 = (const char *)objc_msgSend(DMCUserSettingsChangedNotification, "UTF8String");
    p_token = &v37->_token;
    v5 = &_dispatch_main_q;
    handler = _NSConcreteStackBlock;
    v20 = -1073741824;
    v21 = 0;
    v22 = sub_10005F1BC;
    v23 = &unk_100280F38;
    v24 = v32;
    LODWORD(v3) = notify_register_dispatch(v3, p_token, (dispatch_queue_t)v5, &handler);

    v25 = (int)v3;
    if ((_DWORD)v3)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v6);
      v17 = 16;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v7 = oslog;
        v8 = v17;
        sub_100038C3C(buf);
        _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "Failed to register for user settings changed notification!", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v10 = _NSConcreteStackBlock;
      v11 = -1073741824;
      v12 = 0;
      v13 = sub_10005F1EC;
      v14 = &unk_100280F60;
      v15 = v32;
      v9 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v10, 5.0);
      -[BuddyAwaitUserConfigurationViewController setTimer:](v37, "setTimer:", v9);

      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v32, 0);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_reverifyUserConfigurationState
{
  BuddyAwaitUserConfigurationController *v2;
  MCProfileConnection *v3;
  unsigned __int8 v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSTimer *v8;
  BuddyAwaitUserConfigurationController *v9;
  _WORD v11[7];
  os_log_type_t v12;
  os_log_t oslog[2];
  BuddyAwaitUserConfigurationViewController *v14;

  v14 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyAwaitUserConfigurationViewController awaitUserConfigurationController](self, "awaitUserConfigurationController");
  v3 = -[BuddyAwaitUserConfigurationController managedConfiguration](v2, "managedConfiguration");
  v4 = -[MCProfileConnection isAwaitingUserConfigured](v3, "isAwaitingUserConfigured");

  if ((v4 & 1) != 0)
    return 0;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(v5);
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = oslog[0];
    v7 = v12;
    sub_100038C3C(v11);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Current user is configured", (uint8_t *)v11, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v8 = -[BuddyAwaitUserConfigurationViewController timer](v14, "timer");
  -[NSTimer invalidate](v8, "invalidate");

  v9 = -[BuddyAwaitUserConfigurationViewController awaitUserConfigurationController](v14, "awaitUserConfigurationController");
  -[BuddyAwaitUserConfigurationController controllerDone](v9, "controllerDone");

  return 1;
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (BuddyAwaitUserConfigurationController)awaitUserConfigurationController
{
  return (BuddyAwaitUserConfigurationController *)objc_loadWeakRetained((id *)&self->_awaitUserConfigurationController);
}

- (void)setAwaitUserConfigurationController:(id)a3
{
  objc_storeWeak((id *)&self->_awaitUserConfigurationController, a3);
}

- (int)token
{
  return self->_token;
}

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_awaitUserConfigurationController);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
}

@end
