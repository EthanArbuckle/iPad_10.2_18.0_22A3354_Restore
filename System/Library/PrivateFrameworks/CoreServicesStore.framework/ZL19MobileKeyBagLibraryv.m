@implementation ZL19MobileKeyBagLibraryv

void *___ZL19MobileKeyBagLibraryv_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
  MobileKeyBagLibrary(void)::sLib = (uint64_t)result;
  return result;
}

@end
