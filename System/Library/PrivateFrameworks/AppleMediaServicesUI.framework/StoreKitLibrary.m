@implementation StoreKitLibrary

void *__StoreKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/StoreKit.framework/StoreKit", 2);
  StoreKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
