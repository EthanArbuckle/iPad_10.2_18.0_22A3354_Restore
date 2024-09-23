@implementation CGReferenceWhiteToneMappingGetDefaultOptions

void __CGReferenceWhiteToneMappingGetDefaultOptions_block_invoke()
{
  CFDictionaryRef v0;
  uint64_t i;
  const void *v2;
  int v3;
  const void *valuePtr[5];
  void *keys[2];
  __int128 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E16329B0;
  v6 = *(_OWORD *)off_1E16329C0;
  v7 = CFSTR("kCGRWTMReferenceWhiteThreshold");
  LODWORD(valuePtr[0]) = 1148846080;
  valuePtr[0] = CFNumberCreate(0, kCFNumberFloatType, valuePtr);
  v3 = 1128988672;
  valuePtr[1] = CFNumberCreate(0, kCFNumberFloatType, &v3);
  v3 = 1065353216;
  valuePtr[2] = CFNumberCreate(0, kCFNumberFloatType, &v3);
  v3 = 1056964608;
  valuePtr[3] = CFNumberCreate(0, kCFNumberFloatType, &v3);
  v3 = 1076538027;
  valuePtr[4] = CFNumberCreate(0, kCFNumberFloatType, &v3);
  v0 = CFDictionaryCreate(0, (const void **)keys, valuePtr, 5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  for (i = 0; i != 5; ++i)
  {
    v2 = valuePtr[i];
    if (v2)
      CFRelease(v2);
  }
  keys[0] = CFSTR("kCGApplyReferenceWhiteToneMapping");
  valuePtr[0] = v0;
  CGReferenceWhiteToneMappingGetDefaultOptions_options = (uint64_t)CFDictionaryCreate(0, (const void **)keys, valuePtr, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v0)
    CFRelease(v0);
}

@end
