@implementation GetShapeEffectCIContextOptions

void __GetShapeEffectCIContextOptions_block_invoke()
{
  __CFDictionary *Mutable;
  CFBooleanRef v1;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, CFSTR("CoreUI"), &__kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kCIContextWorkingColorSpace, kCFNull);
  CFDictionaryAddValue(Mutable, kCIContextCacheIntermediates, kCFBooleanFalse);
  if (_CUIDebugAllowHardwareRendering())
    v1 = kCFBooleanFalse;
  else
    v1 = (CFBooleanRef)&unk_1E41DD070;
  CFDictionaryAddValue(Mutable, kCIContextUseSoftwareRenderer, v1);
  gCIContextOptions = (uint64_t)Mutable;
}

@end
