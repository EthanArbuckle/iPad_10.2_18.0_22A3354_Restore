@implementation FigCaptureSmartStyleSettingsGetSystemStyleBackgroundedTimestamp

CFPropertyListRef __FigCaptureSmartStyleSettingsGetSystemStyleBackgroundedTimestamp_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  CFPropertyListRef result;

  v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("nonpersisting-global/%@systemstyle-backgrounded-timestamp"), fsss_prefixedSystemStylePreferenceKeyForBundleID(*(__CFString **)(a1 + 32)));
  result = CFPreferencesCopyValue(v2, CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
