@implementation MCSendEffectiveSettingsChangedNotification

uint64_t __MCSendEffectiveSettingsChangedNotification_block_invoke()
{
  return notify_register_check((const char *)objc_msgSend(CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), "UTF8String"), &MCSendEffectiveSettingsChangedNotification_token);
}

@end
