@implementation InitializeDemoModeValuesIfNecessary

void ___InitializeDemoModeValuesIfNecessary_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_PreferencesChanged, (CFStringRef)*MEMORY[0x24BE6F7B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  _UpdateDemoModeValues();
}

@end
