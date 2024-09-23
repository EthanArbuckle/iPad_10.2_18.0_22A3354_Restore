@implementation WebSheetAppDelegate

- (void)applicationDidFinishLaunching:(id)a3
{
  WSWebSheetViewController *v4;
  WSWebSheetViewController *webSheetCont;

  NSLog(CFSTR("applicationDidFinishLaunching"), a2, a3);
  v4 = (WSWebSheetViewController *)objc_alloc_init((Class)WSWebSheetViewController);
  webSheetCont = self->_webSheetCont;
  self->_webSheetCont = v4;

  objc_storeStrong((id *)&self->_showWebSheetContext.viewCont, self->_webSheetCont);
  objc_storeStrong((id *)&self->_showWebSheetContext.delegate, self);
  if (!CNIAmTheWebsheetApp2(sub_100004174, &self->_showWebSheetContext))
  {
    NSLog(CFSTR("An error occurred when the WebSheet tried to check in."));
    objc_msgSend(UIApp, "terminateWithSuccess");
  }
}

- (BOOL)canShowAlerts
{
  return 1;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint8_t v4[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Alert deactivated - terminate", v4, 2u);
  }
  -[WSWebSheetViewController dismissViewController:](self->_webSheetCont, "dismissViewController:", 4);
}

- (void)applicationWillTerminate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_openWiFiPreferencesOnExit)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=WIFI")));
    objc_msgSend(v4, "openSensitiveURL:withOptions:", v5, 0);

  }
  -[WSWebSheetViewController dismissViewController:](self->_webSheetCont, "dismissViewController:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[WebSheetAppDelegate remotePresentationController](self, "remotePresentationController"));
  objc_msgSend(v6, "dismissPresentationController:", 1);

}

- (void)handleWebNavigationWithCompletionHandler:(id)a3
{
  void *v4;
  WebSheetAppDelegate *v5;
  void *v6;
  uint64_t v7;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  id v10;

  v10 = a3;
  NSLog(CFSTR("handleWebNavigationWithCompletionHandler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WebSheetAppDelegate probeCompleteCompletionHandler](self, "probeCompleteCompletionHandler"));

  if (!v4)
  {
    -[WebSheetAppDelegate setProbeCompleteCompletionHandler:](self, "setProbeCompleteCompletionHandler:", v10);
    NSLog(CFSTR("dispatching captive probe ..."));
    v5 = self;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WebSheetAppDelegate interfaceName](v5, "interfaceName"));
    v7 = CNProberCreate(kCFAllocatorDefault, v6, sub_100004A64, v5);

    if (v7)
    {
      RunLoopSource = (__CFRunLoopSource *)CNProberCreateRunLoopSource(v7);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
    }
    else
    {
      NSLog(CFSTR("CNProberCreate failed"));
    }
  }

}

- (void)handleDismissal
{
  id v3;

  NSLog(CFSTR("handleDismissal"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[WebSheetAppDelegate remotePresentationController](self, "remotePresentationController"));
  objc_msgSend(v3, "dismissPresentationController:", 1);

}

- (void)handleCompleteNotificationWithRedirectURLtype:(int64_t)a3 result:(int64_t)a4
{
  uint64_t v7;
  int v8;
  CFDictionaryRef v9;
  void *v10;
  int valuePtr;
  void *values;
  void *keys;

  if (self->_isCompleteNotificationHandled)
  {
    NSLog(CFSTR("complete notification is already handled"), a2, a3, a4);
  }
  else
  {
    NSLog(CFSTR("handleCompleteNotificationWithRedirectURLtype, result: %ld, redireURLtype: %ld"), a2, a4, a3);
    v7 = 0;
    if ((unint64_t)(a3 - 1) < 3)
      v8 = a3;
    else
      v8 = 0;
    valuePtr = v8;
    if ((unint64_t)(a4 - 1) <= 6)
      v7 = dword_100005EC8[a4 - 1];
    keys = (void *)kCNWebSheetOptionsRedirectURLType;
    values = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    v9 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CNWebsheetNotifyCompleteWithOptions(dword_10000D208, v7, v9);
    if (a4 == 7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v10, "setOpenWiFiPreferencesOnExit:", 1);

    }
    self->_isCompleteNotificationHandled = 1;
  }
}

- (void)scrapeCredentialsUsingPOSTMessage:(id)a3 loginURL:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  NSLog(CFSTR("scrapeCredentialsUsingPOSTMessage"));
  CNScrapeCredentials(self->_interfaceName, v6, CFSTR("application/x-www-form-urlencoded"), v7, 0);

}

- (WSWebSheetViewController)webSheetCont
{
  return self->_webSheetCont;
}

- (void)setWebSheetCont:(id)a3
{
  objc_storeStrong((id *)&self->_webSheetCont, a3);
}

- (BOOL)openWiFiPreferencesOnExit
{
  return self->_openWiFiPreferencesOnExit;
}

- (void)setOpenWiFiPreferencesOnExit:(BOOL)a3
{
  self->_openWiFiPreferencesOnExit = a3;
}

- (WebSheetRemoteAlertPresentationViewController)remotePresentationController
{
  return self->_remotePresentationController;
}

- (void)setRemotePresentationController:(id)a3
{
  self->_remotePresentationController = (WebSheetRemoteAlertPresentationViewController *)a3;
}

- (id)probeCompleteCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setProbeCompleteCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong(&self->_probeCompleteCompletionHandler, 0);
  objc_storeStrong((id *)&self->_webSheetCont, 0);
  sub_100004A34((id *)&self->_showWebSheetContext.delegate);
}

@end
