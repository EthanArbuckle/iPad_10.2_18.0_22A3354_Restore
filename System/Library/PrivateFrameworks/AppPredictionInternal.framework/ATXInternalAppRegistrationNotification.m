@implementation ATXInternalAppRegistrationNotification

- (ATXInternalAppRegistrationNotification)init
{
  ATXInternalAppRegistrationNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInternalAppRegistrationNotification;
  v2 = -[ATXInternalAppRegistrationNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd.ATXInternalAppRegistrationNotification.appRegistered"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

- (void)registerForNotificationsWithRegisterBlock:(id)a3
{
  -[_ATXInternalNotification registerForNotifications:](self->_note, "registerForNotifications:", a3);
}

+ (void)postNotificationWithInstallDictionary:(id)a3
{
  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", a3, CFSTR("com.apple.duetexpertd.ATXInternalAppRegistrationNotification.appRegistered"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

@end
