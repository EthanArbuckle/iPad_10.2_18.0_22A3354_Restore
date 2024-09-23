@implementation ContinuityCaptureViewController

+ (void)initialize
{
  int v2;

  if ((id)objc_opt_class(ContinuityCaptureViewController, a2) == a1)
  {
    v2 = FigNote_AllowInternalDefaultLogs() != 0;
    fig_note_initialize_category_with_default_work_cf(&unk_10001A130, CFSTR("continuitycaptureviewcontroller_trace"), CFSTR("com.apple.coremedia"), ", "com.apple.cameracapture", (v2 << 31), 0, &unk_10001A128);
    fig_note_initialize_category_with_default_work_cf(&dword_10001A140, CFSTR("continuitycaptureviewcontroller_trace"), CFSTR("com.apple.coremedia"), ", "com.apple.cameracapture", 0x80000000, 0, &qword_10001A138);
  }
}

- (ContinuityCaptureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  NSObject *global_queue;
  ContinuityCaptureViewController *v8;
  ContinuityCaptureViewController *v9;
  ContinuityCaptureRemoteUISystemStatus *v10;
  ContinuityCaptureRemoteUISystemStatus *v11;
  objc_super v13;

  global_queue = dispatch_get_global_queue(2, 0);
  dispatch_async(global_queue, &stru_100014618);
  v13.receiver = self;
  v13.super_class = (Class)ContinuityCaptureViewController;
  v8 = -[ContinuityCaptureViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", a3, a4);
  v9 = v8;
  if (v8)
  {
    objc_sync_enter(v8);
    v9->_activeRequests = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_sync_exit(v9);
    v9->_uiState = 0;
    FigCaptureSessionRemoteSetWombatInUse(1);
    v10 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance");
    -[ContinuityCaptureRemoteUISystemStatus addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", v9, CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, 3, 0);
    v11 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance");
    -[ContinuityCaptureRemoteUISystemStatus addObserver:forKeyPath:options:context:](v11, "addObserver:forKeyPath:options:context:", v9, CMContinuityCaptureCallStateKVOKey, 3, 0);
    -[ContinuityCaptureRemoteUISystemStatus holdIdleSleepAssertionForReason:](+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"), "holdIdleSleepAssertionForReason:", &stru_100014A80);
    -[ContinuityCaptureRemoteUISystemStatus addObserver:](+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"), "addObserver:", v9);
  }
  return v9;
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  NSObject *connectionInterruptTimer;
  ContinuityCaptureRemoteUISystemStatus *v9;
  ContinuityCaptureRemoteUISystemStatus *v10;
  CMContinuityCaptureRemoteCompositeDevice *continuityCaptureDevice;
  objc_super v12;
  os_log_type_t type;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  ContinuityCaptureViewController *v18;
  _BYTE v19[128];

  if (dword_10001A140)
  {
    v14 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v14, &type);
    v4 = v14;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v15 = 136315394;
      v16 = "-[ContinuityCaptureViewController dealloc]";
      v17 = 2048;
      v18 = self;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v19, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v15, 22);
      v4 = v14;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v19, v4, 0);
  }
  FigCaptureSessionRemoteSetWombatInUse(0);
  FigCaptureSessionRemoteSetWombatEnabled(0);

  -[FigCaptureDeviceLockStateMonitor removeDeviceLockStateObserver:](self->_lockStateMonitor, "removeDeviceLockStateObserver:", self);
  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");

  connectionInterruptTimer = self->_connectionInterruptTimer;
  if (connectionInterruptTimer)
  {
    dispatch_source_cancel(connectionInterruptTimer);

  }
  v9 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance");
  -[ContinuityCaptureRemoteUISystemStatus removeObserver:forKeyPath:context:](v9, "removeObserver:forKeyPath:context:", self, CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, 0);
  v10 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance");
  -[ContinuityCaptureRemoteUISystemStatus removeObserver:forKeyPath:context:](v10, "removeObserver:forKeyPath:context:", self, CMContinuityCaptureCallStateKVOKey, 0);
  -[ContinuityCaptureRemoteUISystemStatus removeObserver:](+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"), "removeObserver:", self);
  continuityCaptureDevice = self->_continuityCaptureDevice;
  if (continuityCaptureDevice)
  {
    -[CMContinuityCaptureRemoteCompositeDevice removeObserver:forKeyPath:context:](continuityCaptureDevice, "removeObserver:forKeyPath:context:", self, CMContinuityCaptureRemoteCompositeStateKVOKey, 0);
    -[CMContinuityCaptureRemoteCompositeDevice invalidate](self->_continuityCaptureDevice, "invalidate");

  }
  v12.receiver = self;
  v12.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController dealloc](&v12, "dealloc");
}

- (void)loadView
{
  ContinuityCaptureShieldUIContentView *v3;

  v3 = objc_alloc_init(ContinuityCaptureShieldUIContentView);
  -[ContinuityCaptureShieldUIContentView setDelegate:](v3, "setDelegate:", self);
  -[ContinuityCaptureViewController setView:](self, "setView:", v3);
}

- (void)viewDidLoad
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  FigCaptureDeviceLockStateMonitor *v8;
  id v9;
  _QWORD v10[5];
  objc_super v11;
  os_log_type_t type;
  unsigned int v13;
  int v14;
  const char *v15;
  __int16 v16;
  ContinuityCaptureViewController *v17;
  _BYTE v18[128];

  if (dword_10001A140)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v13, &type);
    v4 = v13;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v14 = 136315394;
      v15 = "-[ContinuityCaptureViewController viewDidLoad]";
      v16 = 2048;
      v17 = self;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v18, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v14, 22);
      v4 = v13;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v18, v4, 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController viewDidLoad](&v11, "viewDidLoad");
  objc_msgSend(-[ContinuityCaptureViewController view](self, "view"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(-[ContinuityCaptureViewController view](self, "view"), "setOverrideUserInterfaceStyle:", 2);
  objc_msgSend(-[ContinuityCaptureViewController view](self, "view"), "_setOverrideUserInterfaceRenderingMode:", 2);
  objc_msgSend(-[ContinuityCaptureViewController view](self, "view"), "_setOverrideVibrancyTrait:", 2);
  self->_connectionType = 0;
  -[ContinuityCaptureViewController _updateUI](self, "_updateUI");
  self->_sidecarLayoutValue = -1;
  v8 = (FigCaptureDeviceLockStateMonitor *)objc_alloc_init((Class)FigCaptureDeviceLockStateMonitor);
  self->_lockStateMonitor = v8;
  -[FigCaptureDeviceLockStateMonitor addDeviceLockStateObserver:](v8, "addDeviceLockStateObserver:", self);
  v9 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor](FBSDisplayLayoutMonitorConfiguration, "configurationForDefaultMainDisplayMonitor");
  objc_msgSend(v9, "setNeedsUserInteractivePriority:", 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006C04;
  v10[3] = &unk_100014668;
  v10[4] = self;
  objc_msgSend(v9, "setTransitionHandler:", v10);
  self->_layoutMonitor = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v9);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  objc_super v10;
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  ContinuityCaptureViewController *v16;
  _BYTE v17[128];

  v3 = a3;
  v12 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v12, &type);
  v6 = v12;
  v7 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v8 = v6;
  else
    v8 = v6 & 0xFFFFFFFE;
  if ((_DWORD)v8)
  {
    v13 = 136315394;
    v14 = "-[ContinuityCaptureViewController viewWillAppear:]";
    v15 = 2048;
    v16 = self;
    v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v13, 22);
    v6 = v12;
  }
  else
  {
    v9 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v9, v9 != v17, v6, 0);
  v10.receiver = self;
  v10.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController viewWillAppear:](&v10, "viewWillAppear:", v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  objc_super v10;
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  ContinuityCaptureViewController *v16;
  _BYTE v17[128];

  v3 = a3;
  v12 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v12, &type);
  v6 = v12;
  v7 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v8 = v6;
  else
    v8 = v6 & 0xFFFFFFFE;
  if ((_DWORD)v8)
  {
    v13 = 136315394;
    v14 = "-[ContinuityCaptureViewController viewDidAppear:]";
    v15 = 2048;
    v16 = self;
    v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v13, 22);
    v6 = v12;
  }
  else
  {
    v9 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v9, v9 != v17, v6, 0);
  v10.receiver = self;
  v10.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController viewDidAppear:](&v10, "viewDidAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  objc_super v10;
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  ContinuityCaptureViewController *v16;
  _BYTE v17[128];

  v3 = a3;
  v12 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v12, &type);
  v6 = v12;
  v7 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v8 = v6;
  else
    v8 = v6 & 0xFFFFFFFE;
  if ((_DWORD)v8)
  {
    v13 = 136315394;
    v14 = "-[ContinuityCaptureViewController viewWillDisappear:]";
    v15 = 2048;
    v16 = self;
    v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v13, 22);
    v6 = v12;
  }
  else
  {
    v9 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v9, v9 != v17, v6, 0);
  v10.receiver = self;
  v10.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController viewWillDisappear:](&v10, "viewWillDisappear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  objc_super v10;
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  ContinuityCaptureViewController *v16;
  _BYTE v17[128];

  v3 = a3;
  v12 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v12, &type);
  v6 = v12;
  v7 = type;
  if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
    v8 = v6;
  else
    v8 = v6 & 0xFFFFFFFE;
  if ((_DWORD)v8)
  {
    v13 = 136315394;
    v14 = "-[ContinuityCaptureViewController viewDidDisappear:]";
    v15 = 2048;
    v16 = self;
    v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v13, 22);
    v6 = v12;
  }
  else
  {
    v9 = 0;
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v9, v9 != v17, v6, 0);
  v10.receiver = self;
  v10.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController viewDidDisappear:](&v10, "viewDidDisappear:", v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)incomingCall:(BOOL)a3 data:(id)a4 shouldDisplayNotification:(BOOL)a5
{
  _BOOL4 v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  const void *v13;
  int v14;
  _QWORD block[6];
  BOOL v16;
  os_log_type_t type;
  unsigned int v18;
  int v19;
  const char *v20;
  __int16 v21;
  ContinuityCaptureViewController *v22;
  __int16 v23;
  _BOOL4 v24;
  _BYTE v25[128];

  v6 = a3;
  if (dword_10001A140)
  {
    v18 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v18, &type);
    v9 = v18;
    v10 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v11 = v9;
    else
      v11 = v9 & 0xFFFFFFFE;
    if ((_DWORD)v11)
    {
      v19 = 136315650;
      v20 = "-[ContinuityCaptureViewController incomingCall:data:shouldDisplayNotification:]";
      v21 = 2048;
      v22 = self;
      v23 = 1024;
      v24 = v6;
      LODWORD(v13) = 28;
      v12 = (_BYTE *)_os_log_send_and_compose_impl(v11, 0, v25, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v10, "<<<< ContinuityCaptureViewController >>>> %s: <%p> status: %d", (const char *)&v19, v13, v14);
      v9 = v18;
    }
    else
    {
      v12 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v12, v12 != v25, v9, 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000073C0;
  block[3] = &unk_100014690;
  v16 = v6;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)callActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  const void *v10;
  _QWORD block[5];
  BOOL v12;
  os_log_type_t type;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  ContinuityCaptureViewController *v18;
  __int16 v19;
  _BOOL4 v20;
  _BYTE v21[128];

  v3 = a3;
  if (dword_10001A140)
  {
    v14 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v14, &type);
    v6 = v14;
    v7 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v15 = 136315650;
      v16 = "-[ContinuityCaptureViewController callActive:]";
      v17 = 2048;
      v18 = self;
      v19 = 1024;
      v20 = v3;
      LODWORD(v10) = 28;
      v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v21, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> status: %d", (const char *)&v15, v10, LODWORD(block[0]));
      v6 = v14;
    }
    else
    {
      v9 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v9, v9 != v21, v6, 0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000075AC;
  block[3] = &unk_1000146B8;
  v12 = v3;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_showHowToReconnectDialog
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  UIAlertController *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  ContinuityCaptureViewController *v16;
  _BYTE v17[128];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_10001A140)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v12, &type);
    v4 = v12;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v13 = 136315394;
      v14 = "-[ContinuityCaptureViewController _showHowToReconnectDialog]";
      v15 = 2048;
      v16 = self;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Showing dialog", (const char *)&v13, 22);
      v4 = v12;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v17, v4, 0);
  }
  v8 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_TITLE"), &stru_100014A80, 0), -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_MESSAGE"), &stru_100014A80, 0), 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007898;
  v10[3] = &unk_1000146E0;
  v10[4] = self;
  -[UIAlertController addAction:](v8, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_BUTTON_TITLE_DISCONNECT"), &stru_100014A80, 0), 2, v10));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000079F4;
  v9[3] = &unk_1000146E0;
  v9[4] = self;
  -[UIAlertController addAction:](v8, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("ALERT_DISCONNECTED_BUTTON_TITLE_CANCEL"), &stru_100014A80, 0), 1, v9));
  -[ContinuityCaptureViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_updateUI
{
  int64_t uiState;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  int64_t connectionType;
  const __CFString *v11;
  NSString *macName;
  uint64_t v13;
  NSString *v14;
  NSString *v15;
  int64_t v16;
  NSBundle *v17;
  const __CFString *v18;
  const void *v19;
  int v20;
  os_log_type_t type;
  unsigned int v22;
  int v23;
  const char *v24;
  __int16 v25;
  ContinuityCaptureViewController *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uiState = self->_uiState;
  if (dword_10001A140)
  {
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v22, &type);
    v5 = v22;
    v6 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v7 = v5;
    else
      v7 = v5 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      v23 = 136315650;
      v24 = "-[ContinuityCaptureViewController _updateUI]";
      v25 = 2048;
      v26 = self;
      v27 = 1024;
      v28 = uiState;
      LODWORD(v19) = 28;
      v8 = (_BYTE *)_os_log_send_and_compose_impl(v7, 0, v29, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v6, "<<<< ContinuityCaptureViewController >>>> %s: <%p> uiState: %d", (const char *)&v23, v19, v20);
      v5 = v22;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v8, v8 != v29, v5, 0);
  }
  v9 = -[ContinuityCaptureViewController view](self, "view");
  connectionType = self->_connectionType;
  if (connectionType)
  {
    if (connectionType != 1)
      goto LABEL_14;
    v11 = CFSTR("mic.circle.fill");
  }
  else
  {
    v11 = CFSTR("video.circle.fill");
  }
  objc_msgSend(v9, "setImage:", +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v11));
