@implementation MediaRemoteLibrary

void *__MediaRemoteLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MediaRemote.framework/MediaRemote", 2);
  MediaRemoteLibrary_sLib = (uint64_t)result;
  return result;
}

@end
