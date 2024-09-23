@implementation ExternalAccessoryLibrary

void *__ExternalAccessoryLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory", 2);
  ExternalAccessoryLibrary_sLib = (uint64_t)result;
  return result;
}

@end
