@implementation VoiceTriggerLibrary

void *__VoiceTriggerLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/VoiceTrigger.framework/VoiceTrigger", 2);
  VoiceTriggerLibrary_sLib = (uint64_t)result;
  return result;
}

void *__VoiceTriggerLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/VoiceTrigger.framework/VoiceTrigger", 2);
  VoiceTriggerLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end
