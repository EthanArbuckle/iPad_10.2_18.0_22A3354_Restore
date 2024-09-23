@implementation SUSUISoftwareUpdateAuthenticationViewController

- (SUSUISoftwareUpdateAuthenticationViewController)initWithDescriptor:(id)a3 forInstallTonight:(BOOL)a4 withInstallForecast:(id)a5 canDeferInstallation:(BOOL)a6
{
  SUSUISoftwareUpdateAuthenticationViewController *v6;
  unsigned __int8 v7;
  SUSSoftwareUpdateTermsManager *v8;
  SUSSoftwareUpdateTermsManager *termsManager;
  dispatch_queue_t v10;
  OS_dispatch_queue *clientQueue;
  id v12;
  SUManagerClient *v13;
  SUManagerClient *suManagerClient;
  SUSUISoftwareUpdateAuthenticationViewController *v16;
  SUSUISoftwareUpdateAuthenticationViewController *v20;
  objc_super v21;
  BOOL v22;
  id v23;
  BOOL v24;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = a4;
  v23 = 0;
  objc_storeStrong(&v23, a5);
  v22 = a6;
  v6 = v26;
  v26 = 0;
  v21.receiver = v6;
  v21.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  v20 = -[SUSUISoftwareUpdateAuthenticationViewController init](&v21, "init");
  v26 = v20;
  objc_storeStrong((id *)&v26, v20);
  if (v20)
  {
    v26->_forInstallTonight = v24;
    v26->_canDeferInstallation = v22;
    objc_storeStrong((id *)&v26->_descriptor, location[0]);
    objc_storeStrong((id *)&v26->_rollbackDescriptor, 0);
    v7 = objc_msgSend(location[0], "isSplatOnly");
    v26->_createInstallationKeybag = (v7 ^ 1) & 1;
    v26->_showingPinController = 0;
    v26->_doneWithPinController = 0;
    if (v23)
      objc_storeStrong((id *)&v26->_installForecast, v23);
    v8 = (SUSSoftwareUpdateTermsManager *)objc_alloc_init((Class)SUSSoftwareUpdateTermsManager);
    termsManager = v26->_termsManager;
    v26->_termsManager = v8;

    v10 = dispatch_queue_create("com.apple.susui.authVC.susQueue", 0);
    clientQueue = v26->_clientQueue;
    v26->_clientQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc((Class)SUManagerClient);
    v13 = (SUManagerClient *)objc_msgSend(v12, "initWithDelegate:queue:clientType:", 0, v26->_clientQueue, 0);
    suManagerClient = v26->_suManagerClient;
    v26->_suManagerClient = v13;

  }
  v16 = v26;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v16;
}

- (SUSUISoftwareUpdateAuthenticationViewController)initWithRollbackDescriptor:(id)a3 canDeferInstallation:(BOOL)a4
{
  SUSUISoftwareUpdateAuthenticationViewController *v4;
  SUSSoftwareUpdateTermsManager *v5;
  SUSSoftwareUpdateTermsManager *termsManager;
  dispatch_queue_t v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  SUManagerClient *v10;
  SUManagerClient *suManagerClient;
  SUSUISoftwareUpdateAuthenticationViewController *v13;
  SUSUISoftwareUpdateAuthenticationViewController *v15;
  objc_super v16;
  BOOL v17;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = a4;
  v4 = v19;
  v19 = 0;
  v16.receiver = v4;
  v16.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  v15 = -[SUSUISoftwareUpdateAuthenticationViewController init](&v16, "init");
  v19 = v15;
  objc_storeStrong((id *)&v19, v15);
  if (v15)
  {
    v19->_forInstallTonight = 0;
    objc_storeStrong((id *)&v19->_descriptor, 0);
    objc_storeStrong((id *)&v19->_installForecast, 0);
    v19->_showingPinController = 0;
    v19->_doneWithPinController = 0;
    objc_storeStrong((id *)&v19->_rollbackDescriptor, location[0]);
    v19->_canDeferInstallation = v17;
    v19->_createInstallationKeybag = 0;
    v5 = (SUSSoftwareUpdateTermsManager *)objc_alloc_init((Class)SUSSoftwareUpdateTermsManager);
    termsManager = v19->_termsManager;
    v19->_termsManager = v5;

    v7 = dispatch_queue_create("com.apple.susui.authVC.susQueue", 0);
    clientQueue = v19->_clientQueue;
    v19->_clientQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc((Class)SUManagerClient);
    v10 = (SUManagerClient *)objc_msgSend(v9, "initWithDelegate:queue:clientType:", 0, v19->_clientQueue, 0);
    suManagerClient = v19->_suManagerClient;
    v19->_suManagerClient = v10;

  }
  v13 = v19;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v19, 0);
  return v13;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  SUSUISoftwareUpdateAuthenticationViewController *v4;

  v4 = self;
  v3 = a2;
  objc_storeWeak((id *)&self->_delegate, 0);
  -[SUSUISoftwareUpdateAuthenticationViewController _sendDeactivationResponseFailureIfNecessary](v4, "_sendDeactivationResponseFailureIfNecessary");
  v2.receiver = v4;
  v2.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  -[SUSUISoftwareUpdateAuthenticationViewController dealloc](&v2, "dealloc");
}

