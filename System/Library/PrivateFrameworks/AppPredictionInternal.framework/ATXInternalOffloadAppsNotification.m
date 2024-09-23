@implementation ATXInternalOffloadAppsNotification

- (ATXInternalOffloadAppsNotification)init
{
  ATXInternalOffloadAppsNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInternalOffloadAppsNotification;
  v2 = -[ATXInternalOffloadAppsNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd._ATXInternalUninstallNotification.appOffloaded"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

- (void)registerForNotificationWithOffloadBlock:(id)a3
{
  -[_ATXInternalNotification registerForNotifications:](self->_note, "registerForNotifications:", a3);
}

+ (void)postNotificationWithOffloadSet:(id)a3
{
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", a3, CFSTR("com.apple.duetexpertd._ATXInternalUninstallNotification.appOffloaded"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
