@implementation FigCaptureSmartStyleSettingsSetSystemStyleBackgroundedTimestamp

uint64_t __FigCaptureSmartStyleSettingsSetSystemStyleBackgroundedTimestamp_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nonpersisting-global/%@systemstyle-backgrounded-timestamp"), fsss_prefixedSystemStylePreferenceKeyForBundleID(*(__CFString **)(a1 + 32)));
  v3 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(v2, *(CFPropertyListRef *)(a1 + 40), CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  return CFPreferencesSynchronize(CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B250], v3);
}

@end