- (void)loadView
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  SUSUIPasscodeEntryView *v6;
  SUSUIPasscodeEntryView *v7;
  SUSUIInstallTonightPasscodeEntryView *v8;
  SUSUIPasscodeEntryView *view;
  UIDevice *v10;
  BOOL v11;
  UIScreen *v12;
  SBUIPasscodeLockView *v13;
  __int128 v14;
  __int128 v15;
  SEL v16;
  SUSUISoftwareUpdateAuthenticationViewController *v17;

  v17 = self;
  v16 = a2;
  v12 = +[UIScreen mainScreen](UIScreen, "mainScreen");
  -[UIScreen bounds](v12, "bounds");
  *(_QWORD *)&v14 = v2;
  *((_QWORD *)&v14 + 1) = v3;
  *(_QWORD *)&v15 = v4;
  *((_QWORD *)&v15 + 1) = v5;

  if (v17->_forInstallTonight)
  {
    v8 = -[SUSUIInstallTonightPasscodeEntryView initWithFrame:]([SUSUIInstallTonightPasscodeEntryView alloc], "initWithFrame:", v14, v15);
    view = v17->_view;
    v17->_view = &v8->super;

    -[SUSUIPasscodeEntryView setInstallTonightForecast:](v17->_view, "setInstallTonightForecast:", v17->_installForecast);
    -[SUSUIPasscodeEntryView setDescriptor:](v17->_view, "setDescriptor:", v17->_descriptor);
  }
  else
  {
    v6 = -[SUSUIPasscodeEntryView initWithFrame:]([SUSUIPasscodeEntryView alloc], "initWithFrame:", v14, v15);
    v7 = v17->_view;
    v17->_view = v6;

  }
  v13 = -[SUSUIPasscodeEntryView passcodeLockView](v17->_view, "passcodeLockView");
  -[SBUIPasscodeLockView setDelegate:](v13, "setDelegate:", v17);
  v10 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v11 = (id)-[UIDevice userInterfaceIdiom](v10, "userInterfaceIdiom") != (id)1;

  if (v11)
    -[SBUIPasscodeLockView setShowsEmergencyCallButton:](v13, "setShowsEmergencyCallButton:", !v17->_canDeferInstallation);
  else
    -[SBUIPasscodeLockView setShowsEmergencyCallButton:](v13, "setShowsEmergencyCallButton:", 0);
  -[SBUIPasscodeLockView setShowsCancelButton:](v13, "setShowsCancelButton:", v17->_canDeferInstallation);
  -[SBUIPasscodeLockView setBiometricAuthenticationAllowed:](v13, "setBiometricAuthenticationAllowed:", 0);
  -[SUSUIPasscodeEntryView updateStatusText](v17->_view, "updateStatusText");
  -[SUSUISoftwareUpdateAuthenticationViewController setView:](v17, "setView:", v17->_view);
  objc_storeStrong((id *)&v13, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  SUSUISoftwareUpdateAuthenticationViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  -[SUSUISoftwareUpdateAuthenticationViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
  -[SUSUIPasscodeEntryView updateStatusText](v6->_view, "updateStatusText");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  SUSUISoftwareUpdateAuthenticationViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  -[SUSUISoftwareUpdateAuthenticationViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
  -[SUSUISoftwareUpdateAuthenticationViewController _setVisible:animated:completion:](v6, "_setVisible:animated:completion:", 1, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const __CFString *v3;
  const __CFString *v4;
  objc_super v5;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v8;
  SEL v9;
  SUSUISoftwareUpdateAuthenticationViewController *v10;
  uint8_t v11[40];

  v10 = self;
  v9 = a2;
  v8 = a3;
  oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    if (v10->_showingTermsAndConditions)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    sub_100001CF0((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateAuthenticationViewController viewDidDisappear:]", (uint64_t)v3, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s:%@, showingTermsAndConditions:%@", v11, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v5.receiver = v10;
  v5.super_class = (Class)SUSUISoftwareUpdateAuthenticationViewController;
  -[SUSUISoftwareUpdateAuthenticationViewController viewDidDisappear:](&v5, "viewDidDisappear:", v8);
  -[SUSUISoftwareUpdateAuthenticationViewController _sendDeactivationResponseFailureIfNecessary](v10, "_sendDeactivationResponseFailureIfNecessary");
}

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v2;
  uint64_t v3;
  UIDevice *v5;
  unint64_t v6;

  v5 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (id)-[UIDevice userInterfaceIdiom](v5, "userInterfaceIdiom") == (id)1;
  v3 = 30;
  if (!v2)
    v3 = 2;
  v6 = v3;

  return v6;
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v3;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v5, "delegate");
  -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewControllerWantsIdleTimerReset:](v3, "viewControllerWantsIdleTimerReset:", v5);

  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateAuthenticationViewController _passcodeLockViewPasscodeEntered:viaMesa:](v4, "_passcodeLockViewPasscodeEntered:viaMesa:", location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateAuthenticationViewController _passcodeLockViewPasscodeEntered:viaMesa:](v4, "_passcodeLockViewPasscodeEntered:viaMesa:", location[0], 1);
  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUISoftwareUpdateAuthenticationViewController _authenticationCancelled](v4, "_authenticationCancelled");
  objc_storeStrong(location, 0);
}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  NSObject *log;
  os_log_type_t type;
  void **v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  SUSUISoftwareUpdateAuthenticationViewController *v10;
  uint8_t v11[15];
  os_log_type_t v12;
  id v13;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)SUSUILogAuthenticationUI();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    sub_1000020A4(v11);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Emergency call button hit", v11, 2u);
  }
  objc_storeStrong(&v13, 0);
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000020C0;
  v9 = &unk_100014550;
  v10 = v15;
  +[SUSUIRemoteEmergencyCallViewController requestEmergencyCallControllerWithCompletion:](SUSUIRemoteEmergencyCallViewController, "requestEmergencyCallControllerWithCompletion:", &v5);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissEmergencyCallViewController:(id)a3
{
  void **v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  SUSUISoftwareUpdateAuthenticationViewController *v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(uint64_t);
  void *v13;
  SUSUISoftwareUpdateAuthenticationViewController *v14;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = _NSConcreteStackBlock;
  v10 = -1073741824;
  v11 = 0;
  v12 = sub_100002460;
  v13 = &unk_100014528;
  v14 = v16;
  v3 = _NSConcreteStackBlock;
  v4 = -1073741824;
  v5 = 0;
  v6 = sub_1000024BC;
  v7 = &unk_100014578;
  v8 = v16;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &v9, 0.4);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4
{
  id v5;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSUISoftwareUpdateAuthenticationViewController bs_removeChildViewController:](v7, "bs_removeChildViewController:", v7->_emergencyVC);
  objc_storeStrong((id *)&v7->_emergencyVC, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_setVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  SUSUISoftwareUpdateAuthenticationViewController *v5;
  void **v6;
  int v7;
  int v8;
  id (*v9)(uint64_t);
  void *v10;
  SUSUISoftwareUpdateAuthenticationViewController *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location;
  BOOL v16;
  BOOL v17;
  SEL v18;
  SUSUISoftwareUpdateAuthenticationViewController *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  if (v19->_showingTermsAndConditions)
  {
    if (v17)
    {
      if (location)
        (*((void (**)(id, uint64_t))location + 2))(location, 1);
    }
    else
    {
      v5 = v19;
      v6 = _NSConcreteStackBlock;
      v7 = -1073741824;
      v8 = 0;
      v9 = sub_100002808;
      v10 = &unk_1000145A0;
      v11 = v19;
      v13 = v17;
      v14 = v16;
      v12 = location;
      -[SUSUISoftwareUpdateAuthenticationViewController _dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:](v5, "_dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:", 1, &v6);
      objc_storeStrong(&v12, 0);
      objc_storeStrong((id *)&v11, 0);
    }
  }
  else if (v17)
  {
    if (-[SUSUISoftwareUpdateAuthenticationViewController _shouldShowPasscodeView](v19, "_shouldShowPasscodeView"))
      -[SUSUIPasscodeEntryView setPasscodeViewsToVisible:animated:completion:](v19->_view, "setPasscodeViewsToVisible:animated:completion:", v17, v16, location);
    else
      -[SUSUISoftwareUpdateAuthenticationViewController _presentTermsAndConditionsWithCompletion:](v19, "_presentTermsAndConditionsWithCompletion:", location);
  }
  else
  {
    -[SUSUIPasscodeEntryView setPasscodeViewsToVisible:animated:completion:](v19->_view, "setPasscodeViewsToVisible:animated:completion:", v17, v16, location);
    -[SUSUISoftwareUpdateAuthenticationViewController _dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:](v19, "_dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:", 0, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_attemptUnlock:(id)a3 passcode:(id)a4
{
  char v5;
  char v6;
  id v7;
  BOOL v8;
  id v9;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = objc_msgSend(v9, "length") != 0;
  v7 = +[SUSUIAuthenticationInterface sharedInstance](SUSUIAuthenticationInterface, "sharedInstance");
  v6 = 0;
  v5 = objc_msgSend(v7, "attemptAuthentication:outBlocked:", v9, &v6) & 1;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(location[0], "reset");
    -[SUSUISoftwareUpdateAuthenticationViewController _dismissAndSendCompletionResponse:](v11, "_dismissAndSendCompletionResponse:", 0);
  }
  else if ((v5 & 1) != 0)
  {
    objc_msgSend(location[0], "reset");
    -[SUSUISoftwareUpdateAuthenticationViewController _authenticationSuccess:fromMesa:](v11, "_authenticationSuccess:fromMesa:", v9, !v8);
  }
  else
  {
    objc_msgSend(location[0], "resetForFailedPasscode");
    -[SUSUISoftwareUpdateAuthenticationViewController _authenticationFailure:fromMesa:](v11, "_authenticationFailure:fromMesa:", v9, !v8);
  }
  v11->_attemptingUnlock = 0;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_passcodeLockViewPasscodeEntered:(id)a3 viaMesa:(BOOL)a4
{
  dispatch_time_t when;
  dispatch_queue_t queue;
  void **v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  SUSUISoftwareUpdateAuthenticationViewController *v13;
  BOOL v14;
  dispatch_time_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  if (v20->_attemptingUnlock)
  {
    v17 = 1;
  }
  else
  {
    v20->_attemptingUnlock = 1;
    v16 = 0x3FC999999999999ALL;
    v15 = dispatch_time(0, (uint64_t)(0.2 * 1000000000.0));
    when = v15;
    queue = &_dispatch_main_q;
    v7 = _NSConcreteStackBlock;
    v8 = -1073741824;
    v9 = 0;
    v10 = sub_100002B88;
    v11 = &unk_1000145C8;
    v14 = v18;
    v12 = location[0];
    v13 = v20;
    dispatch_after(when, queue, &v7);

    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v12, 0);
    v17 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_authenticationCancelled
{
  -[SUSUISoftwareUpdateAuthenticationViewController _dismissSelf:](self, "_dismissSelf:", 0, a2, self);
}

- (void)_authenticationFailure:(id)a3 fromMesa:(BOOL)a4
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v7[7];
  os_log_type_t v8;
  id v9;
  BOOL v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = (id)SUSUILogAuthenticationUI();
  v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = v9;
    type = v8;
    sub_1000020A4(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Failed passcode auth attempt.", v7, 2u);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_authenticationSuccess:(id)a3 fromMesa:(BOOL)a4
{
  NSString *v4;
  NSString *passcode;
  NSObject *log;
  os_log_type_t type;
  uint8_t v9[7];
  os_log_type_t v10;
  id v11;
  BOOL v12;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = a4;
  v11 = (id)SUSUILogAuthenticationUI();
  v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    log = v11;
    type = v10;
    sub_1000020A4(v9);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Successful passcode auth attempt; presenting terms and conditions if necessary.",
      v9,
      2u);
  }
  objc_storeStrong(&v11, 0);
  v4 = (NSString *)objc_msgSend(location[0], "copy");
  passcode = v14->_passcode;
  v14->_passcode = v4;

  -[SUSUISoftwareUpdateAuthenticationViewController _presentTermsAndConditionsWithCompletion:](v14, "_presentTermsAndConditionsWithCompletion:", 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_shouldShowPasscodeView
{
  SUKeybagInterface *v3;
  unsigned __int8 v4;

  v3 = +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v4 = -[SUKeybagInterface hasPasscodeSet](v3, "hasPasscodeSet");

  return v4 & 1;
}

- (void)_presentTermsAndConditionsWithCompletion:(id)a3
{
  UIViewController *v3;
  UIViewController *termsAndConditionsController;
  UIViewController *v5;
  SUSUISoftwareUpdateAuthenticationViewController *v6;
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v7;
  UIView *v8;
  UIDevice *v9;
  BOOL v10;
  void **v11;
  int v12;
  int v13;
  void (*v14)(id *);
  void *v15;
  SUSUISoftwareUpdateAuthenticationViewController *v16;
  id v17;
  int v18;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v20->_showingTermsAndConditions)
  {
    if (location[0])
      (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    v18 = 1;
  }
  else
  {
    v3 = (UIViewController *)objc_msgSend(objc_alloc((Class)UIViewController), "initWithNibName:bundle:", 0);
    termsAndConditionsController = v20->_termsAndConditionsController;
    v20->_termsAndConditionsController = v3;

    v8 = -[UIViewController view](v20->_termsAndConditionsController, "view");
    -[UIView setAlpha:](v8, "setAlpha:", 0.0);

    -[UIViewController setModalPresentationStyle:](v20->_termsAndConditionsController, "setModalPresentationStyle:", 0);
    v20->_showingTermsAndConditions = 1;
    v9 = +[UIDevice currentDevice](UIDevice, "currentDevice");
    v10 = (id)-[UIDevice userInterfaceIdiom](v9, "userInterfaceIdiom") == (id)1;

    if (!v10)
    {
      v7 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v20, "delegate");
      -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewController:wantsStatusBarHidden:withDuration:](v7, "viewController:wantsStatusBarHidden:withDuration:", v20, 1, 0.4);

    }
    v6 = v20;
    v5 = v20->_termsAndConditionsController;
    v11 = _NSConcreteStackBlock;
    v12 = -1073741824;
    v13 = 0;
    v14 = sub_100003178;
    v15 = &unk_100014618;
    v16 = v20;
    v17 = location[0];
    -[SUSUISoftwareUpdateAuthenticationViewController presentViewController:animated:completion:](v6, "presentViewController:animated:completion:", v5, 0, &v11);
    objc_storeStrong(&v17, 0);
    objc_storeStrong((id *)&v16, 0);
    v18 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)_dismissTermsAndConditionsIfNecessaryAnimated:(BOOL)a3 withCompletion:(id)a4
{
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v4;
  UIDevice *v5;
  BOOL v6;
  id location;
  BOOL v8;
  SEL v9;
  SUSUISoftwareUpdateAuthenticationViewController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v10->_showingTermsAndConditions)
  {
    v10->_showingTermsAndConditions = 0;
    v5 = +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (id)-[UIDevice userInterfaceIdiom](v5, "userInterfaceIdiom") == (id)1;

    if (!v6)
    {
      v4 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v10, "delegate");
      -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewController:wantsStatusBarHidden:withDuration:](v4, "viewController:wantsStatusBarHidden:withDuration:", v10, 0, 0.4);

    }
    -[UIViewController dismissViewControllerAnimated:completion:](v10->_termsAndConditionsController, "dismissViewControllerAnimated:completion:", v8, location);
  }
  else if (location)
  {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0);
}

- (void)_dismissAndSendCompletionResponse:(BOOL)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v8;
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v9;
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v10;
  SUSUISoftwareUpdateAuthenticationViewControllerDelegate *v11;
  NSObject *v12;
  os_log_type_t v13;
  SUKeybagInterface *v14;
  unsigned __int8 v15;
  os_log_t oslog;
  uint8_t v17[15];
  os_log_type_t v18;
  id v19;
  os_log_type_t v20;
  id v21;
  os_log_type_t v22;
  id v23;
  char v24;
  char v25;
  os_log_type_t v26;
  id location;
  BOOL v28;
  SEL v29;
  SUSUISoftwareUpdateAuthenticationViewController *v30;
  uint8_t v31[16];
  uint8_t v32[16];
  uint8_t v33[16];
  uint8_t v34[24];

  v30 = self;
  v29 = a2;
  v28 = a3;
  if (!self->_responseSent)
  {
    v30->_responseSent = 1;
    location = (id)SUSUILogAuthenticationUI();
    v26 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      if (v28)
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      sub_100003BA4((uint64_t)v34, (uint64_t)v3);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v26, "_dismissAndSendCompletionResponse: possibleSuccess=%@", v34, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v25 = v28;
    if (v28)
    {
      if (v30->_createInstallationKeybag)
      {
        v14 = +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
        v15 = -[SUKeybagInterface hasPasscodeSet](v14, "hasPasscodeSet");

        v24 = v15 & 1;
        if ((v15 & 1) != 0)
        {
          v25 = -[SUSUISoftwareUpdateAuthenticationViewController _createKeybagForPasscode:forInstallTonight:](v30, "_createKeybagForPasscode:forInstallTonight:", v30->_passcode, v30->_forInstallTonight);
          v23 = (id)SUSUILogAuthenticationUI();
          v22 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
          {
            if ((v25 & 1) != 0)
              v4 = CFSTR("YES");
            else
              v4 = CFSTR("NO");
            sub_100003BA4((uint64_t)v33, (uint64_t)v4);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, v22, "Authenticated with result [keybag created?]: %@", v33, 0xCu);
          }
          objc_storeStrong(&v23, 0);
        }
        else
        {
          v21 = (id)SUSUILogAuthenticationUI();
          v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
          {
            if ((v25 & 1) != 0)
              v5 = CFSTR("YES");
            else
              v5 = CFSTR("NO");
            sub_100003BA4((uint64_t)v32, (uint64_t)v5);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "Authenticated with result [keybag not required]: %@", v32, 0xCu);
          }
          objc_storeStrong(&v21, 0);
        }
      }
      else
      {
        v19 = (id)SUSUILogAuthenticationUI();
        v18 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
        {
          v12 = v19;
          v13 = v18;
          sub_1000020A4(v17);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Not creating installation keybag due to _createInstallationKeybag == NO", v17, 2u);
        }
        objc_storeStrong(&v19, 0);
      }
      v10 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v30, "delegate");
      -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewControllerAuthenticatedWithResult:](v10, "viewControllerAuthenticatedWithResult:", v25 & 1);

      v11 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v30, "delegate");
      -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewControllerWantsDismissal:](v11, "viewControllerWantsDismissal:", v30);

    }
    else
    {
      oslog = (os_log_t)(id)SUSUILogAuthenticationUI();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        if ((v25 & 1) != 0)
          v6 = CFSTR("YES");
        else
          v6 = CFSTR("NO");
        sub_100003BA4((uint64_t)v31, (uint64_t)v6);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Authenticated with result [no passcode set]: %@", v31, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v8 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v30, "delegate");
      -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewControllerAuthenticatedWithResult:](v8, "viewControllerAuthenticatedWithResult:", v25 & 1);

      v9 = -[SUSUISoftwareUpdateAuthenticationViewController delegate](v30, "delegate");
      -[SUSUISoftwareUpdateAuthenticationViewControllerDelegate viewControllerWantsDismissal:](v9, "viewControllerWantsDismissal:", v30);

    }
    -[SUManagerClient invalidate](v30->_suManagerClient, "invalidate", &stru_10001B000);
    objc_storeStrong((id *)((char *)&v30->super.super.super.isa + *(int *)(v7 + 2392)), 0);
  }
}

