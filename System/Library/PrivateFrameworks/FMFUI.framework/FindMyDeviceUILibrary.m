@implementation FindMyDeviceUILibrary

void *__FindMyDeviceUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FindMyDeviceUI.framework/FindMyDeviceUI", 2);
  FindMyDeviceUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
