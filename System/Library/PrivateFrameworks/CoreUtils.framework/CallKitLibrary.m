@implementation CallKitLibrary

void *__CallKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CallKit.framework/CallKit", 2);
  CallKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
