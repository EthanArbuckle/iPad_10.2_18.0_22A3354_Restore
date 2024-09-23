@implementation EmailLibrary

void *__EmailLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Email.framework/Email", 2);
  EmailLibrary_sLib = (uint64_t)result;
  return result;
}

@end