LABEL_14:
  macName = (NSString *)objc_msgSend(objc_msgSend(-[ContinuityCaptureViewController request](self, "request"), "device"), "name");
  if (!-[NSString length](macName, "length"))
    macName = self->_macName;
  if (uiState == 1)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(v9, "setPauseButtonState:", v13);
  if ((unint64_t)(uiState - 1) >= 2)
  {
    if (!uiState)
    {
      if (-[NSString length](macName, "length"))
        v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("LABEL_CONNECTING_TO_CLIENT_WITH_NAME"), &stru_100014A80, 0), macName);
      else
        v15 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("LABEL_CONNECTING_TO_MAC"), &stru_100014A80, 0);
      objc_msgSend(v9, "setPrimaryText:", v15);
    }
  }
  else
  {
    if (-[NSString length](macName, "length"))
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("LABEL_CONNECTED_TO_CLIENT_WITH_NAME"), &stru_100014A80, 0), macName);
    else
      v14 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("LABEL_CONNECTED_TO_MAC"), &stru_100014A80, 0);
    objc_msgSend(v9, "setPrimaryText:", v14);
    v16 = self->_connectionType;
    if (v16 == 1)
    {
      v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v18 = CFSTR("LABEL_DISCONNECT_DESCRIPTION_MICROPHONE");
    }
    else
    {
      if (v16)
        return;
      v17 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v18 = CFSTR("LABEL_DISCONNECT_DESCRIPTION_CAMERA");
    }
    objc_msgSend(v9, "setSecondaryText:", -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", v18, &stru_100014A80, 0));
  }
}

