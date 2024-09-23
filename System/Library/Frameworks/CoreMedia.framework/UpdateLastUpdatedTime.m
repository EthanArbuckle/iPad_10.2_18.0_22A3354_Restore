@implementation UpdateLastUpdatedTime

void __figMobileAsset_UpdateLastUpdatedTime_block_invoke(uint64_t a1)
{
  CFAbsoluteTime *Value;
  const __CFString *v3;
  const __CFString *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID v7;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v9;
  const void *v10;

  if (figMobileAsset_IsAssetTypeRegistered(*(void **)(a1 + 32)))
  {
    Value = (CFAbsoluteTime *)CFDictionaryGetValue((CFDictionaryRef)gRegisteredAssetTypes, *(const void **)(a1 + 32));
    Value[5] = CFAbsoluteTimeGetCurrent();
    v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
    v5 = (const __CFDictionary *)CFPreferencesCopyValue(CFSTR("mobileAssetUpdateTimes"), CFSTR("com.apple.celestial"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v6 = v5;
    if (v5 && (v7 = CFGetTypeID(v5), v7 == CFDictionaryGetTypeID()))
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v6);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v9 = MutableCopy;
    FigCFDictionarySetDouble(MutableCopy, *(const void **)(a1 + 32), Value[5]);
    CFPreferencesSetValue(CFSTR("mobileAssetUpdateTimes"), v9, CFSTR("com.apple.celestial"), v3, v4);
    CFPreferencesSynchronize(CFSTR("com.apple.celestial"), v3, v4);
  }
  else
  {
    v6 = 0;
    v9 = 0;
  }
  v10 = *(const void **)(a1 + 32);
  if (v10)
    CFRelease(v10);
  if (v6)
    CFRelease(v6);
  if (v9)
    CFRelease(v9);
}

@end
