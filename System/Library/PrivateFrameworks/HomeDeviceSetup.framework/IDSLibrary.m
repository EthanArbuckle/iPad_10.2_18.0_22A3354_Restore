@implementation IDSLibrary

void *__IDSLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/IDS.framework/IDS", 2);
  IDSLibrary_sLib = (uint64_t)result;
  return result;
}

@end