- (void)updateRequestState
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CMContinuityCaptureSidecarServer *requestSever;
  unint64_t sessionID;
  _BYTE *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMContinuityCaptureConfiguration *v14;
  NSMutableArray *activeRequests;
  _BYTE *v16;
  CMContinuityCaptureRemoteCompositeDevice *v17;
  CMContinuityCaptureRemoteCompositeDevice *continuityCaptureDevice;
  CMContinuityCaptureConfiguration *configForPreStreamStart;
  _QWORD v20[5];
  os_log_type_t type;
  unsigned int v22;
  int v23;
  const char *v24;
  __int16 v25;
  ContinuityCaptureViewController *v26;
  __int16 v27;
  CMContinuityCaptureSidecarServer *v28;
  __int16 v29;
  unint64_t v30;
  _BYTE v31[128];

  objc_sync_enter(self);
  if (self->_configForPreStreamStart && -[NSMutableArray count](self->_activeRequests, "count"))
  {
    -[CMContinuityCaptureSidecarServer setCurrentSessionID:](self->_requestSever, "setCurrentSessionID:", self->_sessionID);
    if (dword_10001A140)
    {
      v22 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v22, &type);
      v4 = v22;
      v5 = type;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v6 = v4;
      else
        v6 = v4 & 0xFFFFFFFE;
      if ((_DWORD)v6)
      {
        requestSever = self->_requestSever;
        sessionID = self->_sessionID;
        v23 = 136315906;
        v24 = "-[ContinuityCaptureViewController updateRequestState]";
        v25 = 2048;
        v26 = self;
        v27 = 2114;
        v28 = requestSever;
        v29 = 2048;
        v30 = sessionID;
        v9 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v31, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> create capture device %{public}@ for sessionID %llu", &v23, 42);
        v4 = v22;
      }
      else
      {
        v9 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v9, v9 != v31, v4, 0);
    }
    v17 = (CMContinuityCaptureRemoteCompositeDevice *)objc_msgSend(objc_alloc((Class)CMContinuityCaptureRemoteCompositeDevice), "initWithTransportServer:videoPreviewLayer:", self->_requestSever, -[ContinuityCaptureVideoPreviewView videoPreviewLayer](self->_videoPreviewView, "videoPreviewLayer"));
    self->_continuityCaptureDevice = v17;
    -[CMContinuityCaptureRemoteCompositeDevice addObserver:forKeyPath:options:context:](v17, "addObserver:forKeyPath:options:context:", self, CMContinuityCaptureRemoteCompositeStateKVOKey, 3, 0);
    -[CMContinuityCaptureSidecarServer activate](self->_requestSever, "activate");
    continuityCaptureDevice = self->_continuityCaptureDevice;
    configForPreStreamStart = self->_configForPreStreamStart;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000822C;
    v20[3] = &unk_100014708;
    v20[4] = self;
    -[CMContinuityCaptureRemoteCompositeDevice startStream:option:completion:](continuityCaptureDevice, "startStream:option:completion:", configForPreStreamStart, 0, v20);
  }
  else if (dword_10001A140)
  {
    v22 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v22, &type);
    v11 = v22;
    v12 = type;
    if (os_log_type_enabled(v10, type))
      v13 = v11;
    else
      v13 = v11 & 0xFFFFFFFE;
    if ((_DWORD)v13)
    {
      v14 = self->_configForPreStreamStart;
      activeRequests = self->_activeRequests;
      v23 = 136315906;
      v24 = "-[ContinuityCaptureViewController updateRequestState]";
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = v14;
      v29 = 2112;
      v30 = (unint64_t)activeRequests;
      v16 = (_BYTE *)_os_log_send_and_compose_impl(v13, 0, v31, 128, &_mh_execute_header, v10, v12, "<<<< ContinuityCaptureViewController >>>> %s: <%p> dropped request update %@ %@", &v23, 42);
      v11 = v22;
    }
    else
    {
      v16 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v16, v16 != v31, v11, 0);
  }
  objc_sync_exit(self);
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  const void *v10;
  int v11;
  objc_super v12;
  objc_super v13;
  os_log_type_t type;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  ContinuityCaptureViewController *v19;
  __int16 v20;
  _BOOL4 v21;
  _BYTE v22[128];

  v3 = a3;
  if (dword_10001A140)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v15, &type);
    v6 = v15;
    v7 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v16 = 136315650;
      v17 = "-[ContinuityCaptureViewController setActive:]";
      v18 = 2048;
      v19 = self;
      v20 = 1024;
      v21 = v3;
      LODWORD(v10) = 28;
      v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v22, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> active: %d", (const char *)&v16, v10, v11);
      v6 = v15;
    }
    else
    {
      v9 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v9, v9 != v22, v6, 0);
  }
  v13.receiver = self;
  v13.super_class = (Class)ContinuityCaptureViewController;
  if (-[ContinuityCaptureViewController respondsToSelector:](&v13, "respondsToSelector:", "setActive:"))
  {
    v12.receiver = self;
    v12.super_class = (Class)ContinuityCaptureViewController;
    -[ContinuityCaptureViewController setActive:](&v12, "setActive:", v3);
  }
  if (v3)
    -[ContinuityCaptureViewController setBackgroundStyle:](self, "setBackgroundStyle:", 4);
  self->_inactive = !v3;
  -[ContinuityCaptureViewController _resolveUserPauseState](self, "_resolveUserPauseState");
}

- (void)setBackgrounded:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  const void *v10;
  int v11;
  objc_super v12;
  os_log_type_t type;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  ContinuityCaptureViewController *v18;
  __int16 v19;
  _BOOL4 v20;
  _BYTE v21[128];

  v3 = a3;
  if (dword_10001A140)
  {
    v14 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v14, &type);
    v6 = v14;
    v7 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v15 = 136315650;
      v16 = "-[ContinuityCaptureViewController setBackgrounded:]";
      v17 = 2048;
      v18 = self;
      v19 = 1024;
      v20 = v3;
      LODWORD(v10) = 28;
      v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v21, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> backgrounded: %d", (const char *)&v15, v10, v11);
      v6 = v14;
    }
    else
    {
      v9 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v9, v9 != v21, v6, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)ContinuityCaptureViewController;
  -[ContinuityCaptureViewController setBackgrounded:](&v12, "setBackgrounded:", v3);
}

- (void)requestDidStart:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  NSMutableArray *activeRequests;
  _QWORD block[6];
  os_log_type_t type;
  unsigned int v13;
  int v14;
  const char *v15;
  __int16 v16;
  ContinuityCaptureViewController *v17;
  __int16 v18;
  id v19;
  _BYTE v20[128];

  if (dword_10001A140)
  {
    v13 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v13, &type);
    v6 = v13;
    v7 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v14 = 136315650;
      v15 = "-[ContinuityCaptureViewController requestDidStart:]";
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = a3;
      v9 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v20, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Request: %@", &v14, 32);
      v6 = v13;
    }
    else
    {
      v9 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v9, v9 != v20, v6, 0);
  }
  objc_sync_enter(self);
  activeRequests = self->_activeRequests;
  if (!activeRequests)
  {
    activeRequests = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_activeRequests = activeRequests;
  }
  if (-[NSMutableArray count](activeRequests, "count"))
    -[NSMutableArray removeObjectAtIndex:](self->_activeRequests, "removeObjectAtIndex:", 0);
  -[NSMutableArray addObject:](self->_activeRequests, "addObject:", a3);
  objc_sync_exit(self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000892C;
  block[3] = &unk_100014640;
  block[4] = self;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)requestDidFinish:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE *v10;
  BOOL v11;
  _QWORD block[5];
  BOOL v13;
  os_log_type_t type;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  ContinuityCaptureViewController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];

  if (dword_10001A140)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v15, &type);
    v6 = v15;
    v7 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v8 = v6;
    else
      v8 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v9 = objc_msgSend(a3, "error");
      v16 = 136315906;
      v17 = "-[ContinuityCaptureViewController requestDidFinish:]";
      v18 = 2048;
      v19 = self;
      v20 = 2112;
      v21 = a3;
      v22 = 2112;
      v23 = v9;
      v10 = (_BYTE *)_os_log_send_and_compose_impl(v8, 0, v24, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v7, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Request: %@ error %@", &v16, 42);
      v6 = v15;
    }
    else
    {
      v10 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v10, v10 != v24, v6, 0);
  }
  objc_sync_enter(self);
  if (-[NSMutableArray count](self->_activeRequests, "count"))
  {
    objc_sync_exit(self);
    v11 = (objc_msgSend(a3, "isCancelled") & 1) == 0
       && (objc_msgSend(objc_msgSend(objc_msgSend(a3, "error"), "domain"), "isEqualToString:", CFSTR("SidecarErrorDomain"))&& (objc_msgSend(objc_msgSend(a3, "error"), "code") == (id)-205|| objc_msgSend(objc_msgSend(a3, "error"), "code") == (id)-204)|| objc_msgSend(objc_msgSend(objc_msgSend(a3, "error"), "domain"), "isEqualToString:", CFSTR("RPErrorDomain"))&& objc_msgSend(objc_msgSend(a3, "error"), "code") == (id)-6753);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008C84;
    block[3] = &unk_1000146B8;
    block[4] = self;
    v13 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("%@ ContinuityCapture error : Invalid active requests"), self);
    objc_sync_exit(self);
  }
}

