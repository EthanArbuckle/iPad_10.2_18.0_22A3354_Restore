@implementation CGFlexLumaToneMappingGetDefaultOptions

void __CGFlexLumaToneMappingGetDefaultOptions_block_invoke()
{
  CFDictionaryRef v0;
  CFNumberRef valuePtr;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  keys[0] = CFSTR("kCGFlexGTCTargetHeadroom");
  LODWORD(valuePtr) = 1065353216;
  valuePtr = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  v0 = CFDictionaryCreate(0, (const void **)keys, (const void **)&valuePtr, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (valuePtr)
    CFRelease(valuePtr);
  valuePtr = v0;
  keys[0] = CFSTR("kCGApplyFlexLumaScaling");
  CGFlexLumaToneMappingGetDefaultOptions_options = (uint64_t)CFDictionaryCreate(0, (const void **)keys, (const void **)&valuePtr, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v0)
    CFRelease(v0);
}

@end
