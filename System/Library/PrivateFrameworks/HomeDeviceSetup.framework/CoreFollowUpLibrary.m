@implementation CoreFollowUpLibrary

void *__CoreFollowUpLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/CoreFollowUp.framework/CoreFollowUp", 2);
  CoreFollowUpLibrary_sLib = (uint64_t)result;
  return result;
}

@end
