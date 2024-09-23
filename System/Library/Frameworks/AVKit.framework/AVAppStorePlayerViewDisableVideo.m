@implementation AVAppStorePlayerViewDisableVideo

uint64_t __AVAppStorePlayerViewDisableVideo_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("com.apple.avkit"), CFSTR("appStorePlayerViewDisableVideo"), 0);
  AVAppStorePlayerViewDisableVideo_AVAppStorePlayerViewDisableVideo = (_DWORD)result != 0;
  return result;
}

@end
