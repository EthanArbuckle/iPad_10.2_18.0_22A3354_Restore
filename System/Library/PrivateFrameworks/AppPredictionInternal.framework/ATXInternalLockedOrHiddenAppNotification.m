@implementation ATXInternalLockedOrHiddenAppNotification

- (ATXInternalLockedOrHiddenAppNotification)init
{
  ATXInternalLockedOrHiddenAppNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInternalLockedOrHiddenAppNotification;
  v2 = -[ATXInternalLockedOrHiddenAppNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd._ATXAppProtectionMonitor.appLockedOrHidden"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

- (void)registerForNotificationsWithLockedOrHiddenAppBlock:(id)a3
{
  -[_ATXInternalNotification registerForNotifications:](self->_note, "registerForNotifications:", a3);
}

+ (void)postNotificationWithLockedOrHiddenApps:(id)a3
{
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", a3, CFSTR("com.apple.duetexpertd._ATXAppProtectionMonitor.appLockedOrHidden"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
