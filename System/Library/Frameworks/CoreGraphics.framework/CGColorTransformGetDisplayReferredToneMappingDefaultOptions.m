@implementation CGColorTransformGetDisplayReferredToneMappingDefaultOptions

void __CGColorTransformGetDisplayReferredToneMappingDefaultOptions_block_invoke()
{
  CFNumberRef v0;
  const void *v1;
  const __CFAllocator *v2;
  const CFDictionaryKeyCallBacks *v3;
  const CFDictionaryValueCallBacks *v4;
  int v5;
  CFNumberRef valuePtr;
  CFTypeRef cf;
  CFTypeRef v8;
  CFTypeRef v9;
  void *keys[3];
  const void *v11[2];

  v11[1] = *(const void **)MEMORY[0x1E0C80C00];
  keys[0] = CFSTR("kCGPQEOTFOpticalScale");
  keys[1] = CFSTR("kCGTargetDisplayWhite");
  keys[2] = CFSTR("kCGEXRReflectanceScale");
  v11[0] = CFSTR("kCGApplyDisplayReferredExtendedRangeToneMapping");
  LODWORD(valuePtr) = 1120403456;
  valuePtr = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  v5 = 1120403456;
  cf = CFNumberCreate(0, kCFNumberFloatType, &v5);
  v5 = 1063675494;
  v0 = CFNumberCreate(0, kCFNumberFloatType, &v5);
  v1 = (const void *)*MEMORY[0x1E0C9B0D0];
  v8 = v0;
  v9 = v1;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v4 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&valuePtr, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CGColorTransformGetDisplayReferredToneMappingDefaultOptions_displayReferredToneMappingOptions = (uint64_t)CFDictionaryCreate(v2, v11, &v9, 1, v3, v4);
  CFRelease(valuePtr);
  CFRelease(cf);
  CFRelease(v8);
  CFRelease(v9);
}

@end
