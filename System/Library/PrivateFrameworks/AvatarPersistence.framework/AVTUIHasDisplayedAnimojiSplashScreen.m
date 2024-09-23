@implementation AVTUIHasDisplayedAnimojiSplashScreen

uint64_t __AVTUIHasDisplayedAnimojiSplashScreen_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTAvatarHasDisplayedAnimojiSplashScreen"), 0);
  AVTUIHasDisplayedAnimojiSplashScreen_once_enabled = result;
  return result;
}

@end
