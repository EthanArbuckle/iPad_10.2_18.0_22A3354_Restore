@implementation TrustMeAppDelegate

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  TrustMeAppDelegate *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  -[CPDistributedMessagingCenter unregisterForMessageName:](v5->_center, "unregisterForMessageName:", 0);
  -[NSTimer invalidate](v5->_killTimer, "invalidate");
  v3.receiver = v5;
  v3.super_class = (Class)TrustMeAppDelegate;
  -[TrustMeAppDelegate dealloc](&v3, "dealloc");
}

- (void)_scheduleTimer
{
  NSTimer *v2;
  NSTimer *killTimer;

  v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_killTimerFired", 0, 0, 5.0, a2);
  killTimer = self->_killTimer;
  self->_killTimer = v2;

}

- (void)_clearTimer
{
  -[NSTimer invalidate](self->_killTimer, "invalidate", a2);
  objc_storeStrong((id *)&self->_killTimer, 0);
}

- (void)_killTimerFired
{
  NSObject *log;
  os_log_type_t type;
  uint8_t v4[7];
  char v5;
  id location[2];
  TrustMeAppDelegate *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = *((id *)&_CertUILogObjects + 2);
  v5 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = location[0];
    type = v5;
    sub_100003F60(v4);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Kill timer fired", v4, 2u);
  }
  objc_storeStrong(location, 0);
  -[TrustMeAppDelegate _clearTimer](v7, "_clearTimer");
  exit(0);
}

- (void)_sendResponse:(int)a3
{
  id v3;
  id v4;
  id v5;
  id *location;
  id v7;
  id v8;
  unsigned int v9;
  SEL v10;
  TrustMeAppDelegate *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v4 = objc_alloc((Class)NSDictionary);
  v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9);
  v7 = 0;
  v3 = objc_msgSend(v4, "initWithObjectsAndKeys:", kCertUITrustResponseKey, 0);
  location = &v8;
  v8 = v3;

  -[CPDistributedMessagingCenter sendDelayedReply:dictionary:](v11->_center, "sendDelayedReply:dictionary:", v11->_replyContext, v8);
  objc_storeStrong(location, v7);
}

