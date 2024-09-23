@implementation EasyConfigLibrary

void *__EasyConfigLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/EasyConfig.framework/EasyConfig", 2);
  EasyConfigLibrary_sLib = (uint64_t)result;
  return result;
}

@end
