@implementation WFSetOrientationLockIntent

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  WFPerformBooleanSettingIntent(self, a3, a4);
}

@end
