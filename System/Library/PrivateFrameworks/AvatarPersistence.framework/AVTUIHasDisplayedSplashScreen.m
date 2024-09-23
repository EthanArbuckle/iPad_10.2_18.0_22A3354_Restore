@implementation AVTUIHasDisplayedSplashScreen

uint64_t __AVTUIHasDisplayedSplashScreen_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedSplashScreen"), 0);
  AVTUIHasDisplayedSplashScreen_once_enabled = result;
  return result;
}

@end
