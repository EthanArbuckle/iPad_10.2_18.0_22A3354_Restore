@implementation AMPCoreUILibrary

void *__AMPCoreUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AMPCoreUI.framework/AMPCoreUI", 2);
  AMPCoreUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
