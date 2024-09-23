@implementation BiometricKitLibrary

void *__BiometricKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit", 2);
  BiometricKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
