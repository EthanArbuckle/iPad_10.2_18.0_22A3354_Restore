@implementation SettingsFoundationLibrary

void *__SettingsFoundationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SettingsFoundation.framework/SettingsFoundation", 2);
  SettingsFoundationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
