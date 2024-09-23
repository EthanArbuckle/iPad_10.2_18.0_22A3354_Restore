@implementation WFSetAppearanceIntent

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

- (NSNumber)state
{
  uint64_t v2;
  NSNumber *v3;

  v2 = -[WFSetAppearanceIntent style](self, "style");
  v3 = (NSNumber *)MEMORY[0x24BDBD1C0];
  if (v2 != 2)
    v3 = 0;
  if (v2 == 1)
    return (NSNumber *)MEMORY[0x24BDBD1C8];
  else
    return v3;
}

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  WFPerformBooleanSettingIntent(self, a3, a4);
}

@end
