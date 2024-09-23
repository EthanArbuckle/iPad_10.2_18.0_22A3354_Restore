@implementation SUSUIInstallAlertExtensionViewController

- (SUSUIInstallAlertExtensionViewController)init
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  SUSUIInstallAlertExtensionViewController *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *clientQueue;
  SUManagerClient *v9;
  SUManagerClient *client;
  objc_super v12;
  uint8_t buf[4];
  id v14;

  v3 = SUSUILogExtension(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = (id)objc_opt_class(self);
    v5 = v14;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Initing %@", buf, 0xCu);

  }
  v12.receiver = self;
  v12.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  v6 = -[SUSUIInstallAlertExtensionViewController init](&v12, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.susui.countdownInstallQueue", 0);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v7;

    v9 = (SUManagerClient *)objc_msgSend(objc_alloc((Class)SUManagerClient), "initWithDelegate:queue:clientType:", v6, v6->_clientQueue, 0);
    client = v6->_client;
    v6->_client = v9;

  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  OS_dispatch_queue *clientQueue;
  SUManagerClient *client;
  SUManagerClient *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;

  v3 = SUSUILogExtension(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = (id)objc_opt_class(self);
    v5 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Deallocating %@", buf, 0xCu);

  }
  -[SUSUIInstallAlertExtensionViewController invalidate](self, "invalidate");
  clientQueue = self->_clientQueue;
  if (clientQueue)
  {
    self->_clientQueue = 0;

  }
  client = self->_client;
  if (client)
  {
    -[SUManagerClient invalidate](client, "invalidate");
    v8 = self->_client;
    self->_client = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  -[SUSUIInstallAlertExtensionViewController dealloc](&v9, "dealloc");
}

- (void)loadView
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  NSString *updateName;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  NSString *completionAction;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint8_t *v27;
  NSString *v28;
  NSString *singularText;
  NSString *v30;
  NSString *pluralText;
  SUInstallOptions *v32;
  SUInstallOptions *installOptions;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  __int16 v38;
  __int16 v39;
  uint8_t v40[16];
  uint8_t v41[16];
  uint8_t buf[16];

  v3 = SUSUILogExtension(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Loading view", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUSUIInstallAlertExtensionViewController extensionContext](self, "extensionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputItems"));

  if (v6)
  {
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      v11 = v9;
      if (!v9)
      {
        v24 = SUSUILogExtension(0, v10);
        v14 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Failed to get extension item", v40, 2u);
        }
        goto LABEL_34;
      }
      v12 = objc_claimAutoreleasedReturnValue(-[NSObject userInfo](v9, "userInfo"));
      v14 = v12;
      if (v12)
      {
        v15 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeyHumanReadableUpdateName")));
        updateName = self->_updateName;
        self->_updateName = v15;

        if (self->_updateName)
        {
          v19 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeyCompletionAction")));
          completionAction = self->_completionAction;
          self->_completionAction = v19;

          if (!self->_completionAction)
            objc_storeStrong((id *)&self->_completionAction, CFSTR("ExtensionAlertKeyCompletionActionInstall"));
          v21 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeyIsAutoInstall")));
          if (v21 && (v22 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v21, v22) & 1) != 0))
            self->_autoUpdate = -[NSObject BOOLValue](v21, "BOOLValue");
          else
            self->_autoUpdate = 0;
          v28 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeySingularText")));
          singularText = self->_singularText;
          self->_singularText = v28;

          if (!self->_singularText)
          {
            self->_singularText = (NSString *)CFSTR("SOFTWARE_UPDATE_INSTALL_ALERT_COUNTDOWN_BODY_SINGULAR");

          }
          v30 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeyPluralText")));
          pluralText = self->_pluralText;
          self->_pluralText = v30;

          if (!self->_pluralText)
          {
            self->_pluralText = (NSString *)CFSTR("SOFTWARE_UPDATE_INSTALL_ALERT_COUNTDOWN_BODY_PLURAL");

          }
          v32 = (SUInstallOptions *)objc_alloc_init((Class)SUInstallOptions);
          installOptions = self->_installOptions;
          self->_installOptions = v32;

          if (self->_autoUpdate)
          {
            -[SUInstallOptions setDarkBoot:](self->_installOptions, "setDarkBoot:", 1);
            -[SUInstallOptions setAutomaticInstallation:](self->_installOptions, "setAutomaticInstallation:", 1);
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("ExtensionAlertKeyIgnorableConstraints")));
          if (v34)
          {
            v35 = objc_opt_class(NSNumber);
            if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
              -[SUInstallOptions setIgnorableConstraints:](self->_installOptions, "setIgnorableConstraints:", objc_msgSend(v34, "unsignedIntegerValue"));
          }
          -[SUSUIInstallAlertExtensionViewController _clearCountdownTimer](self, "_clearCountdownTimer");
          -[SUSUIInstallAlertExtensionViewController _startCountdownTimerWithInitialTime:](self, "_startCountdownTimerWithInitialTime:", 10);
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[SUSUIInstallAlertExtensionViewController _createView](self, "_createView"));
          -[SUSUIInstallAlertExtensionViewController setView:](self, "setView:", v36);

          goto LABEL_33;
        }
        v37 = SUSUILogExtension(v17, v18);
        v21 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 0;
          v26 = "[SUSUIInstallAlertExtensionViewController] Failed to get update name";
          v27 = (uint8_t *)&v38;
          goto LABEL_32;
        }
      }
      else
      {
        v25 = SUSUILogExtension(0, v13);
        v21 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v39 = 0;
          v26 = "[SUSUIInstallAlertExtensionViewController] Failed to get user info";
          v27 = (uint8_t *)&v39;
LABEL_32:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v26, v27, 2u);
        }
      }
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
  }
  v23 = SUSUILogExtension(v7, v8);
  v11 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] extension input items null or empty. Unable to create alert view", v41, 2u);
  }
