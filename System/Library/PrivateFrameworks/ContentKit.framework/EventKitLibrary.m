@implementation EventKitLibrary

void *__EventKitLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/EventKit.framework/EventKit", 2);
  EventKitLibrary_sLib = (uint64_t)result;
  return result;
}

@end
