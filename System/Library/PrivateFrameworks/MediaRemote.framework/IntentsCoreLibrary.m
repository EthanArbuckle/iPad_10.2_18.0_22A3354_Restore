@implementation IntentsCoreLibrary

void *__IntentsCoreLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IntentsCore.framework/IntentsCore", 2);
  IntentsCoreLibrary_sLib = (uint64_t)result;
  return result;
}

@end
