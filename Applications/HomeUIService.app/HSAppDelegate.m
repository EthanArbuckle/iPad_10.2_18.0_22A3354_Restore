@implementation HSAppDelegate

- (HSAppDelegate)init
{
  HSAppDelegate *v2;
  void *v3;
  BSInvalidatable *idleTimerAssertion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HSAppDelegate;
  v2 = -[HSAppDelegate init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v3, "setDelegate:", v2);

    v2->_backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    idleTimerAssertion = v2->_idleTimerAssertion;
    v2->_idleTimerAssertion = 0;

  }
  return v2;
}

- (void)applicationDidFinishLaunching:(id)a3
{
  -[HSAppDelegate startBackgroundTask](self, "startBackgroundTask", a3);
}

- (void)applicationWillEnterForeground:(id)a3
{
  -[HSAppDelegate startBackgroundTask](self, "startBackgroundTask", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[HSAppDelegate releaseIdleTimerAssertion](self, "releaseIdleTimerAssertion");
  v3.receiver = self;
  v3.super_class = (Class)HSAppDelegate;
  -[HSAppDelegate dealloc](&v3, "dealloc");
}

- (void)startBackgroundTask
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v3 = -[HSAppDelegate backgroundTaskIdentifier](self, "backgroundTaskIdentifier");
  v5 = HFLogForCategory(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3 == UIBackgroundTaskInvalid)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating background task to prevent HomeUIService from going into backgroundSuspended state", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    -[HSAppDelegate setBackgroundTaskIdentifier:](self, "setBackgroundTaskIdentifier:", objc_msgSend(v8, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("startBackgroundTask"), &stru_1000A2BF8));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003D3A4;
    v10[3] = &unk_1000A2C20;
    v10[4] = self;
    v9 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 0.25);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring startBackgroundTask call since already running", buf, 2u);
    }

  }
}

- (void)makeIdleTimerAssertion
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  int v8;
  const __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAppDelegate idleTimerAssertion](self, "idleTimerAssertion"));

  if (!v3)
  {
    v4 = HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = CFSTR("HomeUIService-Pairing");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HomeUIService creating new assertion to disable idle timer with reason: %@", (uint8_t *)&v8, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ITIdleTimerState sharedInstance](ITIdleTimerState, "sharedInstance"));
    v7 = objc_msgSend(v6, "newAssertionToDisableIdleTimerForReason:", CFSTR("HomeUIService-Pairing"));
    -[HSAppDelegate setIdleTimerAssertion:](self, "setIdleTimerAssertion:", v7);

  }
}

- (void)releaseIdleTimerAssertion
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSAppDelegate idleTimerAssertion](self, "idleTimerAssertion"));

  if (v3)
  {
    v4 = HFLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HomeUIService invalidation idle timer assertion", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSAppDelegate idleTimerAssertion](self, "idleTimerAssertion"));
    objc_msgSend(v6, "invalidate");

    -[HSAppDelegate setIdleTimerAssertion:](self, "setIdleTimerAssertion:", 0);
  }
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (BSInvalidatable)idleTimerAssertion
{
  return self->_idleTimerAssertion;
}

- (void)setIdleTimerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
}

@end
