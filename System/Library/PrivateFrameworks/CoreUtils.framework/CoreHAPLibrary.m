@implementation CoreHAPLibrary

void *__CoreHAPLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreHAP.framework/CoreHAP", 2);
  CoreHAPLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreHAPLibrary_block_invoke_5710()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreHAP.framework/CoreHAP", 2);
  CoreHAPLibrary_sLib_5711 = (uint64_t)result;
  return result;
}

@end
