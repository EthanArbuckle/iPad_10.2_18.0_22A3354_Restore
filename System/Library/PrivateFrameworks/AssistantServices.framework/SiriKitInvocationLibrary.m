@implementation SiriKitInvocationLibrary

void *__SiriKitInvocationLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SiriKitInvocation.framework/SiriKitInvocation", 2);
  SiriKitInvocationLibrary_sLib = (uint64_t)result;
  return result;
}

@end
