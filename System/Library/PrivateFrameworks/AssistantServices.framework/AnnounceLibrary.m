@implementation AnnounceLibrary

void *__AnnounceLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Announce.framework/Announce", 2);
  AnnounceLibrary_sLib = (uint64_t)result;
  return result;
}

void *__AnnounceLibrary_block_invoke_38143()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Announce.framework/Announce", 2);
  AnnounceLibrary_sLib_38141 = (uint64_t)result;
  return result;
}

@end
