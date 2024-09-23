@implementation ANSystemNotificationObserver

- (ANSystemNotificationObserver)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ANSystemNotificationObserver;
  return -[ANSystemNotificationObserver init](&v3, sel_init);
}

- (ANSystemNotificationObserver)initWithHandler:(id)a3
{
  id v4;
  ANSystemNotificationObserver *v5;
  uint64_t v6;
  id observerHandler;

  v4 = a3;
  v5 = -[ANSystemNotificationObserver init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    observerHandler = v5->_observerHandler;
    v5->_observerHandler = (id)v6;

    -[ANSystemNotificationObserver startObservingNotifications](v5, "startObservingNotifications");
  }

  return v5;
}

+ (id)observer:(id)a3
{
  id v3;
  ANSystemNotificationObserver *v4;

  v3 = a3;
  v4 = -[ANSystemNotificationObserver initWithHandler:]([ANSystemNotificationObserver alloc], "initWithHandler:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ANSystemNotificationObserver removeNotificationObservers](self, "removeNotificationObservers");
  v3.receiver = self;
  v3.super_class = (Class)ANSystemNotificationObserver;
  -[ANSystemNotificationObserver dealloc](&v3, sel_dealloc);
}

- (void)startObservingNotifications
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ANLogHandleSystemNotificationObserver();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@SystemNotificationObserver start observing System Notifications.", (uint8_t *)&v5, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_LanguageChanged, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)removeNotificationObservers
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("AppleLanguagePreferencesChangedNotification"), 0);
}

- (void)_languageDidChange
{
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD);
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[ANSystemNotificationObserver removeNotificationObservers](self, "removeNotificationObservers");
  ANLogHandleSystemNotificationObserver();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = &stru_1E93913D0;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "%@SystemNotificationObserver language did change.", (uint8_t *)&v5, 0xCu);
  }

  -[ANSystemNotificationObserver observerHandler](self, "observerHandler");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, 1);

}

- (id)observerHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setObserverHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerHandler, 0);
}

@end
