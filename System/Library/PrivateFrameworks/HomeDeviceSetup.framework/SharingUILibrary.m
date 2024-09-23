@implementation SharingUILibrary

void *__SharingUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/SharingUI.framework/SharingUI", 2);
  SharingUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
