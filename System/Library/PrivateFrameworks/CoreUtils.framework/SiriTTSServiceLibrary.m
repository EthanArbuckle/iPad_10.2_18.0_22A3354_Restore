@implementation SiriTTSServiceLibrary

void *__SiriTTSServiceLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SiriTTSService.framework/SiriTTSService", 2);
  SiriTTSServiceLibrary_sLib = (uint64_t)result;
  return result;
}

@end
