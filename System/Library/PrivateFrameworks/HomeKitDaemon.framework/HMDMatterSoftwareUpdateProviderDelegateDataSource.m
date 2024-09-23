@implementation HMDMatterSoftwareUpdateProviderDelegateDataSource

- (BOOL)isMatterAccessorySoftwareUpdateEnabled
{
  return (_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0) != 0;
}

@end
