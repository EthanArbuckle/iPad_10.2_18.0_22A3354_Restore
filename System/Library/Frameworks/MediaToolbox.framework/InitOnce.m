@implementation InitOnce

void __assetPALoggingHelper_InitOnce_block_invoke()
{
  CFPropertyListRef v0;

  if (!PrivacyAccountingLibraryCore_frameworkLibrary)
    PrivacyAccountingLibraryCore_frameworkLibrary = _sl_dlopen();
  s_PAFrameworkAvailable = PrivacyAccountingLibraryCore_frameworkLibrary != 0;
  if (PrivacyAccountingLibraryCore_frameworkLibrary)
  {
    v0 = CFPreferencesCopyAppValue(CFSTR("usestubpaapplication"), CFSTR("com.apple.coremedia"));
    s_shouldUseStubPAApplication = FigCFEqual();
    if (v0)
      CFRelease(v0);
  }
}

@end
