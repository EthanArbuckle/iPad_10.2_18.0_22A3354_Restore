@implementation UIKitServicesLibrary

void *__UIKitServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/UIKitServices.framework/UIKitServices", 2);
  UIKitServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
