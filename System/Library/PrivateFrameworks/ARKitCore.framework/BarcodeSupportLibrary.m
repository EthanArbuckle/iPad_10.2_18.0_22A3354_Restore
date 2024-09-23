@implementation BarcodeSupportLibrary

void *__BarcodeSupportLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/BarcodeSupport.framework/BarcodeSupport", 2);
  BarcodeSupportLibrary_sLib = (uint64_t)result;
  return result;
}

@end