- (BOOL)_createKeybagForPasscode:(id)a3 forInstallTonight:(BOOL)a4
{
  NSObject *queue;
  char v7;
  void **v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  SUSUISoftwareUpdateAuthenticationViewController *v13;
  id v14[2];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  int v19;
  char v20;
  id v21;
  BOOL v22;
  id location[2];
  SUSUISoftwareUpdateAuthenticationViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  objc_initWeak(&v21, v24->_suManagerClient);
  v16 = 0;
  v17 = &v16;
  v18 = 0x20000000;
  v19 = 32;
  v20 = 0;
  queue = v24->_clientQueue;
  v8 = _NSConcreteStackBlock;
  v9 = -1073741824;
  v10 = 0;
  v11 = sub_100003D74;
  v12 = &unk_100014640;
  v13 = v24;
  v14[0] = location[0];
  v14[1] = &v16;
  objc_copyWeak(&v15, &v21);
  dispatch_sync(queue, &v8);
  v7 = *((_BYTE *)v17 + 24);
  objc_destroyWeak(&v15);
  objc_storeStrong(v14, 0);
  objc_storeStrong((id *)&v13, 0);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&v21);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (void)_sendDeactivationResponseFailureIfNecessary
{
  -[SUSUISoftwareUpdateAuthenticationViewController _dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:](self, "_dismissTermsAndConditionsIfNecessaryAnimated:withCompletion:", 0, 0);
  -[SUSUISoftwareUpdateAuthenticationViewController _dismissAndSendCompletionResponse:](self, "_dismissAndSendCompletionResponse:", 0);
}

