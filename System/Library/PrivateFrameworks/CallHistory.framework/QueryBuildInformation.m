@implementation QueryBuildInformation

void ___QueryBuildInformation_block_invoke()
{
  CFArrayRef v0;
  CFArrayRef v1;
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *Value;
  const void *v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFTypeID v9;
  __int128 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = xmmword_1E6747308;
  v11 = CFSTR("ReleaseType");
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&v10, 3, MEMORY[0x1E0C9B378]);
  if (v0)
  {
    v1 = v0;
    v2 = (const __CFDictionary *)MGCopyMultipleAnswers();
    if (v2)
    {
      v3 = v2;
      Value = CFDictionaryGetValue(v2, CFSTR("CarrierInstallCapability"));
      v5 = (const void *)*MEMORY[0x1E0C9AE50];
      _IsCarrierBuildCached = Value == (const void *)*MEMORY[0x1E0C9AE50];
      v6 = CFDictionaryGetValue(v3, CFSTR("InternalBuild"));
      _IsInternalBuildCached = v6 == v5;
      if (v6 != v5)
      {
        v7 = (const __CFString *)CFDictionaryGetValue(v3, CFSTR("ReleaseType"));
        if (v7)
        {
          v8 = v7;
          v9 = CFGetTypeID(v7);
          if (v9 == CFStringGetTypeID() && CFStringCompare(v8, CFSTR("Desense"), 0) == kCFCompareEqualTo)
            _IsInternalBuildCached = 1;
        }
      }
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

@end
