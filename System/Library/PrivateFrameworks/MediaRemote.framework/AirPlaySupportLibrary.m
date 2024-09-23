@implementation AirPlaySupportLibrary

void *__AirPlaySupportLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AirPlaySupport.framework/AirPlaySupport", 2);
  AirPlaySupportLibrary_sLib = (uint64_t)result;
  return result;
}

@end