- (void)receivedItems:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  _BYTE *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString *macName;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  CMContinuityCaptureConfiguration *v27;
  CMContinuityCaptureConfiguration *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CMContinuityCaptureConfiguration *configForPreStreamStart;
  _BYTE *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _BYTE *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  _QWORD block[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  os_log_type_t type;
  unsigned int v65;
  void *v66;
  int v67;
  const char *v68;
  __int16 v69;
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];

  v66 = 0;
  if (dword_10001A140)
  {
    v65 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v65, &type);
    v4 = v65;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v7 = objc_msgSend(a3, "count");
      v67 = 136315394;
      v68 = "-[ContinuityCaptureViewController receivedItems:]";
      v69 = 1024;
      LODWORD(v70) = v7;
      v8 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v72, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: Received %d items", (const char *)&v67, 18);
      v4 = v65;
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v8, v8 != v72, v4, 0);
  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v61;
    v58 = kCMContinuityCaptureSidecarItemTypeMacName;
    v55 = kCMContinuityCaptureSidecarItemTypeSessionGID;
    v56 = kCMContinuityCaptureSidecarItemTypeStreamConfiguration;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "objectValue");
        if (objc_msgSend(objc_msgSend(v12, "type"), "isEqualToString:", v58)
          && (v15 = objc_opt_class(NSString, v14), (objc_opt_isKindOfClass(v13, v15) & 1) != 0))
        {

          self->_macName = (NSString *)v13;
          if (dword_10001A140)
          {
            v65 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v65, &type);
            v17 = v65;
            v18 = type;
            if (os_log_type_enabled(v16, type))
              v19 = v17;
            else
              v19 = v17 & 0xFFFFFFFE;
            if ((_DWORD)v19)
            {
              macName = self->_macName;
              v67 = 136315394;
              v68 = "-[ContinuityCaptureViewController receivedItems:]";
              v69 = 2112;
              v70 = macName;
              LODWORD(v53) = 22;
              v21 = (_BYTE *)_os_log_send_and_compose_impl(v19, 0, v72, 128, &_mh_execute_header, v16, v18, "<<<< ContinuityCaptureViewController >>>> %s: Received Mac Name: %@", &v67, v53);
              v17 = v65;
            }
            else
            {
              v21 = 0;
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v21, v21 != v72, v17, 0);
          }
        }
        else if (objc_msgSend(objc_msgSend(v12, "type"), "isEqualToString:", v56)
               && (v23 = objc_opt_class(NSData, v22), (objc_opt_isKindOfClass(v13, v23) & 1) != 0))
        {
          v25 = (void *)objc_opt_class(ContinuityCaptureViewController, v24);
          objc_sync_enter(v25);

          v27 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CMContinuityCaptureConfiguration, v26), v13, &v66);
          self->_configForPreStreamStart = v27;
          if (v27)
          {
            v28 = v27;
            if (dword_10001A140)
            {
              v65 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v65, &type);
              v30 = v65;
              v31 = type;
              if (os_log_type_enabled(v29, type))
                v32 = v30;
              else
                v32 = v30 & 0xFFFFFFFE;
              if ((_DWORD)v32)
              {
                configForPreStreamStart = self->_configForPreStreamStart;
                v67 = 136315394;
                v68 = "-[ContinuityCaptureViewController receivedItems:]";
                v69 = 2112;
                v70 = configForPreStreamStart;
                LODWORD(v53) = 22;
                v34 = (_BYTE *)_os_log_send_and_compose_impl(v32, 0, v72, 128, &_mh_execute_header, v29, v31, "<<<< ContinuityCaptureViewController >>>> %s: Received _configForPreStreamStart %@ ", &v67, v53);
                v30 = v65;
              }
              else
              {
                v34 = 0;
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v34, v34 != v72, v30, 0);
            }
          }
          else
          {
            v65 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v65, &type);
            v48 = v65;
            v49 = type;
            if (os_log_type_enabled(v47, type))
              v50 = v48;
            else
              v50 = v48 & 0xFFFFFFFE;
            if ((_DWORD)v50)
            {
              v67 = 136315394;
              v68 = "-[ContinuityCaptureViewController receivedItems:]";
              v69 = 2112;
              v70 = v66;
              LODWORD(v53) = 22;
              v51 = (_BYTE *)_os_log_send_and_compose_impl(v50, 0, v72, 128, &_mh_execute_header, v47, v49, "<<<< ContinuityCaptureViewController >>>> %s: unarchivedObjectOfClass _configForPreStreamStart error: %@", &v67, v53);
              v48 = v65;
            }
            else
            {
              v51 = 0;
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v51, v51 != v72, v48, 0);
          }
          objc_sync_exit(v25);
        }
        else if (objc_msgSend(objc_msgSend(v12, "type"), "isEqualToString:", v55))
        {
          if (dword_10001A140)
          {
            v65 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v65, &type);
            v37 = v65;
            v38 = type;
            if (os_log_type_enabled(v36, type))
              v39 = v37;
            else
              v39 = v37 & 0xFFFFFFFE;
            if ((_DWORD)v39)
            {
              v67 = 136315394;
              v68 = "-[ContinuityCaptureViewController receivedItems:]";
              v69 = 2112;
              v70 = v13;
              LODWORD(v53) = 22;
              v40 = (_BYTE *)_os_log_send_and_compose_impl(v39, 0, v72, 128, &_mh_execute_header, v36, v38, "<<<< ContinuityCaptureViewController >>>> %s: Received SessionID: %@", &v67, v53);
              v37 = v65;
            }
            else
            {
              v40 = 0;
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v40, v40 != v72, v37, 0);
          }
          v52 = objc_opt_class(NSNumber, v35);
          if ((objc_opt_isKindOfClass(v13, v52) & 1) != 0)
            self->_sessionID = (unint64_t)objc_msgSend(v13, "unsignedLongLongValue");
        }
        else
        {
          v65 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 0, &v65, &type);
          v42 = v65;
          v43 = type;
          if (os_log_type_enabled(v41, type))
            v44 = v42;
          else
            v44 = v42 & 0xFFFFFFFE;
          if ((_DWORD)v44)
          {
            v45 = objc_msgSend(v12, "type");
            v67 = 136315394;
            v68 = "-[ContinuityCaptureViewController receivedItems:]";
            v69 = 2112;
            v70 = v45;
            LODWORD(v53) = 22;
            v46 = (_BYTE *)_os_log_send_and_compose_impl(v44, 0, v72, 128, &_mh_execute_header, v41, v43, "<<<< ContinuityCaptureViewController >>>> %s: Unexpected type: %@", &v67, v53);
            v42 = v65;
          }
          else
          {
            v46 = 0;
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 0, 1, v46, v46 != v72, v42, 0);
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    }
    while (v9);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009578;
  block[3] = &unk_100014730;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sidecarServiceActive
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  os_log_type_t type;
  unsigned int v9;
  int v10;
  const char *v11;
  __int16 v12;
  ContinuityCaptureViewController *v13;
  _BYTE v14[128];

  if (dword_10001A140)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v9, &type);
    v4 = v9;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v10 = 136315394;
      v11 = "-[ContinuityCaptureViewController sidecarServiceActive]";
      v12 = 2048;
      v13 = self;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v14, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Called", (const char *)&v10, 22);
      v4 = v9;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v14, v4, 0);
  }
  -[ContinuityCaptureViewController setBackgroundStyle:](self, "setBackgroundStyle:", 4);
}