LABEL_35:

}

- (void)viewDidLoad
{
  uint64_t v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v3 = SUSUILogExtension(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] View did load", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  -[SUSUIInstallAlertExtensionViewController viewDidLoad](&v5, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  NSTimer *countdownTimer;
  objc_super v8;
  uint8_t buf[4];
  NSTimer *v10;

  v3 = a3;
  v5 = SUSUILogExtension(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    countdownTimer = self->_countdownTimer;
    *(_DWORD *)buf = 138412290;
    v10 = countdownTimer;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] View will appear, _countdownTimer:%@", buf, 0xCu);
  }

  if (!self->_countdownTimer)
  {
    if (self->_timeLeftUntilInstall - 11 <= 0xFFFFFFFFFFFFFFF5)
      self->_timeLeftUntilInstall = 10;
    -[SUSUIInstallAlertExtensionViewController _startCountdownTimerWithInitialTime:](self, "_startCountdownTimerWithInitialTime:");
  }
  v8.receiver = self;
  v8.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  -[SUSUIInstallAlertExtensionViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[16];

  v3 = a3;
  v5 = SUSUILogExtension(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] View will disappear", buf, 2u);
  }

  -[SUSUIInstallAlertExtensionViewController invalidate](self, "invalidate");
  v7.receiver = self;
  v7.super_class = (Class)SUSUIInstallAlertExtensionViewController;
  -[SUSUIInstallAlertExtensionViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
}

- (void)userWantsToDeferInstall:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = SUSUILogExtension(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Install wants to defer install, invalidating", v6, 2u);
  }

  -[SUSUIInstallAlertExtensionViewController invalidate](self, "invalidate");
}

- (void)client:(id)a3 installWantsToStart:(id)a4 completion:(id)a5
{
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = SUSUILogExtension(self, a2);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Install wants to start, invalidating", v8, 2u);
  }

  -[SUSUIInstallAlertExtensionViewController invalidate](self, "invalidate");
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = SUSUILogExtension(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Install did start, invalidating", v7, 2u);
  }

  -[SUSUIInstallAlertExtensionViewController invalidate](self, "invalidate");
}

- (void)invalidate
{
  SUSUIInstallAlertExtensionViewController *obj;

  obj = self;
  objc_sync_enter(obj);
  -[SUSUIInstallAlertExtensionViewController _clearCountdownTimer](obj, "_clearCountdownTimer");
  objc_sync_exit(obj);

}