- (void)_dismissSelf:(BOOL)a3
{
  const __CFString *v3;
  SUSUISoftwareUpdateAuthenticationViewController *v4;
  void **v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char);
  void *v9;
  id v10;
  BOOL v11;
  id from;
  os_log_type_t v13;
  id location;
  BOOL v15;
  SEL v16;
  SUSUISoftwareUpdateAuthenticationViewController *v17;
  uint8_t v18[24];

  v17 = self;
  v16 = a2;
  v15 = a3;
  location = (id)SUSUILogAuthenticationUI();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    sub_100003BA4((uint64_t)v18, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v13, "Requesting dismissal for self with succes: %@", v18, 0xCu);
  }
  objc_storeStrong(&location, 0);
  v17->_doneWithPinController = 1;
  objc_initWeak(&from, v17);
  v4 = v17;
  v5 = _NSConcreteStackBlock;
  v6 = -1073741824;
  v7 = 0;
  v8 = sub_1000041CC;
  v9 = &unk_100014668;
  objc_copyWeak(&v10, &from);
  v11 = v15;
  -[SUSUISoftwareUpdateAuthenticationViewController _setVisible:animated:completion:](v4, "_setVisible:animated:completion:", 0, 1, &v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
}

- (void)_termsAgree
{
  -[SUSUISoftwareUpdateAuthenticationViewController _dismissSelf:](self, "_dismissSelf:", 1, a2, self);
}

