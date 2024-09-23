@implementation BuddyLanguageChangeObserver

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  BuddyLanguageChangeObserver *v4;

  v4 = self;
  v3 = a2;
  -[BuddyLanguageChangeObserver stopObservingLanguageChanges](self, "stopObservingLanguageChanges");
  v2.receiver = v4;
  v2.super_class = (Class)BuddyLanguageChangeObserver;
  -[BuddyLanguageChangeObserver dealloc](&v2, "dealloc");
}

- (void)startObservingLanguageChanges
{
  if (!-[BuddyLanguageChangeObserver isObserving](self, "isObserving", a2))
  {
    -[BuddyLanguageChangeObserver subscribeToLanguageChangeNotification](self, "subscribeToLanguageChangeNotification");
    -[BuddyLanguageChangeObserver subscribeToLocaleChangeNotification](self, "subscribeToLocaleChangeNotification");
    -[BuddyLanguageChangeObserver setObserving:](self, "setObserving:", 1);
  }
}

- (void)stopObservingLanguageChanges
{
  NSTimer *v2;

  if (-[BuddyLanguageChangeObserver isObserving](self, "isObserving", a2))
  {
    -[BuddyLanguageChangeObserver unsubscribeFromLanguageChangeNotification](self, "unsubscribeFromLanguageChangeNotification");
    -[BuddyLanguageChangeObserver unsubscribeFromLocaleChangeNotification](self, "unsubscribeFromLocaleChangeNotification");
    v2 = -[BuddyLanguageChangeObserver localeTimer](self, "localeTimer");
    -[NSTimer invalidate](v2, "invalidate");

    -[BuddyLanguageChangeObserver setLocaleTimer:](self, "setLocaleTimer:", 0);
    -[BuddyLanguageChangeObserver setObserving:](self, "setObserving:", 0);
  }
}

- (void)subscribeToLanguageChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10010CA58, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)unsubscribeFromLanguageChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.language.changed"), 0);
}

- (void)languageDidChange
{
  NSUserDefaults *v2;
  id v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  BOOL v11;
  SEL v12;
  BuddyLanguageChangeObserver *v13;

  v13 = self;
  v12 = a2;
  v2 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v3 = -[NSUserDefaults objectForKey:](v2, "objectForKey:", CFSTR("LockdownSetLanguage"));
  v4 = v3 != 0;

  v11 = v4;
  if (v4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v9;
      sub_100038C3C(v8);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Language observer: Lockdown changed the language", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    -[BuddyLanguageChangeObserver startLocaleTimer](v13, "startLocaleTimer");
  }
}

- (void)startLocaleTimer
{
  NSTimer *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  NSTimer *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSTimer *v9;
  _WORD v10[3];
  os_log_type_t v11;
  os_log_t v12;
  uint8_t buf[7];
  os_log_type_t v14;
  os_log_t oslog[2];
  BuddyLanguageChangeObserver *v16;

  v16 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[BuddyLanguageChangeObserver localeTimer](self, "localeTimer");

  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility(v3);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = oslog[0];
      v5 = v14;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Language observer: Restarting locale timer", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    v6 = -[BuddyLanguageChangeObserver localeTimer](v16, "localeTimer");
    -[NSTimer invalidate](v6, "invalidate");

    -[BuddyLanguageChangeObserver setLocaleTimer:](v16, "setLocaleTimer:", 0);
  }
  else
  {
    v12 = (os_log_t)(id)_BYLoggingFacility(v3);
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v12;
      v8 = v11;
      sub_100038C3C(v10);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Language observer: Starting locale timer", (uint8_t *)v10, 2u);
    }
    objc_storeStrong((id *)&v12, 0);
  }
  v9 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v16, "localeTimerFired:", 0, 0, 8.0);
  -[BuddyLanguageChangeObserver setLocaleTimer:](v16, "setLocaleTimer:", v9);

}

- (void)localeTimerFired:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  NSTimer *v6;
  BuddyLanguageChangeObserverDelegate *v7;
  _WORD v8[7];
  os_log_type_t v9;
  os_log_t oslog;
  id location[2];
  BuddyLanguageChangeObserver *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = oslog;
    v5 = v9;
    sub_100038C3C(v8);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Language observer: Locale didn't change in time, reporting only a language change to our delegate", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6 = -[BuddyLanguageChangeObserver localeTimer](v12, "localeTimer");
  -[NSTimer invalidate](v6, "invalidate");

  -[BuddyLanguageChangeObserver setLocaleTimer:](v12, "setLocaleTimer:", 0);
  v7 = -[BuddyLanguageChangeObserver delegate](v12, "delegate");
  -[BuddyLanguageChangeObserverDelegate observer:didObserveLanguageChange:localeChange:](v7, "observer:didObserveLanguageChange:localeChange:", v12, 1, 0);

  objc_storeStrong(location, 0);
}

- (void)subscribeToLocaleChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10010CF18, CFSTR("AppleDatePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)unsubscribeFromLocaleChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("AppleDatePreferencesChangedNotification"), 0);
}

- (void)localeDidChange
{
  NSUserDefaults *v2;
  id v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  NSTimer *v8;
  BOOL v9;
  NSTimer *v10;
  BuddyLanguageChangeObserverDelegate *v11;
  BOOL v12;
  uint8_t buf[15];
  os_log_type_t v14;
  os_log_t oslog;
  BOOL v16;
  SEL v17;
  BuddyLanguageChangeObserver *v18;

  v18 = self;
  v17 = a2;
  v2 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v3 = -[NSUserDefaults objectForKey:](v2, "objectForKey:", CFSTR("LockdownSetLocale"));
  v4 = v3 != 0;

  v16 = v4;
  if (v4)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(v5);
    v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      v7 = v14;
      sub_100038C3C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Language observer: Lockdown changed the locale", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = -[BuddyLanguageChangeObserver localeTimer](v18, "localeTimer");
    v9 = v8 != 0;

    v12 = v9;
    v10 = -[BuddyLanguageChangeObserver localeTimer](v18, "localeTimer");
    -[NSTimer invalidate](v10, "invalidate");

    -[BuddyLanguageChangeObserver setLocaleTimer:](v18, "setLocaleTimer:", 0);
    v11 = -[BuddyLanguageChangeObserver delegate](v18, "delegate");
    -[BuddyLanguageChangeObserverDelegate observer:didObserveLanguageChange:localeChange:](v11, "observer:didObserveLanguageChange:localeChange:", v18, v12, 1);

  }
}

- (BuddyLanguageChangeObserverDelegate)delegate
{
  return (BuddyLanguageChangeObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (NSTimer)localeTimer
{
  return self->_localeTimer;
}

- (void)setLocaleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_localeTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
