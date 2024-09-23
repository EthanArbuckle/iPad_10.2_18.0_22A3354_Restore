@implementation LoadSetupAssistant

void *__LoadSetupAssistant_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  LoadSetupAssistant_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
