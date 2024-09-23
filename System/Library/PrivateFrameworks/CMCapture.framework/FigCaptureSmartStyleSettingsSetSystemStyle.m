@implementation FigCaptureSmartStyleSettingsSetSystemStyle

uint64_t __FigCaptureSmartStyleSettingsSetSystemStyle_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const void *v7;
  const __CFString *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@systemstyle"), fsss_prefixedSystemStylePreferenceKeyForBundleID(*(__CFString **)(a1 + 32)));
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v10[0] = CFSTR("CastType");
    v11[0] = objc_msgSend(v3, "cast");
    v10[1] = CFSTR("CastIntensity");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "intensity");
    v11[1] = objc_msgSend(v4, "numberWithFloat:");
    v10[2] = CFSTR("ToneBias");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "toneBias");
    v11[2] = objc_msgSend(v5, "numberWithFloat:");
    v10[3] = CFSTR("ColorBias");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "colorBias");
    v11[3] = objc_msgSend(v6, "numberWithFloat:");
    v7 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  }
  else
  {
    v7 = 0;
  }
  v8 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(v2, v7, CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  return CFPreferencesSynchronize(CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B250], v8);
}

@end