- (void)_setConnectionInterruptTimer
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  OS_dispatch_source *v8;
  NSObject *connectionInterruptTimer;
  _QWORD handler[6];
  os_log_type_t type;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  ContinuityCaptureViewController *v16;
  _QWORD v17[3];
  char v18;

  if (!self->_connectionInterruptTimer)
  {
    if (dword_10001A140)
    {
      v12 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v12, &type);
      v4 = v12;
      v5 = type;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v6 = v4;
      else
        v6 = v4 & 0xFFFFFFFE;
      if ((_DWORD)v6)
      {
        v13 = 136315394;
        v14 = "-[ContinuityCaptureViewController _setConnectionInterruptTimer]";
        v15 = 2048;
        v16 = self;
        v7 = (_QWORD *)_os_log_send_and_compose_impl(v6, 0, v17, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p>", (const char *)&v13, 22);
        v4 = v12;
      }
      else
      {
        v7 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v17, v4, 0);
    }
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v18 = 5;
    v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, 0);
    self->_connectionInterruptTimer = v8;
    dispatch_source_set_timer((dispatch_source_t)v8, 0, 0x77359400uLL, 0);
    connectionInterruptTimer = self->_connectionInterruptTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000098D4;
    handler[3] = &unk_100014758;
    handler[4] = self;
    handler[5] = v17;
    dispatch_source_set_event_handler(connectionInterruptTimer, handler);
    dispatch_resume((dispatch_object_t)self->_connectionInterruptTimer);
    _Block_object_dispose(v17, 8);
  }
}

- (void)_terminate
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  NSObject *connectionInterruptTimer;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  const void *v19;
  os_log_type_t type;
  unsigned int v21;
  int v22;
  const char *v23;
  __int16 v24;
  ContinuityCaptureViewController *v25;
  _BYTE v26[128];

  if (self->_pendingDisconnectDialogue)
  {
    if (dword_10001A140)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v21, &type);
      v4 = v21;
      v5 = type;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v6 = v4;
      else
        v6 = v4 & 0xFFFFFFFE;
      if ((_DWORD)v6)
      {
        v22 = 136315394;
        v23 = "-[ContinuityCaptureViewController _terminate]";
        v24 = 2048;
        v25 = self;
        v7 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v26, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> skip termination since we have pending disconnect dialogue", (const char *)&v22, 22);
        v4 = v21;
      }
      else
      {
        v7 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v26, v4, 0);
    }
  }
  else
  {
    self->_isTerminating = 1;
    if (dword_10001A140)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v21, &type);
      v9 = v21;
      v10 = type;
      if (os_log_type_enabled(v8, type))
        v11 = v9;
      else
        v11 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v11)
      {
        v22 = 136315394;
        v23 = "-[ContinuityCaptureViewController _terminate]";
        v24 = 2048;
        v25 = self;
        v12 = (_BYTE *)_os_log_send_and_compose_impl(v11, 0, v26, 128, &_mh_execute_header, v8, v10, "<<<< ContinuityCaptureViewController >>>> %s: <%p>", (const char *)&v22, 22);
        v9 = v21;
      }
      else
      {
        v12 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v12, v12 != v26, v9, 0);
    }
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    FigCaptureSessionRemoteSetWombatEnabled(0);
    FigCaptureSessionRemoteSetWombatInUse(0);
    -[CMContinuityCaptureSidecarServer cancel](self->_requestSever, "cancel");
    connectionInterruptTimer = self->_connectionInterruptTimer;
    if (connectionInterruptTimer)
    {
      dispatch_source_cancel(connectionInterruptTimer);

      self->_connectionInterruptTimer = 0;
    }
    -[ContinuityCaptureRemoteUISystemStatus releaseCurrentIdleSleepAssertion](+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"), "releaseCurrentIdleSleepAssertion");
    -[ContinuityCaptureShieldUIBackgroundActivityManager updateState:](+[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance](ContinuityCaptureShieldUIBackgroundActivityManager, "sharedInstance"), "updateState:", 16);
    if (dword_10001A140)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v21, &type);
      v15 = v21;
      v16 = type;
      if (os_log_type_enabled(v14, type))
        v17 = v15;
      else
        v17 = v15 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v22 = 136315394;
        v23 = "-[ContinuityCaptureViewController _terminate]";
        v24 = 2048;
        v25 = self;
        LODWORD(v19) = 22;
        v18 = (_BYTE *)_os_log_send_and_compose_impl(v17, 0, v26, 128, &_mh_execute_header, v14, v16, "<<<< ContinuityCaptureViewController >>>> %s: <%p complete request", (const char *)&v22, v19);
        v15 = v21;
      }
      else
      {
        v18 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v18, v18 != v26, v15, 0);
    }
    -[ContinuityCaptureViewController completeRequest:](self, "completeRequest:", 1);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  ContinuityCaptureViewController *v11;
  _QWORD block[9];

  v11 = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009F10;
  block[3] = &unk_100014780;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  FBSDisplayLayoutMonitor *layoutMonitor;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  _BYTE *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 pendingStreamStartAfterResumeEvent;
  uint64_t v46;
  _BYTE *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  const void *v51;
  objc_super v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  os_log_type_t type;
  unsigned int v59;
  _BYTE v60[128];
  int v61;
  const char *v62;
  __int16 v63;
  ContinuityCaptureViewController *v64;
  __int16 v65;
  id v66;
  _BYTE v67[128];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_10001A140)
  {
    v59 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v59, &type);
    v12 = v59;
    v13 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v14 = v12;
    else
      v14 = v12 & 0xFFFFFFFE;
    if ((_DWORD)v14)
    {
      v61 = 136315650;
      v62 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
      v63 = 2048;
      v64 = self;
      v65 = 2112;
      v66 = a3;
      v15 = (_BYTE *)_os_log_send_and_compose_impl(v14, 0, v67, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v13, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Observe key %@", &v61, 32);
      v12 = v59;
    }
    else
    {
      v15 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v15, v15 != v67, v12, 0);
  }
  if (objc_msgSend(a3, "isEqualToString:", CMContinuityCaptureRemoteCompositeStateKVOKey))
  {
    v16 = objc_msgSend(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey), "integerValue");
    if (dword_10001A140)
    {
      v59 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v59, &type);
      v18 = v59;
      v19 = type;
      if (os_log_type_enabled(v17, type))
        v20 = v18;
      else
        v20 = v18 & 0xFFFFFFFE;
      if ((_DWORD)v20)
      {
        v61 = 136315650;
        v62 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
        v63 = 2048;
        v64 = self;
        v65 = 1024;
        LODWORD(v66) = (_DWORD)v16;
        LODWORD(v51) = 28;
        v21 = (_BYTE *)_os_log_send_and_compose_impl(v20, 0, v67, 128, &_mh_execute_header, v17, v19, "<<<< ContinuityCaptureViewController >>>> %s: <%p> State : %d", (const char *)&v61, v51, LODWORD(v52.receiver));
        v18 = v59;
      }
      else
      {
        v21 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v21, v21 != v67, v18, 0);
    }
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10000A7E0;
    v57[3] = &unk_100014730;
    v57[4] = self;
    -[ContinuityCaptureShieldUIBackgroundActivityManager updateState:withUserInteractionHandler:](+[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance](ContinuityCaptureShieldUIBackgroundActivityManager, "sharedInstance"), "updateState:withUserInteractionHandler:", v16, v57);
    if ((v16 & 1) != 0)
    {
      self->_uiState = 2;
      FigCaptureSessionRemoteSetWombatInUse(0);
      FigCaptureSessionRemoteSetWombatEnabled(0);
    }
    else
    {
      if ((v16 & 8) == 0)
      {
        if ((v16 & 0x10) != 0)
        {
          -[ContinuityCaptureViewController _terminate](self, "_terminate");
        }
        else
        {
          self->_uiState = 1;
          -[ContinuityCaptureViewController _updateUI](self, "_updateUI");
          FigCaptureSessionRemoteSetWombatInUse(1);
          FigCaptureSessionRemoteSetWombatEnabled(1);
        }
LABEL_37:
        v28 = v16 & 6;
        if (v28 == 2)
        {
          self->_connectionType = 1;
          -[ContinuityCaptureViewController _updateUI](self, "_updateUI");
        }
        else
        {
          self->_connectionType = 0;
          -[ContinuityCaptureViewController _updateUI](self, "_updateUI");
          if (!v28)
            return;
        }
        layoutMonitor = self->_layoutMonitor;
        if (!layoutMonitor || !-[FBSDisplayLayoutMonitor currentLayout](layoutMonitor, "currentLayout"))
          goto LABEL_80;
        if (dword_10001A140)
        {
          v59 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v59, &type);
          v31 = v59;
          v32 = type;
          if (os_log_type_enabled(v30, type))
            v33 = v31;
          else
            v33 = v31 & 0xFFFFFFFE;
          if ((_DWORD)v33)
          {
            v34 = -[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
            v61 = 136315650;
            v62 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
            v63 = 2048;
            v64 = self;
            v65 = 2114;
            v66 = v34;
            LODWORD(v51) = 32;
            v35 = (_BYTE *)_os_log_send_and_compose_impl(v33, 0, v67, 128, &_mh_execute_header, v30, v32, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Evaluate current layout %{public}@", &v61, v51);
            v31 = v59;
          }
          else
          {
            v35 = 0;
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v35, v35 != v67, v31, 0);
        }
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v36 = objc_msgSend(-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout"), "elements");
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v54;
LABEL_53:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v54 != v39)
              objc_enumerationMutation(v36);
            if ((objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v40), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.sidecar")) & 1) != 0)break;
            if (v38 == (id)++v40)
            {
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
              if (v38)
                goto LABEL_53;
              goto LABEL_59;
            }
          }
        }
        else
        {
LABEL_59:
          if (!self->_pendingStreamStartAfterResumeEvent && !self->_firstSidecarLayoutReceived)
          {
            if (dword_10001A140)
            {
              v59 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v59, &type);
              v42 = v59;
              v49 = type;
              if (os_log_type_enabled(v48, type))
                v50 = v42;
              else
                v50 = v42 & 0xFFFFFFFE;
              if ((_DWORD)v50)
              {
                v61 = 136315394;
                v62 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
                v63 = 2048;
                v64 = self;
                LODWORD(v51) = 22;
                v46 = _os_log_send_and_compose_impl(v50, 0, v67, 128, &_mh_execute_header, v48, v49, "<<<< ContinuityCaptureViewController >>>> %s: <%p> enforce pause since sidecar is missing in current layout", &v61, v51);
                goto LABEL_67;
              }
LABEL_78:
              v47 = 0;
              goto LABEL_79;
            }
LABEL_80:
            self->_pendingStreamStartAfterResumeEvent = 0;
            return;
          }
        }
        if (dword_10001A140)
        {
          v59 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v59, &type);
          v42 = v59;
          v43 = type;
          if (os_log_type_enabled(v41, type))
            v44 = v42;
          else
            v44 = v42 & 0xFFFFFFFE;
          if ((_DWORD)v44)
          {
            pendingStreamStartAfterResumeEvent = self->_pendingStreamStartAfterResumeEvent;
            v61 = 136315650;
            v62 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
            v63 = 2048;
            v64 = self;
            v65 = 1024;
            LODWORD(v66) = pendingStreamStartAfterResumeEvent;
            LODWORD(v51) = 28;
            v46 = _os_log_send_and_compose_impl(v44, 0, v67, 128, &_mh_execute_header, v41, v43, "<<<< ContinuityCaptureViewController >>>> %s: <%p> stream session started with sidecar app in current layout or _pendingStreamStartAfterResumeEvent %d", &v61, v51);
LABEL_67:
            v47 = (_BYTE *)v46;
            v42 = v59;
LABEL_79:
            fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v47, v47 != v67, v42, 0);
            goto LABEL_80;
          }
          goto LABEL_78;
        }
        goto LABEL_80;
      }
      self->_uiState = 0;
    }
    -[ContinuityCaptureViewController _updateUI](self, "_updateUI");
    goto LABEL_37;
  }
  if (objc_msgSend(a3, "isEqualToString:", CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey))
  {
    if (!objc_msgSend(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey), "BOOLValue"))
      return;
    if (dword_10001A140)
    {
      v59 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v59, &type);
      v23 = v59;
      v24 = type;
      if (os_log_type_enabled(v22, type))
        v25 = v23;
      else
        v25 = v23 & 0xFFFFFFFE;
      if ((_DWORD)v25)
      {
        v61 = 136315394;
        v62 = "-[ContinuityCaptureViewController _observeValueForKeyPath:ofObject:change:context:]";
        v63 = 2048;
        v64 = self;
        LODWORD(v51) = 22;
        v26 = (_BYTE *)_os_log_send_and_compose_impl(v25, 0, v67, 128, &_mh_execute_header, v22, v24, "<<<< ContinuityCaptureViewController >>>> %s: <%p> power button pressed", (const char *)&v61, v51);
        v23 = v59;
      }
      else
      {
        v26 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v26, v26 != v67, v23, 0);
    }
    v27 = 56;
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CMContinuityCaptureCallStateKVOKey))
    {
      v52.receiver = self;
      v52.super_class = (Class)ContinuityCaptureViewController;
      -[ContinuityCaptureViewController observeValueForKeyPath:ofObject:change:context:](&v52, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6);
      return;
    }
    if (objc_msgSend(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey), "integerValue") != (id)2)
      return;
    v27 = 154;
  }
  self->SidecarServiceViewController_opaque[v27] = 1;
  -[ContinuityCaptureViewController _resolveUserPauseState](self, "_resolveUserPauseState");
}

