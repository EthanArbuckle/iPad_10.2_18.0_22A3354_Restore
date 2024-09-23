@implementation DeviceAccessLibrary

void *__DeviceAccessLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/DeviceAccess.framework/DeviceAccess", 2);
  DeviceAccessLibrary_sLib = (uint64_t)result;
  return result;
}

@end