- (void)_presentRemoteAlertWithInfo:(id)a3 replyContext:(id)a4
{
  id v4;
  SBSRemoteAlertHandle *v5;
  SBSRemoteAlertHandle *alertHandle;
  uint64_t v7;
  id v8;
  NSString *v9;
  NSBundle *v10;
  unsigned __int8 v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  BOOL v15;
  NSObject *log;
  os_log_type_t type;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t v30[7];
  char v31;
  id v32;
  id v33;
  id location[2];
  TrustMeAppDelegate *v35;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = _CertUILogObjects[2];
  v31 = 1;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_INFO))
  {
    log = v32;
    type = v31;
    sub_100003F60(v30);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Presenting remote alert", v30, 2u);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong((id *)&v35->_replyContext, v33);
  v29 = objc_msgSend(location[0], "objectForKey:", kCertUITrustTitleKey);
  v28 = objc_msgSend(location[0], "objectForKey:", kCertUITrustIssuerKey);
  v27 = objc_msgSend(location[0], "objectForKey:", kCertUITrustPurposeKey);
  v26 = objc_msgSend(location[0], "objectForKey:", kCertUITrustExpirationKey);
  v12 = objc_msgSend(location[0], "objectForKey:", kCertUITrustIsRootCertificateKey);
  v13 = objc_msgSend(v12, "BOOLValue");

  v25 = v13 & 1;
  v24 = objc_msgSend(location[0], "objectForKey:", kCertUITrustPropertiesKey);
  v14 = +[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection");
  v15 = objc_msgSend(v14, "effectiveBoolValueForSetting:", MCFeatureUntrustedTLSPromptAllowed) != 2;

  v23 = v15;
  v22 = objc_msgSend(location[0], "objectForKey:", kCertUITrustAllowCertificateTrustKey);
  if (v22)
  {
    v11 = 0;
    if ((v23 & 1) != 0)
      v11 = objc_msgSend(v22, "BOOLValue");
    v23 = v11 & 1;
  }
  v4 = objc_alloc((Class)TrustCertificateViewController);
  v21 = objc_msgSend(v4, "initWithTrustCertificateDelegate:allowTrust:", v35, v23 & 1);
  LODWORD(v7) = 2;
  objc_msgSend(v21, "setCertificateInfo:issuer:purpose:expiration:isRoot:properties:action:", v29, v28, v27, v26, v25 & 1, v24, v7);
  objc_storeStrong((id *)&v35->_trustController, v21);
  v8 = objc_alloc((Class)SBSRemoteAlertDefinition);
  v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v9 = -[NSBundle bundleIdentifier](v10, "bundleIdentifier");
  v20 = objc_msgSend(v8, "initWithServiceName:viewControllerClassName:");

  v5 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v20);
  alertHandle = v35->_alertHandle;
  v35->_alertHandle = v5;

  -[SBSRemoteAlertHandle addObserver:](v35->_alertHandle, "addObserver:", v35);
  v19 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  objc_msgSend(v19, "setReason:", CFSTR("CertificateTrustApp"));
  -[SBSRemoteAlertHandle activateWithContext:](v35->_alertHandle, "activateWithContext:", v19);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (void)_dismissRemoteAlertController
{
  TrustMeRotatingViewController *v2;

  if (self->_trustController)
  {
    self->_remoteAlertControllerIsDismissing = 1;
    v2 = -[TrustMeAppDelegate currentRemoteAlertController](self, "currentRemoteAlertController");
    -[TrustMeRotatingViewController dismissSheetAndDismissAlert](v2, "dismissSheetAndDismissAlert");

    objc_storeStrong((id *)&self->_trustController, 0);
  }
}

- (void)_sheetControllerDidFinishDismissing
{
  if (self->_remoteAlertControllerIsDismissing)
  {
    self->_remoteAlertControllerIsDismissing = 0;
    if (-[NSMutableArray count](self->_queuedMessages, "count"))
      -[TrustMeAppDelegate _presentNextQueuedMessage](self, "_presentNextQueuedMessage");
    else
      -[TrustMeAppDelegate _scheduleTimer](self, "_scheduleTimer");
  }
}

- (void)trustCertificateViewController:(id)a3 finishedWithReturnCode:(int)a4
{
  unsigned int v5;
  id location[2];
  TrustMeAppDelegate *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  if (a4 == 1)
    v5 = 2;
  -[TrustMeAppDelegate _sendResponse:](v7, "_sendResponse:", v5);
  objc_storeStrong((id *)&v7->_replyContext, 0);
  -[TrustMeAppDelegate _dismissRemoteAlertController](v7, "_dismissRemoteAlertController");
  objc_storeStrong(location, 0);
}

- (void)_presentNextQueuedMessage
{
  id v2;
  id v3[2];
  TrustMeAppDelegate *v4;

  v4 = self;
  v3[1] = (id)a2;
  v3[0] = -[NSMutableArray objectAtIndex:](self->_queuedMessages, "objectAtIndex:");
  -[NSMutableArray removeObjectAtIndex:](v4->_queuedMessages, "removeObjectAtIndex:", 0);
  v2 = -[NSMutableArray objectAtIndex:](v4->_queuedReplyContexts, "objectAtIndex:", 0);
  -[NSMutableArray removeObjectAtIndex:](v4->_queuedReplyContexts, "removeObjectAtIndex:", 0);
  -[TrustMeAppDelegate _presentRemoteAlertWithInfo:replyContext:](v4, "_presentRemoteAlertWithInfo:replyContext:", v3[0], v2);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(v3, 0);
}

- (void)_queueMessage:(id)a3 withReplyContext:(id)a4
{
  NSMutableArray *v4;
  NSMutableArray *queuedMessages;
  NSMutableArray *v6;
  NSMutableArray *queuedReplyContexts;
  id v9;
  id location[2];
  TrustMeAppDelegate *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  if (!v11->_queuedMessages)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedMessages = v11->_queuedMessages;
    v11->_queuedMessages = v4;

  }
  if (v11->_queuedReplyContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedReplyContexts = v11->_queuedReplyContexts;
    v11->_queuedReplyContexts = v6;

  }
  -[NSMutableArray addObject:](v11->_queuedMessages, "addObject:", location[0]);
  -[NSMutableArray addObject:](v11->_queuedReplyContexts, "addObject:", v9);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5
{
  id v7;
  int v8;
  os_log_type_t v9;
  os_log_t oslog;
  os_log_type_t v11;
  id v12[2];
  id v13;
  id location[2];
  TrustMeAppDelegate *v15;
  uint8_t v16[16];
  uint8_t v17[24];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12[1] = a5;
  v12[0] = _CertUILogObjects[2];
  v11 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_INFO))
  {
    sub_100004AF4((uint64_t)v17, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12[0], v11, "Got message %@", v17, 0xCu);
  }
  objc_storeStrong(v12, 0);
  if ((objc_msgSend(location[0], "isEqualToString:", kCertUIPresentTrustInfoMessage) & 1) != 0)
  {
    -[TrustMeAppDelegate _clearTimer](v15, "_clearTimer");
    v7 = -[CPDistributedMessagingCenter delayReply](v15->_center, "delayReply");
    if (v15->_trustController)
      -[TrustMeAppDelegate _queueMessage:withReplyContext:](v15, "_queueMessage:withReplyContext:", v13, v7);
    else
      -[TrustMeAppDelegate _presentRemoteAlertWithInfo:replyContext:](v15, "_presentRemoteAlertWithInfo:replyContext:", v13, v7);
    objc_storeStrong(&v7, 0);
    v8 = 0;
  }
  else
  {
    oslog = (os_log_t)_CertUILogObjects[2];
    v9 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100004AF4((uint64_t)v16, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Ignoring message %@", v16, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_startCenter
{
  CPDistributedMessagingCenter *v2;
  CPDistributedMessagingCenter *center;

  v2 = (CPDistributedMessagingCenter *)+[CPDistributedMessagingCenter centerNamed:](CPDistributedMessagingCenter, "centerNamed:", kCertUIMessagingCenterActualName);
  center = self->_center;
  self->_center = v2;

  -[CPDistributedMessagingCenter registerForMessageName:target:selector:](self->_center, "registerForMessageName:target:selector:", kCertUIPresentTrustInfoMessage, self, "_trustInfoMessageReceived:userInfo:auditToken:");
  -[CPDistributedMessagingCenter runServerOnCurrentThread](self->_center, "runServerOnCurrentThread");
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  os_log_t oslog;
  id location[2];
  TrustMeAppDelegate *v5;
  uint8_t v6[8];

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)_CertUILogObjects[2];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004CF0((uint64_t)v6, v5->_trustController != 0);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Alert deactivated while there was a trust controller already :%{BOOL}d", v6, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v5->_trustController)
    exit(0);
  objc_storeStrong(location, 0);
}

- (void)homeButtonWasPressed
{
  -[TrustMeAppDelegate trustCertificateViewController:finishedWithReturnCode:](self, "trustCertificateViewController:finishedWithReturnCode:", self->_trustController, 0, a2, self);
}

- (id)trustControllerToBePresentedByRemoteAlertViewController
{
  return self->_trustController;
}

- (void)applicationWillTerminate:(id)a3
{
  id location[2];
  TrustMeAppDelegate *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPDistributedMessagingCenter unregisterForMessageName:](v4->_center, "unregisterForMessageName:", 0);
  objc_storeStrong((id *)&v4->_center, 0);
  -[TrustMeAppDelegate _dismissRemoteAlertController](v4, "_dismissRemoteAlertController");
  objc_storeStrong(location, 0);
}

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  NSNotificationCenter *v5;
  id v6;
  id location[2];
  TrustMeAppDelegate *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  v5 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", v8, "_sheetControllerDidFinishDismissing", kCertificateViewControllerDismissedNotification, 0);

  -[TrustMeAppDelegate _startCenter](v8, "_startCenter");
  -[TrustMeAppDelegate _scheduleTimer](v8, "_scheduleTimer");
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (TrustMeRotatingViewController)currentRemoteAlertController
{
  return (TrustMeRotatingViewController *)objc_loadWeakRetained((id *)&self->_currentRemoteAlertController);
}

- (void)setCurrentRemoteAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_currentRemoteAlertController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentRemoteAlertController);
  objc_storeStrong((id *)&self->_killTimer, 0);
  objc_storeStrong((id *)&self->_queuedReplyContexts, 0);
  objc_storeStrong((id *)&self->_queuedMessages, 0);
  objc_storeStrong((id *)&self->_replyContext, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_trustController, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
}

@end