- (void)_handleLayout:(id)a3 ignoringStandby:(BOOL)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  int64_t sidecarLayoutValue;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _BYTE *v24;
  BOOL v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _BYTE *v31;
  dispatch_time_t v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  int64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int64_t v64;
  _BYTE *v65;
  const void *v66;
  int v67;
  int64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BOOL4 v75;
  id obj;
  ContinuityCaptureViewController *v77;
  _QWORD block[6];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  os_log_type_t type;
  unsigned int v84;
  _BYTE v85[128];
  uint64_t v86;
  int v87;
  const char *v88;
  __int16 v89;
  ContinuityCaptureViewController *v90;
  __int16 v91;
  id v92;
  _BYTE v93[128];

  v75 = a4;
  if (dword_10001A140)
  {
    v84 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
    v7 = v84;
    v8 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v9 = v7;
    else
      v9 = v7 & 0xFFFFFFFE;
    if ((_DWORD)v9)
    {
      v87 = 136315650;
      v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
      v89 = 2048;
      v90 = self;
      v91 = 2112;
      v92 = a3;
      v10 = (_BYTE *)_os_log_send_and_compose_impl(v9, 0, v93, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v8, "<<<< ContinuityCaptureViewController >>>> %s: <%p> New layout: %@", &v87, 32);
      v7 = v84;
    }
    else
    {
      v10 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v10, v10 != v93, v7, 0);
  }
  sidecarLayoutValue = self->_sidecarLayoutValue;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!a3)
  {
    if (!dword_10001A140)
      return;
    v84 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
    v36 = v84;
    v37 = type;
    if (os_log_type_enabled(v35, type))
      v38 = v36;
    else
      v38 = v36 & 0xFFFFFFFE;
    if (!(_DWORD)v38)
      goto LABEL_94;
    v87 = 136315394;
    v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
    v89 = 2048;
    v90 = self;
    LODWORD(v66) = 22;
    v39 = _os_log_send_and_compose_impl(v38, 0, v93, 128, &_mh_execute_header, v35, v37, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring nil layout", &v87, v66);
LABEL_93:
    v58 = (_BYTE *)v39;
    v36 = v84;
LABEL_95:
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v58, v58 != v93, v36, 0);
    return;
  }
  if (!objc_msgSend(a3, "displayBacklightLevel"))
  {
    if (!dword_10001A140)
      return;
    v84 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
    v36 = v84;
    v41 = type;
    if (os_log_type_enabled(v40, type))
      v42 = v36;
    else
      v42 = v36 & 0xFFFFFFFE;
    if (!(_DWORD)v42)
      goto LABEL_94;
    v87 = 136315394;
    v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
    v89 = 2048;
    v90 = self;
    LODWORD(v66) = 22;
    v39 = _os_log_send_and_compose_impl(v42, 0, v93, 128, &_mh_execute_header, v40, v41, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring layout with minimum (0) backlight level.", &v87, v66);
    goto LABEL_93;
  }
  v86 = FBSDisplayLayoutElementSiriIdentifier;
  v12 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = objc_msgSend(a3, "elements");
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v13)
  {
    v14 = v13;
    v68 = sidecarLayoutValue;
    v69 = a3;
    v77 = self;
    v71 = 0;
    v74 = -1;
    v15 = *(_QWORD *)v80;
    v16 = SBSDisplayLayoutElementStandByIdentifier;
    v72 = FBSDisplayLayoutElementLockScreenIdentifier;
    v70 = SBSDisplayLayoutElementHomeScreenIdentifier;
    v73 = -1;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v80 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);
        if (-[NSArray containsObject:](v12, "containsObject:", objc_msgSend(v18, "identifier")))
        {
          if (dword_10001A140)
          {
            v84 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
            v20 = v84;
            v21 = type;
            if (os_log_type_enabled(v19, type))
              v22 = v20;
            else
              v22 = v20 & 0xFFFFFFFE;
            if ((_DWORD)v22)
            {
              v23 = objc_msgSend(v18, "identifier");
              v87 = 136315650;
              v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
              v89 = 2048;
              v90 = v77;
              v91 = 2112;
              v92 = v23;
              LODWORD(v66) = 32;
              v24 = (_BYTE *)_os_log_send_and_compose_impl(v22, 0, v93, 128, &_mh_execute_header, v19, v21, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring %@ in layout", &v87, v66);
              v20 = v84;
            }
            else
            {
              v24 = 0;
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v24, v24 != v93, v20, 0);
          }
        }
        else
        {
          if (objc_msgSend(objc_msgSend(v18, "identifier"), "isEqualToString:", v16))
            v25 = !v75;
          else
            v25 = 1;
          if (v25)
          {
            if ((uint64_t)objc_msgSend(v18, "level") > v74)
              v74 = (uint64_t)objc_msgSend(v18, "level");
            if (objc_msgSend(objc_msgSend(v18, "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.sidecar")))
            {
              v73 = (uint64_t)objc_msgSend(v18, "level");
            }
            else if ((objc_msgSend(objc_msgSend(v18, "identifier"), "isEqualToString:", v72) & 1) != 0)
            {
              HIDWORD(v71) = 1;
            }
            else if (objc_msgSend(objc_msgSend(v18, "identifier"), "isEqualToString:", v70))
            {
              LOBYTE(v71) = (objc_msgSend(objc_msgSend(v69, "elements"), "count") == (id)1) | v71;
            }
          }
          else
          {
            if (dword_10001A140)
            {
              v84 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
              v27 = v84;
              v28 = type;
              if (os_log_type_enabled(v26, type))
                v29 = v27;
              else
                v29 = v27 & 0xFFFFFFFE;
              if ((_DWORD)v29)
              {
                v30 = objc_msgSend(v18, "identifier");
                v87 = 136315650;
                v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
                v89 = 2048;
                v90 = v77;
                v91 = 2112;
                v92 = v30;
                LODWORD(v66) = 32;
                v31 = (_BYTE *)_os_log_send_and_compose_impl(v29, 0, v93, 128, &_mh_execute_header, v26, v28, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring %@ in layout in case of transition - will retry in 2s without ignoring", &v87, v66);
                v27 = v84;
              }
              else
              {
                v31 = 0;
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v31, v31 != v93, v27, 0);
            }
            v32 = dispatch_time(0, 2000000000);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000B678;
            block[3] = &unk_100014640;
            block[4] = v77;
            block[5] = v18;
            dispatch_after(v32, (dispatch_queue_t)&_dispatch_main_q, block);
          }
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v14);
    v33 = 1;
    v34 = v73;
    self = v77;
    if (v73 != -1)
    {
      v77->_firstSidecarLayoutReceived = 1;
      v33 = 0;
    }
    sidecarLayoutValue = v68;
    v43 = HIDWORD(v71);
  }
  else
  {
    v43 = 0;
    LOBYTE(v71) = 0;
    v34 = -1;
    v33 = 1;
    v74 = -1;
  }
  if (!self->_firstSidecarLayoutReceived)
  {
    if (!dword_10001A140)
      return;
    v84 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
    v36 = v84;
    v48 = type;
    if (os_log_type_enabled(v47, type))
      v49 = v36;
    else
      v49 = v36 & 0xFFFFFFFE;
    if ((_DWORD)v49)
    {
      v87 = 136315394;
      v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
      v89 = 2048;
      v90 = self;
      LODWORD(v66) = 22;
      v39 = _os_log_send_and_compose_impl(v49, 0, v93, 128, &_mh_execute_header, v47, v48, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring layout. Haven't received first layout with Sidecar in it.", &v87, v66);
      goto LABEL_93;
    }
    goto LABEL_94;
  }
  if ((v33 & v43) == 1)
  {
    if (!dword_10001A140)
      return;
    v84 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
    v36 = v84;
    v45 = type;
    if (os_log_type_enabled(v44, type))
      v46 = v36;
    else
      v46 = v36 & 0xFFFFFFFE;
    if ((_DWORD)v46)
    {
      v87 = 136315394;
      v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
      v89 = 2048;
      v90 = self;
      LODWORD(v66) = 22;
      v39 = _os_log_send_and_compose_impl(v46, 0, v93, 128, &_mh_execute_header, v44, v45, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring layout. On Lock Screen without Sidecar.", &v87, v66);
      goto LABEL_93;
    }
LABEL_94:
    v58 = 0;
    goto LABEL_95;
  }
  if (self->_ignoreLayoutUpdatesAfterDeviceUnlock)
  {
    if ((v71 & 1) == 0)
    {
      if (!dword_10001A140)
        return;
      v84 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
      v36 = v84;
      v56 = type;
      if (os_log_type_enabled(v55, type))
        v57 = v36;
      else
        v57 = v36 & 0xFFFFFFFE;
      if ((_DWORD)v57)
      {
        v87 = 136315394;
        v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
        v89 = 2048;
        v90 = self;
        LODWORD(v66) = 22;
        v39 = _os_log_send_and_compose_impl(v57, 0, v93, 128, &_mh_execute_header, v55, v56, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Ignoring layout. Interstitial updates after device unlock.", &v87, v66);
        goto LABEL_93;
      }
      goto LABEL_94;
    }
    self->_ignoreLayoutUpdatesAfterDeviceUnlock = 0;
    if (dword_10001A140)
    {
      v84 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
      v51 = v84;
      v52 = type;
      if (os_log_type_enabled(v50, type))
        v53 = v51;
      else
        v53 = v51 & 0xFFFFFFFE;
      if ((_DWORD)v53)
      {
        v87 = 136315394;
        v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
        v89 = 2048;
        v90 = self;
        LODWORD(v66) = 22;
        v54 = (_BYTE *)_os_log_send_and_compose_impl(v53, 0, v93, 128, &_mh_execute_header, v50, v52, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Layout updates after device unlock complete. Resume layout handling.", (const char *)&v87, v66);
        v51 = v84;
      }
      else
      {
        v54 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v54, v54 != v93, v51, 0);
    }
  }
  v59 = v34 >= v74;
  self->_sidecarLayoutValue = v59;
  if (dword_10001A140)
  {
    v84 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v60 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v84, &type);
    v61 = v84;
    v62 = type;
    if (os_log_type_enabled(v60, type))
      v63 = v61;
    else
      v63 = v61 & 0xFFFFFFFE;
    if ((_DWORD)v63)
    {
      v64 = self->_sidecarLayoutValue;
      v87 = 136315650;
      v88 = "-[ContinuityCaptureViewController _handleLayout:ignoringStandby:]";
      v89 = 2048;
      v90 = self;
      v91 = 1024;
      LODWORD(v92) = v64;
      LODWORD(v66) = 28;
      v65 = (_BYTE *)_os_log_send_and_compose_impl(v63, 0, v93, 128, &_mh_execute_header, v60, v62, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Sidecar layout value: %d", (const char *)&v87, v66, v67);
      v61 = v84;
    }
    else
    {
      v65 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v65, v65 != v93, v61, 0);
    v59 = self->_sidecarLayoutValue;
  }
  if (sidecarLayoutValue != v59)
    -[ContinuityCaptureViewController _resolveUserPauseState](self, "_resolveUserPauseState");
}

- (void)_resolveUserPauseState
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 inactive;
  int64_t sidecarLayoutValue;
  _BOOL4 firstSidecarLayoutReceived;
  _BOOL4 sideButtonPressed;
  _BOOL4 userDisconnect;
  _BOOL4 pauseButtonPressed;
  _BOOL4 incomingCallDeclined;
  _BOOL4 incomingCall;
  _BYTE *v15;
  CMContinuityCaptureRemoteCompositeDevice *continuityCaptureDevice;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _QWORD *v22;
  const void *v23;
  os_log_type_t type;
  unsigned int v25;
  int v26;
  const char *v27;
  __int16 v28;
  ContinuityCaptureViewController *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  _BOOL4 v45;
  _BYTE v46[128];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (dword_10001A140)
  {
    v25 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v25, &type);
    v4 = v25;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      inactive = self->_inactive;
      sidecarLayoutValue = self->_sidecarLayoutValue;
      firstSidecarLayoutReceived = self->_firstSidecarLayoutReceived;
      sideButtonPressed = self->_sideButtonPressed;
      userDisconnect = self->_userDisconnect;
      pauseButtonPressed = self->_pauseButtonPressed;
      incomingCallDeclined = self->_incomingCallDeclined;
      incomingCall = self->_incomingCall;
      v26 = 136317442;
      v27 = "-[ContinuityCaptureViewController _resolveUserPauseState]";
      v28 = 2048;
      v29 = self;
      v30 = 1026;
      v31 = inactive;
      v32 = 1026;
      v33 = sidecarLayoutValue;
      v34 = 1026;
      v35 = firstSidecarLayoutReceived;
      v36 = 1026;
      v37 = sideButtonPressed;
      v38 = 1026;
      v39 = userDisconnect;
      v40 = 1026;
      v41 = pauseButtonPressed;
      v42 = 1026;
      v43 = incomingCallDeclined;
      v44 = 1024;
      v45 = incomingCall;
      v15 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v46, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p> _inactive: %{public}d _sidecarLayoutValue: %{public}d _firstSidecarLayoutReceived: %{public}d _sideButtonPressed: %{public}d _userDisconnect: %{public}d _pauseButtonPressed: %{public}d _incomingCallDeclined: %{public}d _incomingCall: %d", &v26, 70);
      v4 = v25;
    }
    else
    {
      v15 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v15, v15 != v46, v4, 0);
  }
  continuityCaptureDevice = self->_continuityCaptureDevice;
  if (continuityCaptureDevice)
  {
    if (self->_inactive)
    {
      -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](continuityCaptureDevice, "postEvent:entity:data:", kCMContinuityCaptureEventUserPause, 0, 0);
LABEL_30:
      self->_sideButtonPressed = 0;
      self->_incomingCallDeclined = 0;
      return;
    }
    if (self->_sideButtonPressed)
    {
LABEL_19:
      if (!self->_incomingCall && self->_firstSidecarLayoutReceived)
      {
        -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](continuityCaptureDevice, "postEvent:entity:data:", kCMContinuityCaptureEventUserResume, 0, 0);
        self->_pendingStreamStartAfterResumeEvent = 1;
      }
      goto LABEL_30;
    }
    if (self->_incomingCallDeclined)
    {
      if (!self->_pauseButtonPressed)
        goto LABEL_19;
    }
    else if (!self->_pauseButtonPressed && self->_sidecarLayoutValue)
    {
      v22 = &kCMContinuityCaptureEventUserResume;
      goto LABEL_29;
    }
    v22 = &kCMContinuityCaptureEventUserPause;
LABEL_29:
    -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](continuityCaptureDevice, "postEvent:entity:data:", *v22, 0, 0);
    goto LABEL_30;
  }
  if (dword_10001A140)
  {
    v25 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v25, &type);
    v18 = v25;
    v19 = type;
    if (os_log_type_enabled(v17, type))
      v20 = v18;
    else
      v20 = v18 & 0xFFFFFFFE;
    if ((_DWORD)v20)
    {
      v26 = 136315394;
      v27 = "-[ContinuityCaptureViewController _resolveUserPauseState]";
      v28 = 2048;
      v29 = self;
      LODWORD(v23) = 22;
      v21 = (_BYTE *)_os_log_send_and_compose_impl(v20, 0, v46, 128, &_mh_execute_header, v17, v19, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Skip since continuity capture session is not initialized", (const char *)&v26, v23);
      v18 = v25;
    }
    else
    {
      v21 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v21, v21 != v46, v18, 0);
  }
}

