@implementation ANEQoSMapper

void *__softLinkClass_ANEQoSMapper_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "OBJC_CLASS_$__ANEQoSMapper");
  softLinkClass_ANEQoSMapper_softLinkClass_ANEQoSMapper = (uint64_t)result;
  return result;
}

@end