- (void)_termsDisagree
{
  -[SUSUISoftwareUpdateAuthenticationViewController _dismissSelf:](self, "_dismissSelf:", 0, a2, self);
}

- (void)_setChildViewController:(id)a3
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
  SUSUISoftwareUpdateAuthenticationViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[SUSUISoftwareUpdateAuthenticationViewController view](v13, "view");
  objc_msgSend(v7, "bounds");
  *(_QWORD *)&v10 = v3;
  *((_QWORD *)&v10 + 1) = v4;
  *(_QWORD *)&v11 = v5;
  *((_QWORD *)&v11 + 1) = v6;

  v9 = objc_msgSend(location[0], "view");
  objc_msgSend(v9, "setFrame:", v10, v11);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(location[0], "willMoveToParentViewController:", v13);
  v8 = -[SUSUISoftwareUpdateAuthenticationViewController view](v13, "view");
  objc_msgSend(v8, "addSubview:", v9);

  -[SUSUISoftwareUpdateAuthenticationViewController addChildViewController:](v13, "addChildViewController:", location[0]);
  objc_msgSend(location[0], "didMoveToParentViewController:", v13);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SUSUISoftwareUpdateAuthenticationViewControllerDelegate)delegate
{
  return (SUSUISoftwareUpdateAuthenticationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_emergencyVC, 0);
  objc_storeStrong((id *)&self->_suManagerClient, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_installForecast, 0);
  objc_storeStrong((id *)&self->_termsManager, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
