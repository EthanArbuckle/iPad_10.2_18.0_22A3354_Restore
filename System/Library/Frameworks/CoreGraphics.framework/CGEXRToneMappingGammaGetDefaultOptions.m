@implementation CGEXRToneMappingGammaGetDefaultOptions

void __CGEXRToneMappingGammaGetDefaultOptions_block_invoke()
{
  CFDictionaryRef v0;
  uint64_t i;
  const void *v2;
  CFDictionaryRef v3;
  void *v4;
  const void *valuePtr[4];
  void *keys[2];
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E165F4E8;
  v7 = *(_OWORD *)off_1E165F4F8;
  LODWORD(valuePtr[0]) = 0;
  valuePtr[0] = CFNumberCreate(0, kCFNumberFloatType, valuePtr);
  LODWORD(v4) = 0;
  valuePtr[1] = CFNumberCreate(0, kCFNumberIntType, &v4);
  LODWORD(v4) = 0;
  valuePtr[2] = CFNumberCreate(0, kCFNumberFloatType, &v4);
  LODWORD(v4) = 1084227584;
  valuePtr[3] = CFNumberCreate(0, kCFNumberFloatType, &v4);
  v0 = CFDictionaryCreate(0, (const void **)keys, valuePtr, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  for (i = 0; i != 4; ++i)
  {
    v2 = valuePtr[i];
    if (v2)
      CFRelease(v2);
  }
  v3 = v0;
  v4 = CFSTR("kCGApplyEXRToneMappingGamma");
  CGEXRToneMappingGammaGetDefaultOptions_exrToneMappingOptions = (uint64_t)CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v4, (const void **)&v3, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFRelease(v0);
}

@end
