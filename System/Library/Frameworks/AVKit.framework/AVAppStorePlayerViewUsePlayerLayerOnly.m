@implementation AVAppStorePlayerViewUsePlayerLayerOnly

uint64_t __AVAppStorePlayerViewUsePlayerLayerOnly_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("com.apple.avkit"), CFSTR("appStorePlayerViewPlayerLayerOnly"), 0);
  AVAppStorePlayerViewUsePlayerLayerOnly_AVAppStorePlayerViewUsePlayerLayerOnly = (_DWORD)result != 0;
  return result;
}

@end