- (void)deviceLockStateMonitor:(id)a3 didUpdateDeviceLockState:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  const void *v11;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v14;
  int v15;
  const char *v16;
  __int16 v17;
  ContinuityCaptureViewController *v18;
  __int16 v19;
  _BOOL4 v20;
  _BYTE v21[128];

  if (self->_deviceIsLocked != a4)
  {
    v4 = a4;
    if (dword_10001A140)
    {
      v14 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v14, &type);
      v7 = v14;
      v8 = type;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v9 = v7;
      else
        v9 = v7 & 0xFFFFFFFE;
      if ((_DWORD)v9)
      {
        v15 = 136315650;
        v16 = "-[ContinuityCaptureViewController deviceLockStateMonitor:didUpdateDeviceLockState:]";
        v17 = 2048;
        v18 = self;
        v19 = 1024;
        v20 = v4;
        LODWORD(v11) = 28;
        v10 = (_BYTE *)_os_log_send_and_compose_impl(v9, 0, v21, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v8, "<<<< ContinuityCaptureViewController >>>> %s: <%p> Device locked state changed: %d", (const char *)&v15, v11, LODWORD(block[0]));
        v7 = v14;
      }
      else
      {
        v10 = 0;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v10, v10 != v21, v7, 0);
    }
    self->_deviceIsLocked = v4;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BD90;
    block[3] = &unk_100014730;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)contentViewDidSelectPauseButton:(id)a3
{
  self->_pauseButtonPressed = self->_uiState == 1;
  -[ContinuityCaptureViewController _resolveUserPauseState](self, "_resolveUserPauseState", a3);
}

