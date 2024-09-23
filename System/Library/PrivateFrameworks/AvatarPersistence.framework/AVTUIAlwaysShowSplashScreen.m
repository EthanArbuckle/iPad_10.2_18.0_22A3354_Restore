@implementation AVTUIAlwaysShowSplashScreen

uint64_t __AVTUIAlwaysShowSplashScreen_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarAlwaysShowSplashScreen"), 0);
  AVTUIAlwaysShowSplashScreen_once_enabled = result;
  return result;
}

@end
