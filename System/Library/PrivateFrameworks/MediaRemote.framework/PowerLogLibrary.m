@implementation PowerLogLibrary

void *__PowerLogLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PowerLog.framework/PowerLog", 2);
  PowerLogLibrary_sLib = (uint64_t)result;
  return result;
}

@end