- (id)_createView
{
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *label;
  UILabel *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UILabel *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleFootnote, 0x8000, 2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v3, 14.0));
  v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithSize:", 0.0, 0.0);
  label = self->_label;
  self->_label = v5;

  v7 = self->_label;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUSUIInstallAlertExtensionViewController _messageTextWithCountdown](self, "_messageTextWithCountdown"));
  -[UILabel setText:](v7, "setText:", v8);

  -[UILabel setAutoresizingMask:](self->_label, "setAutoresizingMask:", 40);
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:", 0);
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_label, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  -[UILabel setFont:](self->_label, "setFont:", v4);
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", 220.0, 1000.0);
  v10 = v9;
  v12 = v11;
  -[UILabel setSize:](self->_label, "setSize:");
  -[SUSUIInstallAlertExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
  v13 = self->_label;

  return v13;
}

- (void)_countdownTimerFired
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *countdownTimer;
  unint64_t timeLeftUntilInstall;
  UILabel *label;
  void *v8;
  OS_dispatch_queue *clientQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NSTimer *v12;

  v3 = SUSUILogExtension(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    countdownTimer = self->_countdownTimer;
    *(_DWORD *)buf = 138412290;
    v12 = countdownTimer;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Countdown timer hit, timer:%@", buf, 0xCu);
  }

  timeLeftUntilInstall = self->_timeLeftUntilInstall - 1;
  self->_timeLeftUntilInstall = timeLeftUntilInstall;
  label = self->_label;
  if (label)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SUSUIInstallAlertExtensionViewController _messageTextWithCountdown](self, "_messageTextWithCountdown"));
    -[UILabel setText:](label, "setText:", v8);

    timeLeftUntilInstall = self->_timeLeftUntilInstall;
  }
  if (!timeLeftUntilInstall)
  {
    -[SUSUIInstallAlertExtensionViewController _clearCountdownTimer](self, "_clearCountdownTimer");
    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000054F0;
    block[3] = &unk_1000081B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)clientQueue, block);
    -[SUSUIInstallAlertExtensionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)reboot
{
  id v2;
  id v3;

  v3 = objc_alloc_init((Class)FBSSystemService);
  v2 = objc_msgSend(objc_alloc((Class)FBSShutdownOptions), "initWithReason:", CFSTR("OTA Software Update"));
  objc_msgSend(v2, "setRebootType:", 1);
  objc_msgSend(v3, "shutdownWithOptions:", v2);

}

- (id)_messageTextWithCountdown
{
  NSString *v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSString *updateName;
  void *v8;
  void *v9;

  v3 = self->_pluralText;
  if (self->_timeLeftUntilInstall == 1)
  {
    v4 = self->_singularText;

    v3 = v4;
  }
  if (qword_10000CD88 != -1)
    dispatch_once(&qword_10000CD88, &stru_1000081F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000CD80, "localizedStringForKey:value:table:", v3, &stru_100008320, CFSTR("ui_alerts")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n"), v5));

  updateName = self->_updateName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_timeLeftUntilInstall));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@ %@"), 0, updateName, v8));

  return v9;
}

- (void)_clearCountdownTimer
{
  uint64_t v3;
  NSObject *v4;
  NSTimer *countdownTimer;
  NSTimer *v6;
  int v7;
  NSTimer *v8;

  if (self->_countdownTimer)
  {
    v3 = SUSUILogExtension(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      countdownTimer = self->_countdownTimer;
      v7 = 138412290;
      v8 = countdownTimer;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Clearing countdown timer %@", (uint8_t *)&v7, 0xCu);
    }

    -[NSTimer invalidate](self->_countdownTimer, "invalidate");
    v6 = self->_countdownTimer;
    self->_countdownTimer = 0;

  }
}

- (void)_startCountdownTimerWithInitialTime:(unint64_t)a3
{
  NSTimer *v5;
  NSTimer *countdownTimer;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSTimer *v11;
  int v12;
  NSTimer *v13;
  __int16 v14;
  unint64_t v15;

  self->_timeLeftUntilInstall = a3;
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_countdownTimerFired", 0, 1, 1.0));
  countdownTimer = self->_countdownTimer;
  self->_countdownTimer = v5;

  v9 = SUSUILogExtension(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_countdownTimer;
    v12 = 138412546;
    v13 = v11;
    v14 = 2048;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[SUSUIInstallAlertExtensionViewController] Started countdown timer %@ with initial time %lu", (uint8_t *)&v12, 0x16u);
  }

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_singularText, 0);
  objc_storeStrong((id *)&self->_pluralText, 0);
  objc_storeStrong((id *)&self->_completionAction, 0);
  objc_storeStrong((id *)&self->_updateName, 0);
  objc_storeStrong((id *)&self->_countdownTimer, 0);
}

@end
