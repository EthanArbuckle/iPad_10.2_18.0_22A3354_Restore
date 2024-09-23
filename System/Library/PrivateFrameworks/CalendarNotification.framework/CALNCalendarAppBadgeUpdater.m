@implementation CALNCalendarAppBadgeUpdater

- (CALNCalendarAppBadgeUpdater)initWithInboxNotificationMonitor:(id)a3
{
  id v5;
  CALNCalendarAppBadgeUpdater *v6;
  CALNCalendarAppBadgeUpdater *v7;
  id v8;
  uint64_t v9;
  UISApplicationState *applicationState;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CALNCalendarAppBadgeUpdater;
  v6 = -[CALNCalendarAppBadgeUpdater init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inboxNotificationMonitor, a3);
    v8 = objc_alloc(MEMORY[0x24BEBEC28]);
    v9 = objc_msgSend(v8, "initWithBundleIdentifier:", *MEMORY[0x24BE14020]);
    applicationState = v7->_applicationState;
    v7->_applicationState = (UISApplicationState *)v9;

    objc_msgSend(v5, "addNotificationsChangedObserver:selector:", v7, sel_handleNotificationsChangedNotification_);
  }

  return v7;
}

- (void)handleNotificationsChangedNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CALNCalendarAppBadgeUpdater inboxNotificationMonitor](self, "inboxNotificationMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "eventNotificationCount");

  +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67240192;
    v9[1] = v5;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Update calendar app badge count to %{public}d", (uint8_t *)v9, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarAppBadgeUpdater applicationState](self, "applicationState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBadgeValue:", v7);

}

- (CALNInboxNotificationMonitor)inboxNotificationMonitor
{
  return self->_inboxNotificationMonitor;
}

- (UISApplicationState)applicationState
{
  return self->_applicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationState, 0);
  objc_storeStrong((id *)&self->_inboxNotificationMonitor, 0);
}

@end
