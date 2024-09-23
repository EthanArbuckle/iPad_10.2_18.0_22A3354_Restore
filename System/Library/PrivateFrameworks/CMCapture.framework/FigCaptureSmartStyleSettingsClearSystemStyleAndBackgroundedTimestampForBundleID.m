@implementation FigCaptureSmartStyleSettingsClearSystemStyleAndBackgroundedTimestampForBundleID

uint64_t __FigCaptureSmartStyleSettingsClearSystemStyleAndBackgroundedTimestampForBundleID_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nonpersisting-global/%@systemstyle-backgrounded-timestamp"), fsss_prefixedSystemStylePreferenceKeyForBundleID(*(__CFString **)(a1 + 32)));
  v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@systemstyle"), fsss_prefixedSystemStylePreferenceKeyForBundleID(*(__CFString **)(a1 + 32)));
  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(v2, 0, CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSetValue(v3, 0, CFSTR("com.apple.cameracapture"), v4, v5);
  return CFPreferencesSynchronize(CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B250], v5);
}

@end
