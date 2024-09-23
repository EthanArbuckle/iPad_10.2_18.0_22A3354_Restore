@implementation StoreKitUILibraryCore

uint64_t __StoreKitUILibraryCore_block_invoke()
{
  uint64_t result;

  result = _sl_dlopen();
  StoreKitUILibraryCore_frameworkLibrary = result;
  return result;
}

@end
