@implementation ATXInternalAppsInstallStartNotification

- (ATXInternalAppsInstallStartNotification)init
{
  ATXInternalAppsInstallStartNotification *v2;
  _ATXInternalNotification *v3;
  _ATXInternalNotification *note;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInternalAppsInstallStartNotification;
  v2 = -[ATXInternalAppsInstallStartNotification init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_ATXInternalNotification initWithNotificationName:]([_ATXInternalNotification alloc], "initWithNotificationName:", CFSTR("com.apple.duetexpertd.ATXInternalAppsInstallStartNotification.appInstalling"));
    note = v2->_note;
    v2->_note = v3;

  }
  return v2;
}

+ (void)postNotificationWithInstallStartDictionary:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[ATXInternalAppsInstallStartNotification postNotificationWithInstallStartDictionary:].cold.1((uint64_t)v3, v4);

  +[_ATXInternalNotification postData:forNotificationNamed:](_ATXInternalNotification, "postData:forNotificationNamed:", v3, CFSTR("com.apple.duetexpertd.ATXInternalAppsInstallStartNotification.appInstalling"));
}

- (void)registerForNotificationsWithInstallStartBlock:(id)a3
{
  -[_ATXInternalNotification registerForNotifications:](self->_note, "registerForNotifications:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
}

+ (void)postNotificationWithInstallStartDictionary:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXInternalAppsInstallStartNotification: posting install start notification with payload:\n%@", (uint8_t *)&v2, 0xCu);
}

@end
