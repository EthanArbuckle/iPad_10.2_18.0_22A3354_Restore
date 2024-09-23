@implementation SetupAssistantLibrary

void *__SetupAssistantLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  SetupAssistantLibrary_sLib = (uint64_t)result;
  return result;
}

@end
