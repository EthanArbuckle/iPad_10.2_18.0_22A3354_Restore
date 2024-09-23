@implementation AVTUIForceNoMemojiRecentStickersSplashScreen

uint64_t __AVTUIForceNoMemojiRecentStickersSplashScreen_once_block_invoke()
{
  uint64_t result;

  result = _AVTUIBoolForInternalSettingKey(CFSTR("AVTUIGlobalPreferencesForceNoMemojiStickerRecentsSplashScreen"), 0);
  AVTUIForceNoMemojiRecentStickersSplashScreen_once_enabled = result;
  return result;
}

@end