- (void)contentViewDidSelectDisconnectButton:(id)a3
{
  self->_pendingDisconnectDialogue = 1;
  -[ContinuityCaptureViewController _showHowToReconnectDialog](self, "_showHowToReconnectDialog", a3);
}

- (void)_disconnectSession
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  os_log_type_t type;
  unsigned int v11;
  int v12;
  const char *v13;
  __int16 v14;
  ContinuityCaptureViewController *v15;
  _BYTE v16[128];

  if (dword_10001A140)
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(qword_10001A138, 1, &v11, &type);
    v4 = v11;
    v5 = type;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v6)
    {
      v12 = 136315394;
      v13 = "-[ContinuityCaptureViewController _disconnectSession]";
      v14 = 2048;
      v15 = self;
      v7 = (_BYTE *)_os_log_send_and_compose_impl(v6, 0, v16, 128, &_mh_execute_header, os_log_and_send_and_compose_flags_and_os_log_type, v5, "<<<< ContinuityCaptureViewController >>>> %s: <%p>", (const char *)&v12, 22);
      v4 = v11;
    }
    else
    {
      v7 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(qword_10001A138, 1, 1, v7, v7 != v16, v4, 0);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  self->_pendingDisconnectDialogue = 0;
  self->_userDisconnect = 1;
  -[CMContinuityCaptureRemoteCompositeDevice postEvent:entity:data:](self->_continuityCaptureDevice, "postEvent:entity:data:", kCMContinuityCaptureEventUserDisconnect, 0, 0);
  v8 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C118;
  block[3] = &unk_100014730;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
