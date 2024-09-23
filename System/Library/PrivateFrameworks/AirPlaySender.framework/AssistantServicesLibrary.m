@implementation AssistantServicesLibrary

void *__AssistantServicesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AssistantServices.framework/AssistantServices", 2);
  AssistantServicesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
