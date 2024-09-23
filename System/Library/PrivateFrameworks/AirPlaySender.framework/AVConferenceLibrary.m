@implementation AVConferenceLibrary

void *__AVConferenceLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AVConference.framework/AVConference", 2);
  AVConferenceLibrary_sLib = (uint64_t)result;
  return result;
}

@end
