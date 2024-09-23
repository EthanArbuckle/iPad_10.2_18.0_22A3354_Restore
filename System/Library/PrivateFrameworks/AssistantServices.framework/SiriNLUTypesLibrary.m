@implementation SiriNLUTypesLibrary

void *__SiriNLUTypesLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/SiriNLUTypes.framework/SiriNLUTypes", 2);
  SiriNLUTypesLibrary_sLib = (uint64_t)result;
  return result;
}

@end
