@implementation ARUserDefaultsMulticamModeEnabled

BOOL __ARUserDefaultsMulticamModeEnabled_block_invoke()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.multicam_mode.enabled"));
  s_multicamModeEnabled = result;
  return result;
}

@end
