@implementation CGColorTransformGetSceneReferredToneMappingDefaultOptions

CFDictionaryRef __CGColorTransformGetSceneReferredToneMappingDefaultOptions_block_invoke()
{
  CFDictionaryRef result;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  values = (void *)*MEMORY[0x1E0C9AE50];
  keys[0] = CFSTR("kCGApplySceneReferredExtendedRangeToneMapping");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CGColorTransformGetSceneReferredToneMappingDefaultOptions_sceneReferredToneMappingOptions = (uint64_t)result;
  return result;
}

@end
