@implementation MobileWiFiLibrary

void *__MobileWiFiLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileWiFi.framework/MobileWiFi", 2);
  MobileWiFiLibrary_sLib = (uint64_t)result;
  return result;
}

@end
