@implementation ANEInMemoryModelDescriptor

void *__softLinkClass_ANEInMemoryModelDescriptor_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "OBJC_CLASS_$__ANEInMemoryModelDescriptor");
  softLinkClass_ANEInMemoryModelDescriptor_softLinkClass_ANEInMemoryModelDescriptor = (uint64_t)result;
  return result;
}

@end
