@implementation CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption

uint64_t ___CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("NSShowNonLocalizedStrings"), CFSTR("kCFPreferencesCurrentApplication"), 0);
  _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_capitalize = (_DWORD)result != 0;
  return result;
}

void ___CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_block_invoke_9()
{
  const __CFString *v0;
  const __CFString *v1;
  CFTypeID v2;

  if (CFPreferencesGetAppBooleanValue(CFSTR("NSDoubleLocalizedStrings"), CFSTR("kCFPreferencesCurrentApplication"), 0))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_doubleStrings = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("NSForceRightToLeftLocalizedStrings"), CFSTR("kCFPreferencesCurrentApplication"), 0))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_forceRightToLeftStrings = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("NSAccentuateLocalizedStrings"), CFSTR("kCFPreferencesCurrentApplication"), 0))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_accentuateStrings = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("NSSurroundLocalizedStrings"), CFSTR("kCFPreferencesCurrentApplication"), 0))
  {
    _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_surroundStrings = 1;
  }
  v0 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("NSTallLocalizedStrings"), CFSTR("kCFPreferencesCurrentApplication"));
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      if (CFStringGetLength(v1))
        _CFBundleCopyLocalizedStringForLocalizationTableURLAndMarkdownOption_tallStrings = 1;
    }
    CFRelease(v1);
  }
}

@end
