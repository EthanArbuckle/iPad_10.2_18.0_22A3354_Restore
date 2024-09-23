@implementation EKUIDebugPreferences

+ (id)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_21);
  return (id)shared_sharedPreferences;
}

void __30__EKUIDebugPreferences_shared__block_invoke()
{
  EKUIDebugPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(EKUIDebugPreferences);
  v1 = (void *)shared_sharedPreferences;
  shared_sharedPreferences = (uint64_t)v0;

}

- (EKUIDebugPreferences)init
{
  EKUIDebugPreferences *v2;
  id v3;
  uint64_t v4;
  CalPreferences *preferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIDebugPreferences;
  v2 = -[EKUIDebugPreferences init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0C368]);
    v4 = objc_msgSend(v3, "initWithDomain:", *MEMORY[0x1E0D0C508]);
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkitui.debug.preference.notification.showInviteesAndMoreRegion"));
    -[CalPreferences registerReflectionForPreferenceWithNotificationName:](v2->_preferences, "registerReflectionForPreferenceWithNotificationName:", CFSTR("com.apple.eventkitui.debug.preference.notification.showReportAProblemNotificationButton"));
  }
  return v2;
}

- (BOOL)showInviteesAndMoreRegion
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("showInviteesAndMoreRegion"), 0);
}

- (void)setShowInviteesAndMoreRegion:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("showInviteesAndMoreRegion"), a3, CFSTR("com.apple.eventkitui.debug.preference.notification.showInviteesAndMoreRegion"));
}

- (BOOL)showReportAProblemNotificationButton
{
  return -[CalPreferences getBooleanPreference:defaultValue:](self->_preferences, "getBooleanPreference:defaultValue:", CFSTR("showReportAProblemNotificationButton"), 1);
}

- (void)setShowReportAProblemNotificationButton:(BOOL)a3
{
  -[CalPreferences setBooleanPreference:value:notificationName:](self->_preferences, "setBooleanPreference:value:notificationName:", CFSTR("showReportAProblemNotificationButton"), a3, CFSTR("com.apple.eventkitui.debug.preference.notification.showReportAProblemNotificationButton"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
