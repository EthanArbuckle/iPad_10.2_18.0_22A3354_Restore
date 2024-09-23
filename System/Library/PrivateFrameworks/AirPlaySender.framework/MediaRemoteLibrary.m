@implementation MediaRemoteLibrary

void *__MediaRemoteLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MediaRemote.framework/MediaRemote", 2);
  MediaRemoteLibrary_sLib = (uint64_t)result;
  return result;
}

void *__MediaRemoteLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MediaRemote.framework/MediaRemote", 2);
  MediaRemoteLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void *__MediaRemoteLibrary_block_invoke_1()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/MediaRemote.framework/MediaRemote", 2);
  MediaRemoteLibrary_sLib_1 = (uint64_t)result;
  return result;
}

@end
