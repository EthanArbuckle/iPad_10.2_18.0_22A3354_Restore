@implementation ANEIOSurfaceObject

void *__softLinkClass_ANEIOSurfaceObject_block_invoke()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken, &__block_literal_global_23);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary, "OBJC_CLASS_$__ANEIOSurfaceObject");
  softLinkClass_ANEIOSurfaceObject_softLinkClass_ANEIOSurfaceObject = (uint64_t)result;
  return result;
}

void *__softLinkClass_ANEIOSurfaceObject_block_invoke_0()
{
  void *result;

  if (AppleNeuralEngineLibrary_onceToken_1 != -1)
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_180);
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "OBJC_CLASS_$__ANEIOSurfaceObject");
  softLinkClass_ANEIOSurfaceObject_softLinkClass_ANEIOSurfaceObject_0 = (uint64_t)result;
  return result;
}

@end
