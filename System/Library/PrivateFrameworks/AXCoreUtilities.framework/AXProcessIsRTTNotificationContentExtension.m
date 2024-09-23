@implementation AXProcessIsRTTNotificationContentExtension

void __AXProcessIsRTTNotificationContentExtension_block_invoke()
{
  id v0;

  AXApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AXProcessIsRTTNotificationContentExtension_AXIsRTTNotificationContentExtension = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.accessibility.RTTUI.RTTNotifications"));

}

@end
