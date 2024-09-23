@implementation RetailDiagnosticsController

- (RetailDiagnosticsController)init
{
  id v2;
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  RetailDiagnosticsController *v7;
  objc_super v9;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Retail Diagnostics"));
  v2 = v11;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("RETAIL_DIAGNOSTICS"), &stru_100284738, CFSTR("RetailDiagnostics"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("RETAIL_DIAGNOSTICS_DESCRIPTION"), &stru_100284738, CFSTR("RetailDiagnostics"));
  v11 = 0;
  v9.receiver = v2;
  v9.super_class = (Class)RetailDiagnosticsController;
  v11 = -[RetailDiagnosticsController initWithTitle:detailText:icon:](&v9, "initWithTitle:detailText:icon:", v4, v6, location[0]);
  v7 = (RetailDiagnosticsController *)v11;

  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v7;
}

- (void)viewDidLoad
{
  RetailDiagnosticsController *v2;
  NSBundle *v3;
  NSString *v4;
  RetailDiagnosticsController *v5;
  NSBundle *v6;
  NSString *v7;
  objc_super v8;
  SEL v9;
  RetailDiagnosticsController *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)RetailDiagnosticsController;
  -[RetailDiagnosticsController viewDidLoad](&v8, "viewDidLoad");
  v2 = v10;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("START_DIAGNOSTICS"), &stru_100284738, CFSTR("RetailDiagnostics"));
  -[BuddyWelcomeController addBoldButton:action:](v2, "addBoldButton:action:", v4, "_startDiagnostics");

  v5 = v10;
  v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("SKIP_DIAGNOSTICS"), &stru_100284738, CFSTR("RetailDiagnostics"));
  -[BuddyWelcomeController addLinkButton:action:](v5, "addLinkButton:action:", v7, "_skipDiagnostics");

}

- (void)_startDiagnostics
{
  id v2;
  void **v3;
  int v4;
  int v5;
  void (*v6)(NSObject *, void *, void *);
  void *v7;
  id v8[2];
  RetailDiagnosticsController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v2 = sub_10011D2E4();
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_10011D3D0;
  v7 = &unk_1002831C8;
  v8[0] = v9;
  objc_msgSend(v2, "requestDiagnosticsRemoteViewControllerWithConnectionHandler:", &v3);
  objc_storeStrong(v8, 0);
}

- (void)_skipDiagnostics
{
  BFFFlowItemDelegate *v2;

  v2 = -[BuddyWelcomeController delegate](self, "delegate", a2);
  -[BFFFlowItemDelegate flowItemDone:](v2, "flowItemDone:", self);

}

+ (BOOL)controllerNeedsToRun
{
  return (BYSetupAssistantHasCompletedInitialRun(a1, a2) ^ 1) & 1;
}

- (BOOL)controllerNeedsToRun
{
  BuddyButtonMonitor *v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog[3];

  oslog[2] = (os_log_t)self;
  oslog[1] = (os_log_t)a2;
  v2 = -[RetailDiagnosticsController buttonMonitor](self, "buttonMonitor");
  v3 = !-[BuddyButtonMonitor isAnyButtonPressed](v2, "isAnyButtonPressed");

  if ((v3 & 1) == 0)
    return 1;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(v4);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = oslog[0];
    v6 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Skipping retail diagnostics; no buttons pressed",
      (uint8_t *)v8,
      2u);
  }
  objc_storeStrong((id *)oslog, 0);
  return 0;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)isEphemeral
{
  return 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  NSObject *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = dispatch_get_global_queue(25, 0);
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10011D868;
  v8 = &unk_100280780;
  v9 = location[0];
  dispatch_async(v3, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  DADiagnosticsRemoteHostViewController *v2;
  id v3;

  v2 = -[RetailDiagnosticsController diagnosticsRemoteController](self, "diagnosticsRemoteController", a2, self);
  v3 = -[DADiagnosticsRemoteHostViewController disconnect](v2, "disconnect");

}

- (void)didTerminateWithError:(id)a3
{
  uint64_t v3;
  NSString *v4;
  NSObject *v5;
  os_log_type_t v6;
  DADiagnosticsRemoteHostViewController *v7;
  BOOL v8;
  DADiagnosticsRemoteHostViewController *v9;
  void **v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  RetailDiagnosticsController *v15;
  char v16;
  id v17;
  char v18;
  id v19;
  uint8_t v20[15];
  os_log_type_t v21;
  os_log_t oslog;
  char v23;
  id v24;
  char v25;
  id v26;
  os_log_type_t v27;
  id v28;
  id location[2];
  RetailDiagnosticsController *v30;
  uint8_t buf[24];

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v28 = (id)_BYLoggingFacility(v3);
    v27 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      v25 = 0;
      v23 = 0;
      if ((_BYIsInternalInstall() & 1) != 0)
      {
        v4 = (NSString *)location[0];
      }
      else if (location[0])
      {
        v26 = objc_msgSend(location[0], "domain");
        v25 = 1;
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v26, objc_msgSend(location[0], "code"));
        v24 = v4;
        v23 = 1;
      }
      else
      {
        v4 = 0;
      }
      sub_100039500((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, v27, "Diagnostics finished with error: %{public}@", buf, 0xCu);
      if ((v23 & 1) != 0)

      if ((v25 & 1) != 0)
    }
    objc_storeStrong(&v28, 0);
  }
  else
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v3);
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      v6 = v21;
      sub_100038C3C(v20);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Diagnostics finished successfully", v20, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v7 = -[RetailDiagnosticsController diagnosticsRemoteController](v30, "diagnosticsRemoteController");
  v18 = 0;
  v16 = 0;
  v8 = 0;
  if (v7)
  {
    v19 = -[RetailDiagnosticsController diagnosticsRemoteController](v30, "diagnosticsRemoteController");
    v18 = 1;
    v17 = objc_msgSend(v19, "presentingViewController");
    v16 = 1;
    v8 = v17 != 0;
  }
  if ((v16 & 1) != 0)

  if ((v18 & 1) != 0)
  if (v8)
  {
    v9 = -[RetailDiagnosticsController diagnosticsRemoteController](v30, "diagnosticsRemoteController");
    v10 = _NSConcreteStackBlock;
    v11 = -1073741824;
    v12 = 0;
    v13 = sub_10011E3E0;
    v14 = &unk_100280730;
    v15 = v30;
    -[DADiagnosticsRemoteHostViewController dismissViewControllerAnimated:completion:](v9, "dismissViewControllerAnimated:completion:", 1, &v10);

    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(location, 0);
}

- (BuddyButtonMonitor)buttonMonitor
{
  return self->_buttonMonitor;
}

- (void)setButtonMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_buttonMonitor, a3);
}

- (DADiagnosticsRemoteHostViewController)diagnosticsRemoteController
{
  return self->_diagnosticsRemoteController;
}

- (void)setDiagnosticsRemoteController:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsRemoteController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticsRemoteController, 0);
  objc_storeStrong((id *)&self->_buttonMonitor, 0);
}

@end
