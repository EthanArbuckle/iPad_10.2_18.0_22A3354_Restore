@implementation SharingLibrary

void *__SharingLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib = (uint64_t)result;
  return result;
}

@end
